`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2025 12:28:48
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

reg clk, reset, din;
wire y;

    dual_sequence_detector DUT (
        .clk(clk),
        .reset(reset),
        .din(din),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        din = 0;

        #10 reset = 0;

        #10 din = 1;
        #10 din = 0;
        #10 din = 1;

        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 din = 0;

        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;

        #50 $finish;
    end

    initial begin
        $monitor("T=%0t | din=%b | y=%b", $time, din, y);
    end

endmodule

