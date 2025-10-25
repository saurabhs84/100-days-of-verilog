`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2025 20:26:07
// Design Name: 
// Module Name: Gray_to_Binary
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


module Gray_to_Binary(

input [3:0] Grayin,
output [3:0] Bout

    );
    assign Bout[3]=Grayin[3];
    assign Bout[2]=Bout[3] ^ Grayin[2];
    assign Bout[1]=Bout[2] ^ Grayin[1] ;
    assign Bout[0]=Bout[1] ^ Grayin[0];
endmodule
