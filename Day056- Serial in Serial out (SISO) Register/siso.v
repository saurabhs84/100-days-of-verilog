`timescale 1ns / 1ps

module D_FF (
    input D,
    input clk,
    input rst,
    output reg Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

module siso(
    input clk,
    input reset,
    input serial_in,
    output serial_out
);

    wire q1, q0;

    D_FF D2(serial_in, clk, reset, q1);
    D_FF D1(q1, clk, reset, q0);
    D_FF D0(q0, clk, reset, serial_out);

endmodule
