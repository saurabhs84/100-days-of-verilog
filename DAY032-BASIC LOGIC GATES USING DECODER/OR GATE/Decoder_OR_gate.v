`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2025 11:37:48
// Design Name: 
// Module Name: Decoder_OR_gate
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

module decoder_2_4(
    input [1:0] i,
   	output reg[3:0] y);
	always@(i)
		begin
		y=0;
			case(i)	
					2'b00 : y[0] = 1'b1;
					2'b01 : y[1] = 1'b1;
					2'b10 : y[2] = 1'b1;
					2'b11 : y[3] = 1'b1;
			endcase
		end	
endmodule

module Decoder_OR_gate(
    input a,b,
    output or_g 
    );
    wire [3:0]w;
    decoder_2_4 orgate({a,b}, w);
    assign or_g= ~w[0];
endmodule
