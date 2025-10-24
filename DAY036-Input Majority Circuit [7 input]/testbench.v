`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2025 14:14:00
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


`timescale 1ns / 1ps

module testbench;
reg [6:0]in;
wire out;
 majority_input dut(in, out);
    initial begin 
		in=7'd99;
            #10;
            in=7'd28;
            #10;
            in=7'd119;
            #10;
            in=7'd101;
            #10;
            in=7'd32;
            #10;
            in=7'd48;
            #10;
            in=7'd75;
            #10;
		end
    initial
    begin $monitor("%b is a majority input of number %b ",out, in);
    #70 $finish;
    end
endmodule
