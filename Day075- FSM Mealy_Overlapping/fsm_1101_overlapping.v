`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 13:48:41
// Design Name: 
// Module Name: fsm_1101_overlapping
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

module fsm_1101_overlapping(
    input clk,
    input reset,
    input in,
    output reg out
);

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] ps, ns;

  
    always @(posedge clk or posedge reset) begin
        if (reset)
            ps <= S0;
        else
            ps <= ns;
    end

    always @(*) begin
        ns  = ps;
        out = 1'b0;

        case (ps)
            S0: if (in) ns = S1;

            S1: if (in) ns = S2;
                else    ns = S0;

            S2: if (in) ns = S2;
                else    ns = S3;

            S3: if (in) begin
                    ns  = S1;   
                    out = 1'b1; 
                end
                else ns = S0;
        endcase
    end

endmodule

