`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 14:24:05
// Design Name: 
// Module Name: testbench
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

module testbench;
    parameter WIDTH = 8;
    parameter DEPTH = 16;

    reg clk, rst, wr_en, rd_en;
    reg [WIDTH-1:0] wr_data;
    wire [WIDTH-1:0] rd_data;
    wire empty, full;

    FIFO #(WIDTH, DEPTH) dut (.clk(clk), .rst(rst),.wr_en(wr_en),
        .rd_en(rd_en),.wr_data(wr_data),.rd_data(rd_data),.empty(empty),
        .full(full));

    always #5 clk = ~clk;
    initial begin
        $monitor(
            "TIME=%0t | wr_en=%b rd_en=%b | wr_data=%0d rd_data=%0d | empty=%b full=%b",
            $time, wr_en, rd_en, wr_data, rd_data, empty, full
        );
    end
    initial begin
        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        wr_data = 0;

        #10 rst = 0;

        repeat (8) begin
            @(posedge clk);
            wr_en = 1;
            wr_data = wr_data + 8'h11;
        end
        wr_en = 0;

        repeat (8) begin
            @(posedge clk);
            rd_en = 1;
        end
        rd_en = 0;

        #50 $finish;
    end

endmodule

