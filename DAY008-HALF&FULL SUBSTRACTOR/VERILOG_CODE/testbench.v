`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 19:52:26
// Design Name: 
// Module Name: testbench
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


module testbench;
reg a,b;
wire diff,bout;
half_substractor uut (.a(a),.b(b),.diff(diff),.bout(bout));
initial begin
$monitor("time=%t | a=%b b=%b | diff=%d | bout=%b",$time,a,b,diff,bout);
a=0;b=0;#5
a=0;b=1;#5
a=1;b=0;#5
a=1;b=1;#30
$finish;

end
endmodule
