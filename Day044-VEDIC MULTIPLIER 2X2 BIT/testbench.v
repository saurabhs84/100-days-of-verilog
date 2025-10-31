`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2025 19:24:02
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
reg [1:0]A,B;
wire [3:0]out;

vedic_multiplier_2x2 uut (.A(A),.B(B),.out(out));
initial begin
$monitor("time=%t | %d x%d = %d",$time,A,B,out);
A=2'b10;B=2'b11;#10
A=2'b00;B=2'b10;#10
A=2'b10;B=2'b01;#10
A=2'b11;B=2'b11;#10
$finish;
end
endmodule
