`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 14:16:29
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

    reg clk, reset, in;
    wire out;

    fsm_1101_overlapping DUT (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
    $monitor ("clk=%b | reset=%b | in=%b | out=%b",clk,reset,in,out);
        clk = 0;
        reset = 1;
        in = 0;

        #10 reset = 0;

        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;   
        #10 in = 1;
        #10 in = 0;
        #10 in = 1; 

        #20 $finish;
    end

endmodule

