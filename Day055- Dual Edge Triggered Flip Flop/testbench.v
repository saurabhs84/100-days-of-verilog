`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2025 22:06:49
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
reg clk,reset,D;
wire q;

dual_edge_trig_ff uut (.clk(clk),.reset(reset),.D(D),.q(q));

initial begin
clk=0;
reset=1'b1;#10
reset=0;
end
always #5 clk=~clk;

initial begin
$monitor("time=%0.1t | reset=%b clk=%b D=%b q=%b",$time,reset,clk,D,q);
D=1'b1;#10
D=1'b1;#10
D=1'b0;#10
D=1'b1;#10
D=1'b1;#10
D=1'b0;#10
D=1'b0;#10
D=1'b1;#10
D=1'b1;#10
D=1'b0;#10
$finish;
end
endmodule
