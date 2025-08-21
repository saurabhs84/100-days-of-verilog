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


module hs_nand( input a,b,
output diff,bout

    );
    wire t1,t2,t3,t4,t5;
    nand n1(t1,a,b);
    nand n2(t2,t1,a);
    nand n3(t3,t1,b);
    nand n4(diff,t2,t3);
    nand n5(t4,a,a);
    nand n6(t5,t4,b);
    nand n7(bout,t5,t5);
    
    
    
    
endmodule
