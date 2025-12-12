`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2025 16:27:48
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
wire clk_by4;

freq_div_by4 DUT (.clk(clk),.reset(reset),.clk_by4(clk_by4));

initial begin
clk= 1'b0;
forever #10 clk= ~clk;
end
initial begin
reset= 1'b1;
#20
reset= 1'b0;
#220 $finish;
end
endmodule
