`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2025 15:53:19
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
    wire clk_div_1_5;

    freq_div_by_decimal dut (
        .clk(clk),
        .reset(reset),
        .clk_div_1_5(clk_div_1_5)
    );
    
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #20;
        reset = 0;

        #200;

        $finish;
    end

endmodule

