`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2025 00:45:24
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

    reg clk, reset, serial_in;
    wire serial_out;

    siso dut(clk, reset, serial_in, serial_out);

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;     
    end

    initial begin
        reset = 1;
        serial_in = 0;
        #10 reset = 0;

        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
    end

    initial begin
        $monitor("Time=%0t | clk=%b reset=%b serial_in=%b serial_out=%b",
                 $time, clk, reset, serial_in, serial_out);

        #200 $finish;
    end

endmodule

