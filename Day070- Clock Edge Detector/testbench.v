`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 11:23:54
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
wire  posedge_clk,negedge_clk,dual_edge_clk;

clk_edge_detector uut (.clk(clk),.rst(rst),.posedge_clk(posedge_clk),.negedge_clk(negedge_clk),.dual_edge_clk(dual_edge_clk));

always #5 clk=~clk;
initial begin
$monitor("clk=%d | posedge_clk=%b | negedge_clk=%b | dual_edge_clk=%b",clk,posedge_clk,negedge_clk,dual_edge_clk);
end
initial begin
clk=0;
rst=1;#10
rst=0;#100
rst=1;#20
rst=0;
#200
$finish;
end
endmodule
