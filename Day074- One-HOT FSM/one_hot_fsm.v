`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 15:32:36
// Design Name: 
// Module Name: one_hot_fsm
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

module one_hot_fsm (
    input clk,
    input reset,
    output reg [3:0] state,
    output reg [1:0] out
);

    parameter [3:0]
        IDLE   = 4'b0001,
        STATE1 = 4'b0010,
        STATE2 = 4'b0100,
        STATE3 = 4'b1000;
        
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else begin
            case (state)
                IDLE:   state <= STATE1;
                STATE1: state <= STATE2;
                STATE2: state <= STATE3;
                STATE3: state <= IDLE;
                default:state <= IDLE;
            endcase
        end
    end
    always @(*) begin
        case (state)
            IDLE:   out = 2'b00;
            STATE1: out = 2'b01;
            STATE2: out = 2'b10;
            STATE3: out = 2'b11;
            default:out = 2'b00;
        endcase
    end

endmodule

