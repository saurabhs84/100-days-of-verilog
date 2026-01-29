`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 02:41:35
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
    reg         clk;
    reg         reset;
    reg  [15:0] datain;

    wire        spi_cs_l;
    wire        spi_sclk;
    wire        spi_data;
    wire [4:0]  counter;
    
    spi_state DUT (.clk(clk),.reset(reset),.datain(datain),.spi_cs_l(spi_cs_l),
        .spi_sclk(spi_sclk),.spi_data(spi_data),.counter(counter) );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        reset  = 1;
        datain = 16'h0000;

        #20;
        reset = 0;

        #20;
        datain = 16'hA5F0;  
        #1000;

        $finish;
    end
    initial begin
        $monitor("Time=%0t | CS=%b | SCLK=%b | MOSI=%b | COUNT=%d",
                  $time, spi_cs_l, spi_sclk, spi_data, counter);
    end

endmodule

