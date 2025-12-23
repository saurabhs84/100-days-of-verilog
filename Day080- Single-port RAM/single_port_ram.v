`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2025 17:17:40
// Design Name: 
// Module Name: single_port_ram
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

module single_port_ram
#(
    parameter ADDR_WIDTH = 7,     
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 128
)
(
    input                   clk,
    input                   we,
    input  [ADDR_WIDTH-1:0] address,
    input  [DATA_WIDTH-1:0] data,
    output reg [DATA_WIDTH-1:0] q
);

reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

always @(posedge clk) begin
    if (we) begin
        ram[address] <= data;   
        q <= data;             
    end else begin
        q <= ram[address];  
    end
end

endmodule
