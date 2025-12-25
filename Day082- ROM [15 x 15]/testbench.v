`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 08:59:55
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

`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg rd_en;
    reg [3:0] addr;
    wire [15:0] data;

 rom uut (.clk(clk),.rd_en(rd_en),.addr(addr),.data(data) );
 always #5 clk = ~clk;

 initial begin
    clk = 0;
    rd_en = 0;
    addr = 0;
  #10 rd_en = 1;
        repeat (16) begin
            #10 addr = addr + 1;
        end
        #10 rd_en = 0;
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | rd_en=%b | addr=%d | data=%h",
                 $time, rd_en, addr, data);
    end

endmodule

