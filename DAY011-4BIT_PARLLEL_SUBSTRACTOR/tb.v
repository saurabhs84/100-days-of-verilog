`timescale 1ns / 1ps

module tb;
    reg [3:0] A;
    reg [3:0] B;
    reg en;
    wire [3:0] sdout;
    wire cbout;
    
    add_sub dut(A, B, en, sdout, cbout);
    initial begin        
        A = 4'b1010;
        B = 4'b0101;
        en = 1'b0;
        #10;        
        $display("a= %b b= %b sum = %b, carry = %b", A, B,sdout, cbout);
        
        en = 1'b1;
        #10;        
        $display("a= %b b= %b difference = %b, borrow = %b", A, B, sdout, cbout);
        
        A = 4'b0100;
        B = 4'b0111;
        en = 1'b0;
        #10;
        $display("A= %b B= %b sum = %b, carry = %b", A, B,sdout, cbout);
        
        en = 1'b1;
        #10;
        $display("A= %b B= %b difference = %b, borrow = %b", A, B, sdout, cbout);

        A = 4'b1001;
        B = 4'b1111;
        en = 1'b0;
        #10; 
        $display("A= %b B= %b sum = %b, carry = %b", A, B,sdout, cbout);
        
        en = 1'b1;
        #10; 
        $display("A= %b B= %b difference = %b, borrow = %b", A, B, sdout, cbout);
        
        A = 4'b0101;
        B = 4'b1101;
        en = 1'b0;
        #10; 
        $display("A= %b B= %b sum = %b, carry = %b", A, B,sdout, cbout);
        
        en = 1'b1;
        #10; 
        $display("A= %b B= %b difference = %b, borrow = %b", A, B, sdout, cbout);
        
        $finish; 
    end
    
endmodule