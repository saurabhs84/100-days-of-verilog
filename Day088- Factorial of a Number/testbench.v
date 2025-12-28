`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2025 17:02:32
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

parameter N = 4;
parameter OUT_W = 32;

reg  [N-1:0] number;
wire [OUT_W-1:0] factorial;

Factorial #(.N(N), .OUT_W(OUT_W)) uut (
    .number(number), .factorial(factorial));

initial begin
    number = 0; #10;
    number = 1; #10;
    number = 4; #10;
    number = 5; #10;
    number = 3; #10;
    number = 8; #10;
    number = 9; #10;
    number = 6; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t | number=%0d | factorial=%0d",
              $time, number, factorial);
end

endmodule
