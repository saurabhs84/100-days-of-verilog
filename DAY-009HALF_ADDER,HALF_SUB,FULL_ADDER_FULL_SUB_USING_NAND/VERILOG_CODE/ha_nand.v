`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2025 22:58:39
// Design Name: 
// Module Name: ha_nand
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


module ha_nand( input a,b,
output sum,carry

    );
    wire t1,t2,t3;
    nand n1(t1,a,b);
    nand n2(t2,t1,a);
    nand n3(t3,t1,b);
    nand n4(sum,t2,t3);
    nand n5(carry,t1,t1);
    
    
    
    
endmodule
