`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2025 15:22:57
// Design Name: 
// Module Name: freq_div_by5
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

module mod_5counter (input clk,reset,
output reg [2:0] counter );

always @(posedge clk )begin
if (reset)
counter <=0;
else if (counter == 4)
counter <=0;
else 
counter <= counter + 1;
end
endmodule

module D_flip_flop(
            input clk,reset,d,
            output reg Q);

 always @(posedge clk)
 begin
 
 if(reset)
 Q <=1'b0;
 
 else 
 Q <= d;
 
 end
endmodule
module freq_div_by5(
input clk,reset,
output clk_by5
    );
    
    wire [2:0]q;
    wire temp;
    
    mod_5counter m1 (clk,reset,q);
    D_flip_flop D (~clk,reset,q[1],temp);
    or (clk_by5,temp,q[1]);
endmodule
