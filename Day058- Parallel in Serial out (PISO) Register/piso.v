`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 17:23:55
// Design Name: 
// Module Name: piso
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

module piso(
    input clk, reset, load,
    input [2:0] parallel_in,
    output serial_out
);
    reg [2:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 3'b000;
        else if (load)
            shift_reg <= parallel_in;
        else
            shift_reg <= {shift_reg[1:0], 1'b0};
    end

    assign serial_out = shift_reg[2];
endmodule

