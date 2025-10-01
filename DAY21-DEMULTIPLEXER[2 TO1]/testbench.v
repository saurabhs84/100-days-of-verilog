`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2025 19:29:09
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
reg i,sel;
wire [1:0]y;
demultiplexer_21 uut (.i(i),.sel(sel),.y(y));
initial begin
$monitor (" i= %d | sel=%d | {y[1],y[0]}= %d %d",i,sel,y[1],y[0]);
i=0;sel=0;#5
i=1;sel=0;#5
i=0;sel=1;#5
i=1;sel=1;#5
$finish;
end
endmodule
