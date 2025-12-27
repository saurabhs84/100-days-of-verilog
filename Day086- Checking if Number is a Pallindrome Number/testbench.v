`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 14:49:36
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

reg [15:0] number;
reg mode;
wire is_palindrome;

palindrome_checker DUT (.number(number),.mode(mode),.is_palindrome(is_palindrome));

initial begin
    
    mode = 0;
    number = 16'b1000000000000001; #10;
    number = 16'b1011000000001101; #10;
    mode = 1;
    number = 16'd12321; #10;
    number = 16'd12345; #10;

    $finish;
end

initial
    $monitor("T=%0t Mode=%b Number=%0d Palindrome=%b",
              $time, mode, number, is_palindrome);

endmodule
