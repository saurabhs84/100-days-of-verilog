`timescale 1ns / 1ps

module testbench;
reg clk, rst, J, K;
wire Q_SR, Q_D, Q_T;

JK_using_SR_T dut (.J(J), .K(K), .clk(clk), .rst(rst), .Q_SR(Q_SR), .Q_D(Q_D), .Q_T(Q_T));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1; J = 0; K = 0;
    #10 rst = 0;
end

always begin
    J=0; K=0; #10;
    J=0; K=1; #10;
    J=1; K=0; #10;
    J=1; K=1; #10;
end

initial begin
    $monitor("clk=%b  J=%b  K=%b  Q_SR=%b  Q_D=%b  Q_T=%b",
              clk, J, K, Q_SR, Q_D, Q_T);
    #90 $finish;
end

endmodule
