`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 20:38:59
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
reg [7:0]Binaryin;
wire [7:0]twos_comp;
Binary_to_2s_complement uut (.Binaryin(Binaryin),.twos_comp(twos_comp));
initial
begin
$monitor("Binary_input=%d | twos_comp=%d ",Binaryin,twos_comp);
Binaryin=8'd42;#10
Binaryin=8'd62;#10
Binaryin=8'd79;#10
Binaryin=8'd29;#10
Binaryin=8'd37;#10
Binaryin=8'd68;#10
$finish;
end

endmodule
