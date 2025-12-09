`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 17:17:02
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
reg clk,rst;
wire clk_0,clk_90,clk_180,clk_270;

clock_phase DUT (.clk(clk),.rst(rst),.clk_0(clk_0),
                 .clk_90(clk_90),.clk_180(clk_180),.clk_270(clk_270));

always #5 clk= ~clk;
initial begin
clk=0;
rst=1;
#10
rst=0;
#100
rst=1;
#20
rst=0;
#200
$finish;
end
endmodule
