`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: Booth's Multiplicatuon Algorithm
// Description: 8-bit signed Booth's Multiplier (Combinational)
// 
//////////////////////////////////////////////////////////////////////////////////

module Booths_Multiplicatuon_Algorithm(
    input  [7:0] M,   
    input  [7:0] Q,  
    output reg [15:0] product  
);

    reg [7:0] A;          
    reg [7:0] Q_tmp;      
    reg q0;               
    integer i;

    always @(*) begin
    
        A   = 8'b0;
        Q_tmp = Q;
        q0  = 1'b0;

        for (i = 0; i < 8; i = i + 1) begin
            
            case ({Q_tmp[0], q0})
                2'b01: A = A + M;    
                2'b10: A = A - M;   
                default:A=A;           
            endcase

            q0 = Q_tmp[0];
            Q_tmp = {A[0], Q_tmp[7:1]}; 
            A = {A[7], A[7:1]};          
        end

        product = {A, Q_tmp};
    end
endmodule
