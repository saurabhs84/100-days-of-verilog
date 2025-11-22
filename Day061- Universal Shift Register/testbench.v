`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2025 22:19:21
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
`timescale 1ns/1ps

module testbench;

    reg clk;
    reg reset;
    reg [1:0] mode;
    reg serial_in_left;
    reg serial_in_right;
    reg [3:0] parallel_in;
    wire [3:0] q;

    Universal_Shift_Register uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .parallel_in(parallel_in),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
     
        $monitor("Time=%0t | clk=%b | reset=%b | mode=%b | SIL=%b | SIR=%b | P_IN=%b | Q=%b",
                  $time, clk, reset, mode, serial_in_left, serial_in_right, parallel_in, q);

        clk = 0;
        reset = 1;
        mode = 2'b00;
        serial_in_left = 0;
        serial_in_right = 0;
        parallel_in = 4'b0000;

        #10 reset = 0;
        #10 parallel_in = 4'b1011;
            mode = 2'b11;     
        #10 mode = 2'b01;
            serial_in_right = 1;

        #10 serial_in_right = 0;

        #10 mode = 2'b10;
            serial_in_left = 1;

        #10 mode = 2'b00;
        #50;

        $stop;
    end

endmodule

