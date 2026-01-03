`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 13:40:55
// Design Name: 
// Module Name: HCF
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

module HCF #(parameter N = 8)(
    input clk,rst,start,
    input  [N-1:0] in1,in2,
    output reg [N-1:0] hcf,
    output reg done
);

    reg [N-1:0] a, b;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a <= 0;
            b <= 0;
            hcf  <= 0;
            done <= 0;
        end
        else if (start) begin
            a <= in1;
            b <= in2;
            done <= 0;
        end
        else if (b != 0) begin
            a <= b;
            b <= a % b;
        end
        else begin
            hcf <= a;
            done <= 1;
        end
    end

endmodule

