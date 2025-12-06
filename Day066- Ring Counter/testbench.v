`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2025 16:18:01
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
parameter N=8;

reg clk, reset;
wire [N-1:0] Q;

ring_counter #(N) uut (.clk(clk), .reset(reset), .Q(Q));

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 reset = 1;
    #30 reset = 0;
    #200 $finish;
end

initial begin
    $monitor("time=%t | clk=%b | reset=%b | Q=%b", $time, clk, reset, Q);
end

endmodule
