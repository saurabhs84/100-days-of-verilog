`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 14:21:57
// Design Name: 
// Module Name: FIFO
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

module FIFO #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input  [WIDTH-1:0] wr_data,
    output reg [WIDTH-1:0] rd_data,
    output reg empty,
    output reg full
);

    localparam PTR_WIDTH = $clog2(DEPTH);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [PTR_WIDTH-1:0] wr_ptr, rd_ptr;
    reg [PTR_WIDTH:0] count;   

    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
            empty  <= 1;
            full   <= 0;
            rd_data <= 0;
        end
        else begin
            if (wr_en && !full) begin
                mem[wr_ptr] <= wr_data;
                wr_ptr <= (wr_ptr == DEPTH-1) ? 0 : wr_ptr + 1;
            end

            if (rd_en && !empty) begin
                rd_data <= mem[rd_ptr];
                rd_ptr <= (rd_ptr == DEPTH-1) ? 0 : rd_ptr + 1;
            end

            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1; 
                2'b01: count <= count - 1; 
                default: count <= count;  
            endcase

            empty <= (count == 0);
            full  <= (count == DEPTH);

        end
    end

endmodule

