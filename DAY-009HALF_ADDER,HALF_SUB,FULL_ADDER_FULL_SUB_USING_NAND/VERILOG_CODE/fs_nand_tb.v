`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2025 01:19:57
// Design Name: 
// Module Name: fs_nand_tb
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

module fs_nand_tb;
reg a, b, bin;
  wire diff, bout;
  

  fs_nand dut(a, b, bin, diff, bout);
  
  
  initial begin
  $monitor("time=%t | a=%b b=%b bin=%b",$time,a,b,bin);
   
    a = 0; b = 0; bin = 0;
    #10;
    a = 0; b = 0; bin = 1;
    #10;
    a = 0; b = 1; bin = 0;
    #10;
    a = 0; b = 1; bin = 1;
    #10;
    a = 1; b = 0; bin = 0;
    #10;
    a = 1; b = 0; bin = 1;
    #10;
    a = 1; b = 1; bin = 0;
    #10;
    a = 1; b = 1; bin = 1;
    #10;
    $finish;
  end


endmodule
