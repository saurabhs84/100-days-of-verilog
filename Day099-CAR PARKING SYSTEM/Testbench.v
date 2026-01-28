`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 03:04:21
// Design Name: 
// Module Name: Testbench
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
`timescale 1ns / 1ps

/******************************************************************************
 * Testbench for Car Parking Management System
 * 
 * Test Scenarios:
 * 1. Normal entry with correct password
 * 2. Entry with wrong password
 * 3. Multiple car entries
 * 4. Car exit
 * 5. Parking full scenario
 * 6. Both sensors active (error condition)
 ******************************************************************************/

module Testbench;
    reg clk;
    reg rst;
    reg sense_entry;
    reg sense_exit;
    reg [1:0] password_1;
    reg [1:0] password_2;
    
    wire green_light;
    wire red_light;
    wire [6:0] hex_1;
    wire [6:0] hex_2;
    wire [3:0] space_available;
    wire [3:0] space_utilized;
    wire [3:0] count_cars;

    Car_Parking_System DUT (
        .clk(clk),
        .rst(rst),
        .sense_entry(sense_entry),
        .sense_exit(sense_exit),
        .password_1(password_1),
        .password_2(password_2),
        .green_light(green_light),
        .red_light(red_light),
        .hex_1(hex_1),
        .hex_2(hex_2),
        .space_available(space_available),
        .space_utilized(space_utilized),
        .count_cars(count_cars)
    );
    initial clk = 0;
    always #10 clk = ~clk;
    reg [20*8:1] state_name;
    always @(*) begin
        case (DUT.current_state)
            3'b000: state_name = "IDLE";
            3'b001: state_name = "WAIT_PASSWORD";
            3'b010: state_name = "PASSWORD_CORRECT";
            3'b011: state_name = "PASSWORD_WRONG";
            3'b100: state_name = "STOP_STATE";
            default: state_name = "UNKNOWN";
        endcase
    end

    function [15:0] decode_hex;
        input [6:0] hex1;
        input [6:0] hex2;
        begin
            case ({hex1, hex2})
                {7'b0111111, 7'b0111111}: decode_hex = "00";  // Idle
                {7'b1111001, 7'b0110111}: decode_hex = "EN";  // Enter
                {7'b1011111, 7'b0111111}: decode_hex = "GO";  // Go
                {7'b1111001, 7'b0000101}: decode_hex = "ER";  // Error
                {7'b1101101, 7'b1110011}: decode_hex = "SP";  // Stop
                default: decode_hex = "??";
            endcase
        end
    endfunction

    task car_entry;
        input [1:0] pass1;
        input [1:0] pass2;
        begin
            @(posedge clk);
            sense_entry = 1;
            password_1 = pass1;
            password_2 = pass2;
            $display("[%0t] 🚗 CAR APPROACHING - Password: %b%b", 
                     $time, pass1, pass2);
            
            repeat(10) @(posedge clk);
            
            sense_entry = 0;
            @(posedge clk);
        end
    endtask
    
    task car_exit;
        begin
            @(posedge clk);
            sense_exit = 1;
            $display("[%0t] 🚗 CAR EXITING", $time);
            
            repeat(5) @(posedge clk);
            
            sense_exit = 0;
            @(posedge clk);
        end
    endtask
    
    task display_status;
        begin
            $display(" State: %s | Lights: G=%b R=%b | Display: %s",
                     state_name, green_light, red_light, 
                     decode_hex(hex_1, hex_2));
            $display("   Available: %0d | Utilized: %0d | Total Cars: %0d",
                     space_available, space_utilized, count_cars);
        end
    endtask
    initial begin
        rst = 1;
        sense_entry = 0;
        sense_exit = 0;
        password_1 = 2'b00;
        password_2 = 2'b00;

        // Create waveform dump
        $dumpfile("parking_system.vcd");
        $dumpvars(0, Car_Parking_System);
        $display("\n Total Parking Capacity: 8 spaces");
        $display(" Correct Password: 01-01\n");

        #100;
        rst = 0;
        #50;
        
        display_status();
        
        car_entry(2'b01, 2'b01);
        #100;
        display_status();
        
        car_entry(2'b10, 2'b10);
        #100;
        display_status();
        
        // Retry with correct password
        $display("\n  Retrying with correct password...");
        password_1 = 2'b01;
        password_2 = 2'b01;
        #100;
        display_status();
        
        repeat(5) begin
            #100;
            car_entry(2'b01, 2'b01);
            #100;
            display_status();
        end
        
        repeat(2) begin
            #100;
            car_exit();
            #100;
            display_status();
        end
      
        
        // Fill remaining spaces
        while (space_available > 0) begin
            #100;
            car_entry(2'b01, 2'b01);
            #100;
            display_status();
        end
        
        $display("\n Attempting entry when parking is FULL...");
        #100;
        car_entry(2'b01, 2'b01);
        #100;
        display_status();
        
        @(posedge clk);
        sense_entry = 1;
        sense_exit = 1;
        password_1 = 2'b01;
        password_2 = 2'b01;
        $display("[%0t   BOTH SENSORS ACTIVE - Error Condition", $time);
        
        repeat(10) @(posedge clk);
        display_status();
        
        sense_entry = 0;
        sense_exit = 0;
        #100;
        
        $display("[%0t  RESETTING SYSTEM...", $time);
        rst = 1;
        #100;
        rst = 0;
        #50;
        display_status();

        #200;
        
        $finish;
    end

    initial begin
        $monitor("T=%0t | State=%s | G=%b R=%b | Avail=%0d Used=%0d Cars=%0d", 
                 $time, state_name, green_light, red_light,
                 space_available, space_utilized, count_cars);
    end
    initial begin
        #500000;
        $display("\n ERROR: Simulation timeout!");
        $finish;
    end

endmodule
