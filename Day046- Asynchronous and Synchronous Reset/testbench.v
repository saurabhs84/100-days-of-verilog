`timescale 1ns / 1ps
module testbench;

reg clk, rst, in;
wire out_sync, out_async;

Asynchronous_Synchronous_reset uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .out_sync(out_sync),
    .out_async(out_async)
);


initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1;       
    #25 rst = 0;   
    #200 rst = 1;  
    #20 rst = 0;   
end


initial begin
    in = 0;
    #30 in = 1;
    #50 in = 0;
    #40 in = 1;
    #30 in = 0;
    #50 in = 1;
end
initial #400 $stop;

endmodule
