`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2025 18:01:48
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
reg [7:0]in;
wire [2:0]out;
Priority_Encoder uut (.in(in),.out(out));
always 
begin
in = $random;
#10;

end
initial begin
$monitor("time=%t in=%b out=%b",$time ,in,out);
#100 $finish;
end
endmodule
