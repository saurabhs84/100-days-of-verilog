`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2025 17:12:57
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

reg clk, rst, din;
wire y;

fsm_1011_moore dut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .y(y)
);

/* Clock generation */
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    din = 0;

    #10 rst = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1; 
   #10 din = 0;
    #10 din = 1;
    #10 din = 1;   

    #20 $finish;
end

initial begin
    $monitor("Time=%0t | din=%b | y=%b", $time, din, y);
end

endmodule
