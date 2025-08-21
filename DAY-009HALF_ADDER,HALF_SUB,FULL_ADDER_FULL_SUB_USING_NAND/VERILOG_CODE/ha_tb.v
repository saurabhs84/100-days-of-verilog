`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2025 23:25:46
// Design Name: 
// Module Name: ha_tb
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


module ha_tb;
reg a,b;
wire sum,carry;
ha_nand uut(.a(a),.b(b),.sum(sum),.carry(carry));

initial begin
$display("\t \t time  a b sum carry");
$monitor("%t  %b %b %b %b",$time,a,b,sum,carry);
a=0;b=0;#4
a=0;b=1;#4
a=1;b=0;#4
a=1;b=1;#4
$finish;

end
endmodule
