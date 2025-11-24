`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2025 20:35:50
// Design Name: 
// Module Name: barrel_shift_reg
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

module barrel_shift_reg(
    input  [3:0] data_in,
    input  [1:0] shift,
    input        dire,      
    output reg [3:0] data_out
);

always @(*) begin
    case (dire)
        1'b0:  data_out = data_in << shift;  
        1'b1:  data_out = data_in >> shift;  
    endcase
end

endmodule

