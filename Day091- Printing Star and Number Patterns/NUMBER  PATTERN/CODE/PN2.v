`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 12:01:22
// Design Name: 
// Module Name: PN1
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


module PN2;

integer i,j;
initial begin
for(i=0;i <=10 ; i=i+1) begin
for(j=1;j <=10-i ; j = j+1) begin
$write ("%0d ",j);
end

$display ("");
end
end
endmodule
