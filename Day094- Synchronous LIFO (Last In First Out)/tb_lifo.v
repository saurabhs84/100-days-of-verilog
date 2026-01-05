`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 13:06:28
// Design Name: 
// Module Name: tb_lifo
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

module tb_lifo;

    reg clk, rst, wr_en, rd_en;
    reg [3:0] dataIn;
    wire [3:0] dataOut;
    wire empty, full;

    LIFO dut (.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),
        .dataIn(dataIn),.dataOut(dataOut),.empty(empty),.full(full) );

    always #5 clk = ~clk;
initial begin
$monitor("Time=%t wr_en=%b rd_en=%b dataIn=%b dataOut=%b | empty=%b full=%b ",
            $time,wr_en,rd_en,dataIn,dataOut,empty,full);
end
    initial begin
        clk = 0; rst = 1; wr_en = 0; rd_en = 0; dataIn = 0;
        #10 rst = 0;

        #10 wr_en = 1; dataIn = 4'd5;
        #10 dataIn = 4'd10;
        #10 dataIn = 4'd15;
        #10 wr_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 1;
        #10 rd_en = 0;

        #20 $finish;
    end
endmodule

