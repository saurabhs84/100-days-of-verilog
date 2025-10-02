`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2025 13:18:39
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
reg  i;
reg [2:0] sel;
wire [7:0] y;

Demux18_using_12 uut (.i(i),.sel(sel),.y(y));

 always begin
    sel= $random;
    i= 1'b1;
    #10;
    end
initial begin
 $monitor ("input =%b | sel= %b %b %b | y0=%b  y1=%b y2=%b y3=%b y4=%b y5=%b  y6=%b y7=%b ",i,sel[0],
 sel[1],sel[2],y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7]);
 
#100 $finish;
end
endmodule
