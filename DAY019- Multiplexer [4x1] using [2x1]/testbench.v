`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2025 19:59:59
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
reg [3:0]I;
reg [1:0]sel;
wire y;

mux41_using21 uut (.I(I),.sel(sel),.y(y));
initial begin
$monitor("Input Data : %b  Select Line : %b Output : %b ",I, sel, y);

I=4'b0010; sel=2'b10;#5
I=4'b0111; sel=2'b10;#5
I=4'b1010; sel=2'b00;#5
I=4'b0011; sel=2'b01;#5
$finish;
end
endmodule
