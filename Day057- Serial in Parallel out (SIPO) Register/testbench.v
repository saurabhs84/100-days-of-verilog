`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2025 17:19:58
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
reg clk, reset, serial_in;
wire [2:0] parallel_out;

sipo dut(clk, reset, serial_in, parallel_out);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    serial_in = 0;

    #12 reset = 0;       // reset so that it aligns near clock edge

    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 0;
end

initial begin
    $monitor("t=%0t clk=%b reset=%b serial=%b parallel=%b",
             $time, clk, reset, serial_in, parallel_out);
    #200 $finish;
end
endmodule
