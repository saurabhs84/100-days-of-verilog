`timescale 1ns / 1ps

module Structural_tb;

    
    reg a, b;
    wire c_not_a, c_not_b;
    wire c_and, c_or, c_xor;
    wire c_nand, c_nor, c_xnor;

    
    Structural_level uut (
        .a(a),
        .b(b),
        .c_not_a(c_not_a),
        .c_not_b(c_not_b),
        .c_and(c_and),
        .c_or(c_or),
        .c_xor(c_xor),
        .c_nand(c_nand),
        .c_nor(c_nor),
        .c_xnor(c_xnor)
    );

    
    initial begin
       
        a = 0; b = 0; #10;
        
        a = 0; b = 1; #10;
        
        a = 1; b = 0; #10;
        
        a = 1; b = 1; #10;
        
        $finish;
    end

endmodule
