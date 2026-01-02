`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:36:42
// Design Name: 
// Module Name: PS1
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


module PS1;


integer i,j;

initial begin

    for(i=1; i<10; i=i+1) begin
        for(j=1; j<=i; j=j+1) begin
		$write("*");
	  end
	$display("");
	end
    end
endmodule
