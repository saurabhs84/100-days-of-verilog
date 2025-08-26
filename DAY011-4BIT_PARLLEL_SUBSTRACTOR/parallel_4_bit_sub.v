`timescale 1ns / 1ps

module parallel_4_bit_sub (
    input a, b, cin,
    output sout, cout
    );
    assign sout = a^b^cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

module add_sub(
    input [3:0] A, B,
    input en,
    output [3:0] sdout,
    output cbout
    );
    wire [2:0]c;
    
    parallel_4_bit_sub fa1(A[0], (B[0]^en), en, sdout[0], c[0]);
    parallel_4_bit_sub fa2(A[1], (B[1]^en), c[0], sdout[1], c[1]);
    parallel_4_bit_sub fa3(A[2], (B[2]^en), c[1], sdout[2], c[2]);
    parallel_4_bit_sub fa4(A[3], (B[3]^en), c[2], sdout[3], cbout);
 
endmodule