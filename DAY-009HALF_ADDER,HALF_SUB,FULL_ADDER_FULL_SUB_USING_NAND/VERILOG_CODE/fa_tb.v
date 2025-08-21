`timescale 1ns / 1ps

module test_bench_fa;
reg a, b, cin;
  wire sout, cout;
  
  fa_nand dut(a, b, cin, sout, cout);

  

  initial begin
    $monitor("time=%t | a=%b b=%b cin=%b",$time,a,b,cin);
    a = 0; b = 0; cin = 0;
    #10;
    a = 0; b = 0; cin = 1;
    #10;
    a = 0; b = 1; cin = 0;
    #10;
    a = 0; b = 1; cin = 1;
    #10;
    a = 1; b = 0; cin = 0;
    #10;
    a = 1; b = 0; cin = 1;
    #10;
    a = 1; b = 1; cin = 0;
    #10;
    a = 1; b = 1; cin = 1;
    #10;
    $finish;
  end
  
endmodule