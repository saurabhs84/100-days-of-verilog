`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2025 10:22:46
// Design Name: 
// Module Name: Gray_Counter
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

module Gray_Counter #(parameter N = 4)(
    input clk,
    input reset,
    output reg [N-1:0] gray
);

reg [N-1:0] binary;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        binary <= 0;
        gray   <= 0;
    end
    else begin
        binary <= binary + 1;
        gray <= (binary >> 1) ^ binary;
    end
end

endmodule

