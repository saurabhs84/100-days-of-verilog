`timescale 1ns / 1ps

module Data_Flow_level_tb;

    reg a, b;
    wire c_nota, c_notb, c_and, c_or, c_xor, c_nor, c_nand, c_xnor;

    
    Data_Flow_level uut (
        .a(a), .b(b),
        .c_nota(c_nota), .c_notb(c_notb),
        .c_and(c_and), .c_or(c_or), .c_xor(c_xor),
        .c_nand(c_nand), .c_nor(c_nor), .c_xnor(c_xnor)
    );

    initial begin
        $display(" a | b | ~a ~b | a&b a|b a^b | ~(a&b) ~(a|b) ~(a^b)");
        $monitor(" %b | %b |  %b  %b |  %b   %b   %b  |    %b      %b      %b",
            a, b, c_nota, c_notb, c_and, c_or, c_xor, c_nand, c_nor, c_xnor);

        a = 0; b = 0; #2;
        a = 0; b = 1; #2;
        a = 1; b = 0; #2;
        a = 1; b = 1; #2;

        $finish;
    end

endmodule
