`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 02:57:13
// Design Name: 
// Module Name: Car_Parking_System
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Car_Parking_System(
    input clk,rst,
    input sense_entry,        // Entry sensor (active high)
    input sense_exit,         // Exit sensor (active high)
    input [1:0] password_1,   // First password digit
    input [1:0] password_2,   // Second password digit
    output reg green_light,        // Green traffic light
    output reg red_light,          // Red traffic light
    output reg [6:0] hex_1,        // 7-segment display digit 1
    output reg [6:0] hex_2,        // 7-segment display digit 2
    output reg [3:0] space_available,  // Available parking spots
    output reg [3:0] space_utilized,   // Occupied parking spots
    output reg [3:0] count_cars        // Total cars entered (counter)
);

    localparam [3:0] TOTAL_SPACES = 4'd8;  // Total parking capacity
    localparam [1:0] CORRECT_PASS = 2'b01; // Correct password value
    localparam [1:0] WAIT_CYCLES = 2'd3;   // Wait time in clock cycles
    
    localparam [2:0] IDLE              = 3'b000;
    localparam [2:0] WAIT_PASSWORD     = 3'b001;
    localparam [2:0] PASSWORD_CORRECT  = 3'b010;
    localparam [2:0] PASSWORD_WRONG    = 3'b011;
    localparam [2:0] STOP_STATE        = 3'b100;
    
    localparam [6:0] SEG_0 = 7'b0111111;  
    localparam [6:0] SEG_E = 7'b1111001;  
    localparam [6:0] SEG_N = 7'b0110111;  
    localparam [6:0] SEG_G = 7'b1011111;  
    localparam [6:0] SEG_O = 7'b0111111;  
    localparam [6:0] SEG_R = 7'b0000101;  
    localparam [6:0] SEG_S = 7'b1101101;  
    localparam [6:0] SEG_P = 7'b1110011;  

    reg [2:0] current_state, next_state;
    reg [1:0] wait_counter;
    
    // Synchronized inputs (2-stage synchronizers)
    reg sense_entry_sync1, sense_entry_sync2;
    reg sense_exit_sync1, sense_exit_sync2;
    reg [1:0] password_1_sync;
    reg [1:0] password_2_sync;
    
    // Edge detection
    reg sense_entry_prev;
    reg sense_exit_prev;
    
    wire sense_entry_edge;
    wire sense_exit_edge;
    wire password_correct;
    reg [25:0] blink_counter;  
    reg blink_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sense_entry_sync1 <= 1'b0;
            sense_entry_sync2 <= 1'b0;
            sense_exit_sync1 <= 1'b0;
            sense_exit_sync2 <= 1'b0;
            password_1_sync <= 2'b00;
            password_2_sync <= 2'b00;
            sense_entry_prev <= 1'b0;
            sense_exit_prev <= 1'b0;
        end else begin
            // Two-stage synchronization
            sense_entry_sync1 <= sense_entry;
            sense_entry_sync2 <= sense_entry_sync1;
            
            sense_exit_sync1 <= sense_exit;
            sense_exit_sync2 <= sense_exit_sync1;
            
            password_1_sync <= password_1;
            password_2_sync <= password_2;
            
            // Edge detection
            sense_entry_prev <= sense_entry_sync2;
            sense_exit_prev <= sense_exit_sync2;
        end
    end
    
    // Rising edge detection
    assign sense_entry_edge = sense_entry_sync2 && !sense_entry_prev;
    assign sense_exit_edge = sense_exit_sync2 && !sense_exit_prev;
    
    // Password validation
    assign password_correct = (password_1_sync == CORRECT_PASS) && 
                             (password_2_sync == CORRECT_PASS);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            blink_counter <= 26'd0;
            blink_state <= 1'b0;
        end else begin
            if (blink_counter >= 26'd25000000) begin  // ~0.5s at 50MHz
                blink_counter <= 26'd0;
                blink_state <= ~blink_state;
            end else begin
                blink_counter <= blink_counter + 1'b1;
            end
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            wait_counter <= 2'b00;
        else begin
            if (current_state == WAIT_PASSWORD)
                wait_counter <= wait_counter + 2'b01;
            else
                wait_counter <= 2'b00;
        end
    end

    always @(*) begin
        next_state = current_state;  
        
        case (current_state)
            IDLE: begin
                if (sense_entry_edge && (space_available > 4'd0))
                    next_state = WAIT_PASSWORD;
            end
            WAIT_PASSWORD: begin
                if (wait_counter >= WAIT_CYCLES) begin
                    if (password_correct)
                        next_state = PASSWORD_CORRECT;
                    else
                        next_state = PASSWORD_WRONG;
                end
            end
            PASSWORD_CORRECT: begin
                if (sense_entry_edge && sense_exit_edge)
                    next_state = STOP_STATE;  
                else if (sense_exit_edge)
                    next_state = IDLE;      
                else if (!sense_entry_sync2)
                    next_state = IDLE;        
            end
            
            PASSWORD_WRONG: begin
                if (password_correct)
                    next_state = PASSWORD_CORRECT;
                else if (!sense_entry_sync2)
                    next_state = IDLE;        // Sensor cleared
            end
           
            STOP_STATE: begin
                if (password_correct && !sense_entry_sync2 && !sense_exit_sync2)
                    next_state = IDLE;
            end
           
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            space_available <= TOTAL_SPACES;
            space_utilized <= 4'd0;
            count_cars <= 4'd0;
        end else begin
            if (current_state == PASSWORD_CORRECT && 
                sense_entry_edge && 
                space_available > 4'd0) begin
                
                space_available <= space_available - 4'd1;
                space_utilized <= space_utilized + 4'd1;
                count_cars <= count_cars + 4'd1;
            end
            
            // Exit event (only in PASSWORD_CORRECT state or IDLE)
            else if ((current_state == PASSWORD_CORRECT || current_state == IDLE) && 
                     sense_exit_edge && 
                     space_utilized > 4'd0) begin
                
                space_available <= space_available + 4'd1;
                space_utilized <= space_utilized - 4'd1;
            end
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            green_light <= 1'b0;
            red_light <= 1'b0;
            hex_1 <= SEG_0;
            hex_2 <= SEG_0;
        end else begin
            case (current_state)
                IDLE: begin
                    green_light <= 1'b0;
                    red_light <= 1'b0;
                    hex_1 <= SEG_0;     
                    hex_2 <= SEG_0;
                end
               
                WAIT_PASSWORD: begin
                    green_light <= blink_state; 
                    red_light <= 1'b0;
                    hex_1 <= SEG_E;      // "EN" - Enter password
                    hex_2 <= SEG_N;
                end
                PASSWORD_CORRECT: begin
                    green_light <= 1'b1;
                    red_light <= 1'b0;
                    hex_1 <= SEG_G;      // "GO" - Proceed
                    hex_2 <= SEG_O;
                end
                PASSWORD_WRONG: begin
                    green_light <= 1'b0;
                    red_light <= 1'b1;
                    hex_1 <= SEG_E;      // "ER" - Error
                    hex_2 <= SEG_R;
                end
                STOP_STATE: begin
                    green_light <= 1'b0;
                    red_light <= blink_state; 
                    hex_1 <= SEG_S;      // "SP" - Stop
                    hex_2 <= SEG_P;
                end
               
                default: begin
                    green_light <= 1'b0;
                    red_light <= 1'b0;
                    hex_1 <= SEG_0;
                    hex_2 <= SEG_0;
                end
            endcase
        end
    end

endmodule