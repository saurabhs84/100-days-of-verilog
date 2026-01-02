`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:32:17
// Design Name: 
// Module Name: PN3
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


module PN3;


integer i,j;

integer n=1;

initial begin

	for(i=0;i<=8;i=i+1)begin
	    for(j=0;j<=i;j=j+1)begin
		$write("%0d  ",n+i);
	    end
	  $display("");
	end
    end
endmodule
