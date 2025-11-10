`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 01:26:36
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

    reg clk, reset, D;
    wire Q_sr, Q_jk, Q_t;

    D_FF_USING_SR_JK_T DUT (.clk(clk),.reset(reset),.D(D),.Q_sr(Q_sr),.Q_jk(Q_jk),.Q_t(Q_t));

    always #5 clk = ~clk;

    initial begin
    
    $monitor ("time=%d |clk=%d rst=%d  D=%d  Q_SR=%d Q_Jk=%d Q_T=%d",$time,clk,reset,D,Q_sr,Q_jk,Q_t);
        clk = 0;
        reset = 1;
        D = 0;
        #20;
  
        reset = 0;  
        D = 0; #20;
        D = 1; #20;
        D = 0; #20;
        D = 1; #20;
        D = 1; #20;
        D = 0; #20;

        reset = 1; #20;
        reset = 0; #20;

        $finish;
    end

endmodule

