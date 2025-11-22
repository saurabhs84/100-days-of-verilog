`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2025 22:17:43
// Design Name: 
// Module Name: Universal_Shift_Register
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

module Universal_Shift_Register (
    input clk,
    input reset,
    input [1:0] mode,        
    input serial_in_left,    
    input serial_in_right,    
    input [3:0] parallel_in, 
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;
        end 
        else begin
            case (mode)
                2'b00: q <= q;                                     
                2'b01: q <= {serial_in_right, q[3:1]};                
                2'b10: q <= {q[2:0], serial_in_left};               
                2'b11: q <= parallel_in;                              
                default: q <= q;
            endcase
        end
    end

endmodule

