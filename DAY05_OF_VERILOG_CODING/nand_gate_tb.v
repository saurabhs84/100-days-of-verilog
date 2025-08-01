`timescale 1ns / 1ps

module nand_tb;
    reg Vin1, Vin2;
    wire Vout;
    nand_gate dut(Vin1, Vin2, Vout);
    initial Vin1= 1'b0;
    initial Vin2= 1'b0;
    initial forever #50 Vin1 = ~Vin1;
    initial forever #100 Vin2 = ~Vin2;
    initial #600 $finish;
endmodule