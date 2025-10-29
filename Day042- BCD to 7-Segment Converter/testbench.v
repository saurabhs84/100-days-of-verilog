`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2025 17:13:42
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
reg [3:0]BCD;
wire [6:0]seg;

BCD_to_7SegmentDisplay uut (.BCD(BCD),.seg(seg));
initial begin
$monitor("time=%t | BCD=%b | seg=%b ",$time , BCD ,seg);

BCD=4'b1000;#10
BCD=4'b0100;#10
BCD=4'b0110;#10
BCD=4'b0101;#10
BCD=4'b0000;#10
BCD=4'b0001;#10
BCD=4'b0111;#10
$finish;
end
endmodule
