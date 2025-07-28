`timescale 1ns / 1ps


module Structural_level(
    input a, b,
    output c_not_a, c_not_b,
    output c_and, c_or, c_xor,
    output c_nand, c_nor, c_xnor
);

not (c_not_a, a);
not (c_not_b, b);
and (c_and, a, b);
or  (c_or, a, b);
xor (c_xor, a, b);
nand(c_nand, a, b);
nor (c_nor, a, b);
xnor(c_xnor, a, b);

endmodule




