`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 09:35:34
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
 parameter DATA_WIDTH = 8;
 parameter ADDR_WIDTH = 4;
 parameter DEPTH = 16;

    reg clk;
    reg port_en_0;
    reg port_en_1;
    reg wr_en;
    reg [ADDR_WIDTH-1:0] addr_in_0;
    reg [ADDR_WIDTH-1:0] addr_in_1;
    reg [DATA_WIDTH-1:0] data_in;

    wire [DATA_WIDTH-1:0] data_out_0;
    wire [DATA_WIDTH-1:0] data_out_1;

   
    dual_port_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .port_en_0(port_en_0),
        .wr_en(wr_en),
        .addr_in_0(addr_in_0),
        .data_in(data_in),
        .data_out_0(data_out_0),
        .port_en_1(port_en_1),
        .addr_in_1(addr_in_1),
        .data_out_1(data_out_1)
    );

    always #5 clk = ~clk;

    initial begin
      
        clk = 0;
        port_en_0 = 0;
        port_en_1 = 0;
        wr_en = 0;
        addr_in_0 = 0;
        addr_in_1 = 0;
        data_in = 0;

        #10;
        port_en_0 = 1;
        wr_en = 1;
        addr_in_0 = 4'd3;
        data_in = 8'hAA;

        #10;
        addr_in_0 = 4'd7;
        data_in = 8'h55;
        #10;
        wr_en = 0;
        addr_in_0 = 4'd3;

        #10;
        port_en_1 = 1;
        addr_in_1 = 4'd7;

        #10;
        wr_en = 1;
        addr_in_0 = 4'd5;
        data_in = 8'hFF;

        #10;
        wr_en = 0;
        addr_in_1 = 4'd5;

        #20;
        $finish;
    end

    initial begin
        $monitor("T=%0t | WE=%b | A0=%d D0=%h | A1=%d D1=%h",
                  $time, wr_en,addr_in_0, data_out_0,addr_in_1, data_out_1);
    end

endmodule

