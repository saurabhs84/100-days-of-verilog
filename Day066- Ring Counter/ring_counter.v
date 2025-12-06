`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2025 16:06:33
// Design Name: 
// Module Name: ring_counter
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


module ring_counter #(parameter N=8)(
    input clk, reset,
    output [N-1:0] Q
);
    reg [N-1:0] shift_reg;

    always @(posedge clk) begin
        if (reset)
            shift_reg <= {{(N-1){1'b0}}, 1'b1};  
        else
            shift_reg <= {shift_reg[N-2:0], shift_reg[N-1]}; 
    end

    assign Q = shift_reg;

endmodule

