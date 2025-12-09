`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 17:14:12
// Design Name: 
// Module Name: clock_phase
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

`timescale 1ns / 1ps

module clock_phase(
    input  clk,rst,
    output  clk_0,clk_90,clk_180, clk_270
);

    reg [1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 2'b00;
        else
            count <= count + 1'b1;
    end

    assign clk_0   = (count == 2'b00); 
    assign clk_90  = (count == 2'b01);  
    assign clk_180 = (count == 2'b10); 
    assign clk_270 = (count == 2'b11);  
endmodule

