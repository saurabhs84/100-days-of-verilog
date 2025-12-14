`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2025 15:45:35
// Design Name: 
// Module Name: freq_div_by_decimal
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

module freq_div_by_decimal (
    input  clk,
    input  reset,
    output reg clk_div_1_5
);

    reg clk_neg;        
    reg [1:0] count;

    always @(negedge clk or posedge reset) begin
        if (reset)
            clk_neg <= 1'b0;
        else
            clk_neg <= ~clk_neg;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count        <= 0;
            clk_div_1_5  <= 0;
        end
        else begin
            if (count == 2) begin
                count       <= 0;
                clk_div_1_5 <= ~clk_div_1_5;
            end
            else
                count <= count + 1;
        end
    end

endmodule


