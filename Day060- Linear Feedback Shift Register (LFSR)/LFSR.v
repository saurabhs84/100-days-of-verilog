`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2025 16:47:30
// Design Name: 
// Module Name: LFSR
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

module LFSR(
    input clk,
    input reset,
    output reg [7:0] lfsr_out
);
    wire feedback;
    
    assign feedback = lfsr_out[7] ^ lfsr_out[5] ^ lfsr_out[3] ^ lfsr_out[1];

    always @(posedge clk) begin
        if (reset)
            lfsr_out <= 8'hFF;     
        else
            lfsr_out <= {lfsr_out[6:0], feedback};
    end
    
endmodule
