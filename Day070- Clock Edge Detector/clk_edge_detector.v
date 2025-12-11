`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 11:17:59
// Design Name: 
// Module Name: clk_edge_detector
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


module clk_edge_detector(
    input clk,          
    input ref_clk,       
    input rst,
    output reg posedge_clk,
    output reg negedge_clk,
    output reg dual_edge_clk
);

    reg clk_d;

    always @(posedge ref_clk or posedge rst) begin
        if (rst) begin
            clk_d <= clk;
            posedge_clk <= 0;
            negedge_clk <= 0;
            dual_edge_clk <= 0;
        end else begin
            posedge_clk <=  (clk & ~clk_d);
            negedge_clk <= (~clk &  clk_d);
            dual_edge_clk <= (clk ^ clk_d);
            clk_d <= clk;
        end
    end

endmodule

