`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 20:48:20
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

    reg  [8:0] number;
    wire is_armstrong;
 
 armstrong dut (.number(number),.is_armstrong(is_armstrong) );

    initial begin
        number = 0;    #10;
        number = 1;    #10;
        number = 153;  #10;
        number = 370;  #10;
        number = 371;  #10;
        number = 407;  #10;
        number = 10;   #10;
        number = 100;  #10;
        number = 123;  #10;
        number = 200;  #10;

        #10 $finish;
    end

endmodule

