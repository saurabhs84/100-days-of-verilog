`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:34:42
// Design Name: 
// Module Name: PN4
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


module PN4;

integer i,j;

integer n=1;

initial begin

	for(i=0;i<=9;i=i+1)begin
	    for(j=0;j<9-i;j=j+1)begin
		$write("%0d  ",n+i);
	    end
	  $display("");
	end
    end
endmodule
