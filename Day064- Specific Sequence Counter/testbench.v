`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2025 10:57:59
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

`timescale 1ns / 1ps

module testbench;

reg clk;
reg reset;
wire [3:0] out;

sequence_counter dut (
    .clk(clk),
    .reset(reset),
    .out(out)
);

always #5 clk = ~clk;     

initial begin
    clk = 0;
    reset = 1;
    #20;
    
    reset = 0;

    #200;

    $display("Simulation Completed");
    $finish;
end
initial begin
    $monitor("Time=%0t  CLK=%b  RESET=%b  OUT=%d (Binary=%b)",
              $time, clk, reset, out, out);
end

endmodule

