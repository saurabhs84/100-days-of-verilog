`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 20:59:47
// Design Name: 
// Module Name: Binary_to_BCD
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


module Binary_to_BCD(
input [7:0]Bin,
output reg [11:0] BCD

    );
    
    integer i;
    always @(Bin) begin
      BCD= 0;
        for (i = 7; i >= 0; i = i - 1) begin
            
            if (BCD[3:0] >= 5)
                BCD[3:0] = BCD[3:0] + 3;
            if (BCD[7:4] >= 5)
                BCD[7:4] = BCD[7:4] + 3;
            if (BCD[11:8] >= 5)
                BCD[11:8] = BCD[11:8] + 3;

            BCD = {BCD[10:0], Bin[i]};
        end
    end
    
    
endmodule
