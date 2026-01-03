`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 13:44:18
// Design Name: 
// Module Name: tb_HCF
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

module tb_HCF;
 parameter N = 8;
 reg clk, rst, start;
 reg [N-1:0] in1, in2;
 wire [N-1:0] hcf;
 wire done;

    HCF #(N) dut (.clk(clk),.rst(rst),.start(start),
        .in1(in1),.in2(in2),.hcf(hcf),.done(done));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        in1 = 0;
        in2 = 0;

        #10 rst = 0;
        #10 start = 1; in1 = 24; in2 = 18;
        #10 start = 0;
        wait(done);
        $display("HCF(24,18) = %d", hcf);
        #20 start = 1; in1 = 15; in2 = 25;
        #10 start = 0;
        wait(done);
        $display("HCF(15,25) = %d", hcf);
        #20 start = 1; in1 = 100; in2 = 10;
        #10 start = 0;
        wait(done);
        $display("HCF(100,10) = %d", hcf);

        #20 $finish;
    end

endmodule
