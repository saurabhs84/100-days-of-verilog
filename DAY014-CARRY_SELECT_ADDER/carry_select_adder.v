`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2025 14:04:45
// Design Name: 
// Module Name: carry_select_adder
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

//N-1 bit ripple carry adder code
module carry_select_adder #(parameter N=4)(
input [N-1:0]A,B,
input cin,
output  [N-1:0]s,
output  cout

    );
    
    assign {cout,s}=A+B+cin;
endmodule

// carry select adder code
module CSA (
input [7:0]A,B,
input cin,
output  [7:0]s,
output  cout
);
wire [3:0] s_low,s_high0,s_high1;
wire c_low,c_high1,c_high0;
//for lower 4 bit
carry_select_adder #(4) rca_low(A[3:0],B[3:0],cin,s_low,c_low);
//for upper 4 bit when cin=0
carry_select_adder #(4) rca_high0(A[7:4],B[7:4],1'b0,s_high0,c_high0);
//for upper 4 bit when cin=1
carry_select_adder #(4) rca_high1(A[7:4],B[7:4],1'b1,s_high1,c_high1);

assign s[3:0]=s_low;
assign s[7:4]=c_low?s_high1:s_high0;
assign cout=c_low?c_high1:c_high0;

endmodule
