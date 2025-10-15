`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2025 09:18:44
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
reg [7:0]in;
wire [2:0]out;

Encoder8x3 uut(.in(in),.out(out));
initial begin
 $monitor("time=%0t | in=%b | out=%b", $time, in, out);
  #0  in = 8'b10000000;
  #2  in = 8'b01000000;
  #4  in = 8'b00100000;
  #6  in = 8'b00010000;
  #8  in = 8'b00001000;
  #10 in = 8'b00000100;
  #12 in = 8'b00000010;
  #14 in = 8'b00000001;
  #20 $finish;
end

endmodule
