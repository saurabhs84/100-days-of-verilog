`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 18:58:14
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
reg [7:0]a,b;
wire lesser,greater,equal ;
N_bit_comparator uut (.lesser(lesser),.greater(greater),.equal(equal),.a(a),.b(b));
always begin
			a=111;
			b=250;
			#10;
			a=147;
			b=103;
			#10;
			a=199;
			b=220;
			#10;
			a=137;
			b=171;
			#10;
			a=255;
			b=255;
			#10;
			a=169;
			b=169;
			#10;
			a=85;
			b=25;
			#10;
			a=21;
			b=50;
			#10;
			a=79;
			b=74;
			#10;
			a=96;
			b=96;
			#10;
		end
		initial
        begin $monitor("a= %0d  b= %0d  then Lesser= %0d  Greater= %0d  Equal= %0d ",a, b,lesser,greater,equal );
        #100 $finish;
    end
endmodule
