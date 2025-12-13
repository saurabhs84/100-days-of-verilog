`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2025 15:23:26
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
wire clk_by5;

freq_div_by5 uut (.clk(clk),.reset(reset),.clk_by5(clk_by5));

initial begin
clk= 1'b0;
forever #10 clk= ~clk;
end

initial begin
reset= 1'b1;
#20
reset= 1'b0;
#380 $finish;
end

endmodule
