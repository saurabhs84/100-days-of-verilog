`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:38:42
// Design Name: 
// Module Name: PS2
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


module PS2;
integer i,j;

initial begin

	for(i=1;i<10;i=i+1)begin
	    for(j=1;j<10-i;j=j+1)begin
		$write("*");
	    end
	  $display("");
	end
    end
endmodule
