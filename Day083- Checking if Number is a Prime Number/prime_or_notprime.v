`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 15:05:14
// Design Name: 
// Module Name: prime_or_notprime
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


module prime_or_notprime(
input [7:0]number,
output reg is_prime
    );
    parameter Prime=1'b1;
    parameter Not_Prime=1'b0;
    
    integer i;
    
    always @(*) begin
    if (number < 2)
    is_prime <= Not_Prime;
    else begin
    is_prime = Prime;
    for(i=2; i*i <=number;i=i+1) begin
    if (number % i ==  0) begin
       is_prime = Not_Prime;
    end
    end
    end
    end
  
endmodule
