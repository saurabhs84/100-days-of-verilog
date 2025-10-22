`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2025 09:45:41
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
parameter n=4;
reg [n-1:0]num;
wire [2*n-1:0]result;
n_bit_square dut(num, result);
always begin
			num=$random;
            #10;
		end
    initial
    begin $monitor("%d^2 = %0d ",num, result);
    #80 $finish;
    end
endmodule
