`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 22:16:39
// Design Name: 
// Module Name: carry_look_ahead_gen
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


module carry_look_ahead_gen(
input [3:0]a,b,
input cin,
output [3:0] s,
output cout

    );
    wire [3:0] p,g;
    wire [3:0]c;
    
    and (g[0],a[0],b[0]),
    (g[1],a[1],b[1]),
    (g[2],a[2],b[2]),
    (g[3],a[3],b[3]);
    
    xor (p[0],a[0],b[0]),
    (p[1],a[1],b[1]),
    (p[2],a[2],b[2]),
    (p[3],a[3],b[3]);
    
    xor (s[0],p[0],g[0]),
    (s[1],p[1],g[1]),
    (s[2],p[2],g[2]),
    (s[3],p[3],g[3]);
    
    assign  c[0] = g[0] | (p[0] & cin),
        c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin),
        c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin),
        c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) |(p[3] & p[2] & p[1] & p[0] & cin);
    assign cout=c[3];
endmodule