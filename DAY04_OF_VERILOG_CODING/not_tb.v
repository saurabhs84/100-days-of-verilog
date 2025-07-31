`timescale 1ns / 1ps

module not_tb;
    reg in;
    wire out;
    SWITCH_LEVEL_MODELING dut(in, out);
    initial in= 1'b0;
    initial forever #50 in = ~in;
    initial #600 $finish;
endmodule
