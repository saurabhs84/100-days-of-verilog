`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 11:49:15
// Design Name: 
// Module Name: BCD_2_EXCESS3
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

module BCD_2_EXCESS3(
    input [3:0] bcd_in,
    output reg [3:0] excess3_out
    );
    always@(bcd_in)
    begin
        case(bcd_in)
            4'b0000 : excess3_out = 4'b0011;
            4'b0001 : excess3_out = 4'b0100;
            4'b0010 : excess3_out = 4'b0101;
            4'b0011 : excess3_out = 4'b0110;
            4'b0100 : excess3_out = 4'b0111;
            4'b0101 : excess3_out = 4'b1000;
            4'b0110 : excess3_out = 4'b1001;
            4'b0111 : excess3_out = 4'b1010;
            4'b1000 : excess3_out = 4'b1011;
            4'b1001 : excess3_out = 4'b1100;
            4'b1010 : excess3_out = 4'b1101;
            4'b1011 : excess3_out = 4'b1110;
            4'b1100 : excess3_out = 4'b1111;
            default : excess3_out = 4'bxxxx;
        endcase
    end
endmodule
