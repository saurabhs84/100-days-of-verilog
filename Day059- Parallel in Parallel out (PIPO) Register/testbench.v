`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2025 16:26:07
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
reg clk,reset;
reg [2:0]parallel_in;
wire [2:0]parallel_out;

pipo dut (.clk(clk),.reset(reset),.parallel_in(parallel_in),.parallel_out(parallel_out));

initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
parallel_in=0;
#12 reset=0;
$monitor("time=%0.1t | clk=%b reset=%b parallel_in=%b parallel_out=%b",$time,clk,reset,parallel_in,parallel_out);

parallel_in=3'b001;#10
parallel_in=3'b101;#10
parallel_in=3'b011;#10
parallel_in=3'b110;#10
parallel_in=3'b11;#10
$finish;
end
endmodule
