`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2025 19:27:27
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
reg [3:0]A,B;
wire [7:0]product;

vedic_multiplier_4x4_using_2x2 uut (.A(A),.B(B),.product(product));

initial begin
$monitor("time=%0.2t | %d x %d = %d ",$time,A,B,product);

A=4'b0100;B=4'b1100;#10
A=4'b0110;B=4'b1110;#10
A=4'b0100;B=4'b1000;#10
A=4'b1011;B=4'b1100;#10
A=4'b0110;B=4'b1111;#10
$finish;
end
endmodule
