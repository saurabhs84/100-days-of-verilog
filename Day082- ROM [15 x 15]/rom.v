`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 08:53:29
// Design Name: 
// Module Name: rom
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


module rom(
input clk,rd_en,
input [3:0] addr,
output reg [15:0] data
    );
    
    reg [15:0] mem [0:15] ;
     initial begin
        mem[0]  = 16'h0001;
        mem[1]  = 16'h0002;
        mem[2]  = 16'h0004;
        mem[3]  = 16'h0008;
        mem[4]  = 16'h0010;
        mem[5]  = 16'h0020;
        mem[6]  = 16'h0040;
        mem[7]  = 16'h0080;
        mem[8]  = 16'h0100;
        mem[9]  = 16'h0200;
        mem[10] = 16'h0400;
        mem[11] = 16'h0800;
        mem[12] = 16'h1000;
        mem[13] = 16'h2000;
        mem[14] = 16'h4000;
        mem[15] = 16'h8000;
    end
    always @(posedge clk) begin
    if(rd_en)
    data <= mem[addr];
    else 
    data <= data;
    end
endmodule
