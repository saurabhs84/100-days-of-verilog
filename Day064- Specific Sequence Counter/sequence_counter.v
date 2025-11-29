`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2025 10:56:32
// Design Name: 
// Module Name: sequence_counter
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

module sequence_counter(
    input  clk,
    input  reset,
    output reg [3:0] out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        out <= 4'd0;         
    else begin
        case(out)
            4'd0  : out <= 4'd2;
            4'd2  : out <= 4'd5;
            4'd5  : out <= 4'd8;
            4'd8  : out <= 4'd11;
            4'd11 : out <= 4'd14;
            4'd14 : out <= 4'd0;
            default: out <= 4'd0;
        endcase
    end
end

endmodule
