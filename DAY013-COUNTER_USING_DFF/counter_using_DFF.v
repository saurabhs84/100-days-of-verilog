`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 15:54:26
// Design Name: 
// Module Name: counter_using_DFF
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


module counter_using_DFF(
input rst,clk,
output reg [3:0]q
);
always @(posedge clk or negedge rst) begin
    if (!rst) 
        q <= 4'b0000;             
    else begin
        q[0] <= ~q[0];
        q[1] <= q[1] ^ q[0];
        q[2] <= q[2] ^ (q[1] & q[0]);
        q[3] <= q[3] ^ (q[2] & q[1] & q[0]);
    end
end

endmodule
