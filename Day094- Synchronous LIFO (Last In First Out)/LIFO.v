`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 13:00:48
// Design Name: 
// Module Name: LIFO
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

module LIFO (
    input clk,rst,wr_en,rd_en,
    input  [3:0] dataIn,
    output reg [3:0] dataOut,
    output reg   empty,full
);

    reg [3:0] stack_mem [0:3];
    reg [2:0] sp;  
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            sp      <= 3'd0;
            dataOut <= 4'd0;
            empty   <= 1'b1;
            full    <= 1'b0;
            for (i = 0; i < 4; i = i + 1)
                stack_mem[i] <= 4'd0;
        end
        else begin
            
            if (wr_en && !full) begin
                stack_mem[sp] <= dataIn;
                sp <= sp + 1'b1;
            end

            if (rd_en && !empty) begin
                sp <= sp - 1'b1;
                dataOut <= stack_mem[sp-1'b1];
            end

            empty <= (sp == 0);
            full  <= (sp == 4);
        end
    end
endmodule

