`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 02:38:22
// Design Name: 
// Module Name: spi_state
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

module spi_state (
    input clk, reset,  
    input [15:0] datain,   // Data to transmit
    output spi_cs_l,    // Active-low chip select
    output spi_sclk,    // SPI clock
    output spi_data,    // MOSI
    output [4:0]  counter
);

    localparam IDLE  = 2'd0,LOAD  = 2'd1,
               SHIFT = 2'd2,DONE  = 2'd3;

    reg [1:0]  state;
    reg [15:0] shift_reg;
    reg [4:0]  count;
    reg        cs_l;
    reg        sclk;
    reg        mosi;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state     <= IDLE;
            shift_reg<= 16'b0;
            count     <= 5'd0;
            cs_l      <= 1'b1;
            sclk      <= 1'b0;
            mosi      <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    cs_l  <= 1'b1;
                    sclk  <= 1'b0;
                    count <= 5'd16;
                    state <= LOAD;
                end

                LOAD: begin
                    cs_l       <= 1'b0;
                    shift_reg  <= datain;
                    mosi       <= datain[15]; 
                    state      <= SHIFT;
                end

                SHIFT: begin
                    sclk <= ~sclk;

                    if (sclk == 1'b0) begin
                       
                        shift_reg <= {shift_reg[14:0], 1'b0};
                        mosi      <= shift_reg[14];
                        count     <= count - 1;
                    end

                    if (count == 1 && sclk == 1'b1)
                        state <= DONE;
                end

                DONE: begin
                    cs_l  <= 1'b1;
                    sclk  <= 1'b0;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

    assign spi_cs_l = cs_l;
    assign spi_sclk = sclk;
    assign spi_data = mosi;
    assign counter  = count;

endmodule

