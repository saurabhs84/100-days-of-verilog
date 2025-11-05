`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2025 17:34:10
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
reg D,reset,clk;
wire Q;

D_Flip_Flop uut (.D(D),.reset(reset),.clk(clk),.Q(Q));

initial begin
    clk = 0;
    reset = 1;
    D = 0;
    #12 reset = 0;  
end

initial begin
    $monitor("time=%t | reset=%b clk=%b D=%b | Q=%b", $time, reset, clk, D, Q);

    #3  D = 0;   // D changes just before posedge
    #10 D = 1;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 $finish;
end

always #5 clk = ~clk;

endmodule
