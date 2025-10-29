`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2025 17:04:36
// Design Name: 
// Module Name: BCD_to_7SegmentDisplay
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


module BCD_to_7SegmentDisplay(
input [3:0]BCD,
output reg [6:0]seg

    );
    
    always @(*) begin
    case(BCD)
    4'b0000: seg=8'b1111110;
    4'b0001: seg=8'b0110000;
    4'b0010: seg=8'b1101101;
    4'b0011: seg=8'b1111001;
    4'b0100: seg=8'b0110011;
    4'b0101: seg=8'b1011011;
    4'b0110: seg=8'b1011110;
    4'b0111: seg=8'b1110000;
    4'b1000: seg=8'b1111110;
    4'b1001: seg=8'b1111011;
    endcase
    end
endmodule
