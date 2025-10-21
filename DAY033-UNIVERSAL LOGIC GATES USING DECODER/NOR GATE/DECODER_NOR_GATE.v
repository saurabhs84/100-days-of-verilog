`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2025 17:20:46
// Design Name: 
// Module Name: DECODER_NOR_GATE
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

module DECODER_NOR_GATE (
    input a,b,
    output nor_g 
    );
    wire [3:0]w;
    decoder_2_4 norgate({a,b}, w);
    assign nor_g= w[0];
endmodule
