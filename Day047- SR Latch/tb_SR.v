`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2025 14:49:56
// Design Name: 
// Module Name: tb_SR
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


module tb_SR;
reg S,R,en,rst;
wire Q,Qbar;

SR_latch uut (.S(S),.R(R),.en(en),.rst(rst),.Q(Q),.Qbar(Qbar));

initial begin
rst=1'b1;
en=1'b0;#10
rst=1'b0;
en=1'b1;
end
initial
 begin
$monitor(" en=%b rst=%d S=%b R=%b Q=%b Qbar=%b ",en,rst,S,R,Q,Qbar);
S=1'b0;R=1'b0;#10
S=1'b0;R=1'b1;#10
S=1'b0;R=1'b0;#10
S=1'b1;R=1'b0;#10
S=1'b0;R=1'b0;#10
S=1'b1;R=1'b1;#10

$finish;

end
endmodule
