`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2025 23:19:11
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

    reg a, b;
    wire nand_out, nor_out;

   universal_gates uut(
        .a(a),
        .b(b),
        .nand_out(nand_out),
        .nor_out(nor_out)
    );

    initial begin
        $monitor("Time=%0t | a=%b b=%b | NAND=%b NOR=%b", 
                  $time, a, b, nand_out, nor_out);

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end

endmodule

