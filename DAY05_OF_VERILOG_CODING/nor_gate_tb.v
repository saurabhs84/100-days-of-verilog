`timescale 1ns / 1ps

module nor_gate_tb;
    reg Vin1, Vin2;
    wire Vout;

    
    nor_gate dut(Vin1, Vin2, Vout);

    
    initial begin
        Vin1 = 0;
        Vin2 = 0;
    end

   
    initial begin
        #25;
        forever #50 Vin1 = ~Vin1;
    end

    
    initial begin
        #50;
        forever #100 Vin2 = ~Vin2;
    end

    
    initial begin
        $monitor("Time = %0t | Vin1 = %b, Vin2 = %b, Vout = %b", $time, Vin1, Vin2, Vout);
        #600 $finish;
    end
endmodule
