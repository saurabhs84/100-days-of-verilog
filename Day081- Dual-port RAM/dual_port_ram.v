`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 09:31:18
// Design Name: 
// Module Name: dual_port_ram
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

module dual_port_ram
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter DEPTH = 16
)
(
    input  clk,port_en_0, wr_en,
    input [ADDR_WIDTH-1:0] addr_in_0,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out_0,

    input port_en_1,
    input  [ADDR_WIDTH-1:0]  addr_in_1,
    output reg [DATA_WIDTH-1:0] data_out_1
);

reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];

always @(posedge clk) begin
   
    if (port_en_0) begin
        if (wr_en) begin
            ram[addr_in_0] <= data_in;
            data_out_0 <= data_in;      
        end
        else begin
            data_out_0 <= ram[addr_in_0];
        end
    end

    if (port_en_1) begin
        data_out_1 <= ram[addr_in_1];
    end
end

endmodule


