`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 15:38:23
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
reg clk;
reg reset;
wire [3:0] state;
wire [1:0] out;

one_hot_fsm dut (.clk(clk),.reset(reset),.state(state),.out(out));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #10 reset = 0;

        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | state=%b | out=%b", $time, state, out);
    end

endmodule
