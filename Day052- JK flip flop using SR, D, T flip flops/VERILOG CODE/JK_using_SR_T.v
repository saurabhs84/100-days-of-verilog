`timescale 1ns / 1ps

module JK_using_SR_T(
    input J, K, clk, rst,
    output wire Q_SR, Q_D, Q_T
);

    wire w1,w2,w3,w4,w5,w6,w7,w8;

    
    assign w1 = J & (~Q_SR);
    assign w2 = K & ( Q_SR);
    SR_Flip_Flop sr_ff (.S(w1), .R(w2), .clk(clk), .rst(rst), .Q(Q_SR));

    
    assign w3 = J & (~Q_D);
    assign w4 = (~K) & Q_D;
    assign w5 = w3 | w4;
    D_Flip_Flop d_ff (.clk(clk), .rst(rst), .D(w5), .Q(Q_D));

    
    assign w6 = J & (~Q_T);
    assign w7 = K & Q_T;
    assign w8 = w6 | w7;
    T_Flip_Flop t_ff (.T(w8), .clk(clk), .rst(rst), .Q(Q_T));

endmodule
