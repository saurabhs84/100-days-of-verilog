`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 20:03:25
// Design Name: 
// Module Name: tb
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


module tb;
reg a,b,bin;
wire diff,bout;

full_substractor uut(.a(a),.b(b),.bin(bin),.diff(diff),.bout(bout));
initial begin
$monitor("time=%t | a=%b b=%b bin=%b diff=%b bout=%b",$time,a,b,bin,diff,bout);
a=0;b=0;bin=0;#10
a=0;b=0;bin=1;#10
a=0;b=1;bin=0;#10
a=0;b=1;bin=1;#10
a=1;b=0;bin=0;#10
a=1;b=0;bin=1;#10
a=1;b=1;bin=0;#10
a=1;b=1;bin=1;#120
$finish;
end
endmodule
