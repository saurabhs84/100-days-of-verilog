`timescale 1ns / 1ps

module testbench;
reg clk, reset;
wire [2:0] counter;   

mod_N_Counter uut (
    .clk(clk),
    .reset(reset),
    .counter(counter)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    $monitor("time=%0t clk=%b reset=%b counter=%d", $time, clk, reset, counter);

    #10 reset = 0;
    #100;
    reset = 1;
    #10 reset = 0;
    #60;

    $finish;
end

endmodule
