`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 21:44:19
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
    reg [3:0]a,b;
	wire [7:0]mul_out;

    multiplier_4bit dut(a, b, mul_out);
		always begin
			
			a=$random;
			b=$random;
            #10;
		end
    initial
    begin $monitor("%0d * %0d = %0d ",a, b, mul_out);
    #100 $finish;
    end
endmodule
