`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 20:47:52
// Design Name: 
// Module Name: armstrong
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

module armstrong(
    input  [8:0] number,
    output reg   is_armstrong
);

parameter ARMSTRONG     = 1'b1,
          NOT_ARMSTRONG = 1'b0;

reg [8:0]  temp_num;
reg [3:0]  digit;
reg [15:0] sum;

always @(*) begin
    sum      = 0;
    temp_num = number;

    while (temp_num != 0) begin
        digit    = temp_num % 10;
        sum      = sum + (digit * digit * digit);
        temp_num = temp_num / 10;
    end

    if (sum == number)
        is_armstrong = ARMSTRONG;
    else
        is_armstrong = NOT_ARMSTRONG;
end

endmodule

