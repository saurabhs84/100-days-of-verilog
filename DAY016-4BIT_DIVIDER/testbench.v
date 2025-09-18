`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 17:20:13
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
    reg [3:0]dividend,divisor;
    wire [3:0]quotient,remainder;

    divider_4bit dut(dividend,divisor,quotient,remainder);
		always begin
			
			dividend =$random;
			divisor =$random;
            #10;
		end
    initial
    begin $monitor("%0d / %0d = %0d with remainder %0d ",dividend,divisor,quotient,remainder);
    #100 $finish;
    end
endmodule
