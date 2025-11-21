`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2025 16:58:38
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

reg clk, reset;
wire [7:0] lfsr_out;

LFSR dut(
    .clk(clk),
    .reset(reset),
    .lfsr_out(lfsr_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #20 reset = 0;  
end

initial begin
    $monitor("Time=%0t | clk=%b | reset=%b | LFSR=%b",
              $time, clk, reset, lfsr_out);

    #200 $finish;
end

endmodule
