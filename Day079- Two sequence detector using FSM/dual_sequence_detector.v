`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2025 12:25:28
// Design Name: 
// Module Name: dual_sequence_detector
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

module dual_sequence_detector (
    input  clk, reset,din,
    output reg  y
);
 reg [2:0]  S0 = 3'b000,   S1 = 3'b001,  S2 = 3'b010,  S3 = 3'b011,  S4 = 3'b100,  S5 = 3'b101  ; 
 reg [2:0] cst, nst;

    always @(posedge clk or posedge reset) begin
        if (reset)
            cst <= S0;
        else
            cst <= nst;
    end

    always @(*) begin
      
        nst = cst;
        y   = 1'b0;

        case (cst)
            S0: begin
                if (din) nst = S1;
                else     nst = S3;
            end

            S1: begin
                if (din) nst = S1;
                else     nst = S2;
            end

            S2: begin
                if (din) begin
                    y   = 1'b1; 
                    nst = S1;    
                end else
                    nst = S3;
            end

            S3: begin
                if (din) nst = S4;
                else     nst = S3;
            end

            S4: begin
                if (din) nst = S1;
                else     nst = S5;
            end

            S5: begin
                if (!din) begin
                    y   = 1'b1;  
                    nst = S3;    
                end else
                    nst = S4;
            end

            default: nst = S0;
        endcase
    end

endmodule

