`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 22:53:54
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
reg T,clk,rst;
wire Q;

T_Flip_Flop uut (.T(T),.clk(clk),.rst(rst),.Q(Q));
initial begin
clk=0;
rst=1'b1;#10
rst=1'b0;
end
always #5 clk = ~clk;

initial begin
$monitor("time=%t| reset=%b clk=%b T=%b Q=%b",$time,rst,clk,T,Q);
T=0;#10
T=1;#10
T=1;#10
T=0;#10
T=1;#10
T=0;#10
T=0;#10
T=1;#10
$finish;
end

endmodule
