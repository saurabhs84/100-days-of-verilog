`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 20:27:37
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

    parameter PERIOD = 100;
    parameter WIDTH  = 8;

    reg clk;
    reg rst;
    reg enable;
    reg polarity;
    reg [WIDTH-1:0] duty;

    wire pwm_out;
    wire [WIDTH-1:0] count_out;

    PWM #( .PERIOD(PERIOD),.WIDTH(WIDTH) ) dut (
        .clk(clk),.rst(rst),.enable(enable),.polarity(polarity),
        .duty(duty),.pwm_out(pwm_out),.count_out(count_out));

    always #5 clk = ~clk;

    initial begin
    
        clk      = 0;
        rst      = 1;
        enable   = 0;
        polarity = 0;
        duty     = 0;
        
        #20 rst = 0;
        enable = 1;
        duty   = 0;
        polarity = 0;
        #1000;
        duty = 25;
        #1000;
        duty = 50;
        #1000;
        duty = 75;
        #1000;
        duty = 100;
        #1000;
        polarity = 1;
        duty = 50;
        #1000;
        enable = 0;
        #500;
 $finish;
    end

    initial begin
        $monitor("TIME=%0t | duty=%0d | cnt=%0d | pwm_out=%b | enable=%b | polarity=%b",
                  $time, duty, count_out, pwm_out, enable, polarity);
    end

endmodule
