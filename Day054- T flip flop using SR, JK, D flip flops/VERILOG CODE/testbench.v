`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2025 20:50:58
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
reg clk,rst,T;
wire Q_SR,Q_JK,Q_D;

T_Flip_Flop_using_SR_JK_D uut (.clk(clk),.rst(rst),.T(T),.Q_SR(Q_SR),.Q_JK(Q_JK),.Q_D(Q_D));

initial begin
clk=0;
rst=1;#10
rst=0;
end
always #5 clk=~clk;
initial  begin
$monitor ("time=%0.1t | clk=%b rst=%b T=%b Q_SR=%b Q_JK=%b Q_D=%b",$time,clk,rst,T,Q_SR,Q_JK,Q_D);
T=1'b1;#10
T=1'b1;#10
T=1'b0;#10
T=1'b0;#10
T=1'b1;#10
T=1'b0;#10
T=1'b1;#10
T=1'b1;#10
T=1'b0;#10
$finish;
end
endmodule
