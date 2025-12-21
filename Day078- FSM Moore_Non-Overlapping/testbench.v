`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:03:27
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
    wire Z;

    fsm_1011_moore_non_overlapping DUT (
        .clk(clk),
        .reset(reset),
        .din(din),
        .Z(Z)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("time=%0t | clk=%b din=%b Z=%b",
                  $time, clk, din, Z);
    end

    initial begin
      
        clk = 0;
        reset = 1;
        din = 0;

        #12 reset = 0;  
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;  
        #10 din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;   

        #20 $finish;
    end

endmodule
