`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2025 10:59:21
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

  reg clk = 0;
  reg reset;
  reg upordown;
  wire [3:0] count;

  up_down_counter #(4) DUT (
    .clk(clk),
    .reset(reset),
    .upordown(upordown),
    .count(count)
  );

  always #5 clk = ~clk;  

  initial begin
    $monitor("Time=%0t  reset=%b upordown=%b count=%d",
              $time, reset, upordown, count);

    reset = 1; upordown = 1;
    #10 reset = 0;

    #100;

    upordown = 0;
    #100;

    $finish;
  end
endmodule

