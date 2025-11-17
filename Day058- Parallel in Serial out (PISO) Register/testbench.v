`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 17:27:01
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
    
    reg clk, reset, load;
    reg [2:0] parallel_in;
    wire serial_out;

    piso dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
      
        reset = 1;
        load = 0;
        parallel_in = 3'b000;

        #10 reset = 0;     
        #10 parallel_in = 3'b101;
            load = 1;      

        #10 load = 0;     

        #40;
        #10 parallel_in = 3'b011;
            load = 1;

        #10 load = 0;      

        #40;

        $finish;
    end

    initial begin
        $monitor("t=%0t  clk=%b  reset=%b  load=%b  parallel_in=%b  serial_out=%b",
                 $time, clk, reset, load, parallel_in, serial_out);
    end

endmodule

