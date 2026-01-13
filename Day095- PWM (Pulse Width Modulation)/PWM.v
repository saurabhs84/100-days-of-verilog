`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 12:37:43
// Design Name: 
// Module Name: PWM
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

module PWM #(
    parameter PERIOD = 100,
    parameter WIDTH  = 8
)(
    input clk,rst,enable,polarity, 
    input [WIDTH-1:0] duty,                  
    output reg pwm_out,
    output [WIDTH-1:0] count_out   
);

    reg [WIDTH-1:0] counter;
    reg pwm_internal;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter      <= 0;
            pwm_internal <= 1'b0;
        end 
        else begin
            if (counter >= PERIOD - 1)
                counter <= 0;
            else
                counter <= counter + 1;
            
            if (duty == 0)
                pwm_internal <= 1'b0;
            else if (duty >= PERIOD)
                pwm_internal <= 1'b1;
            else
                pwm_internal <= (counter < duty);
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pwm_out <= 1'b0;
        end
        else begin
            if (enable)
                pwm_out <= polarity ? ~pwm_internal : pwm_internal;
            else
                pwm_out <= 1'b0;
        end
    end
    
    assign count_out = counter;

endmodule
