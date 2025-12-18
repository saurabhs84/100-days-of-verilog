`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2025 16:19:58
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
reg in;
wire out;

fsm_1101_nonoverlapping_mealy DUT (.clk(clk),.reset(reset),.in(in),.out(out));
always #5 clk = ~clk;
initial begin
  clk   = 0;
  reset = 1;
  in    = 0;
  #12 reset = 0;
        @(posedge clk) in = 1;  
        @(posedge clk) in = 1;
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1;  
        @(posedge clk) in = 1;
        @(posedge clk) in = 0;
        @(posedge clk) in = 1;
        @(posedge clk) in = 0;
        @(posedge clk) in = 1;

        #20 $finish;
    end
initial begin
        $display("Time\tclk\tin\tout");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, in, out);
    end

endmodule

