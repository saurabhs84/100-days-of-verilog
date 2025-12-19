`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2025 17:11:13
// Design Name: 
// Module Name: fsm_1011_moore
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
module fsm_1011_moore (
    input  clk,
    input  rst,
    input  din,
    output reg y
);

parameter S0 = 3'b000, 
          S1 = 3'b001,  
          S2 = 3'b010,  
          S3 = 3'b011,
          S4 = 3'b100;  

reg [2:0] cs, ns;

always @(posedge clk or posedge rst) begin
    if (rst)
        cs <= S0;
    else
        cs <= ns;
end

always @(*) begin
    ns = cs;
    case (cs)
        S0: begin
            if (din) ns = S1;
        end

        S1: begin
            if (din) ns = S1;
            else     ns = S2;
        end

        S2: begin
            if (din) ns = S3;
            else     ns = S0;
        end

        S3: begin
            if (din) ns = S4;
            else     ns = S2;
        end

        S4: begin
            if (din) ns = S1;   
            else     ns = S2;
        end

        default: ns = S0;
    endcase
end

always @(*) begin
    case (cs)
        S4: y = 1'b1;
        default: y = 1'b0;
    endcase
end

endmodule
