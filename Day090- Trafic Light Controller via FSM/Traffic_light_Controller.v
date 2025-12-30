`timescale 1ns / 1ps

module Traffic_light_Controller #
(
    parameter GREEN_TIME  = 10,
    parameter YELLOW_TIME = 4
)
(
    input clk,
    input rst,
    input sensor,
    output reg [1:0] highway_light,
    output reg [1:0] side_light
);

   localparam RED    = 2'd0,
              YELLOW = 2'd1,
              GREEN  = 2'd2;

    localparam HW_GREEN  = 3'd0,
              HW_YELLOW = 3'd1,
              ALL_RED   = 3'd2,
              SR_GREEN  = 3'd3,
              SR_YELLOW = 3'd4;

    reg [2:0] current_state, next_state;
    reg [7:0] timer;

    localparam integer GREEN_MAX  = GREEN_TIME  - 1;
    localparam integer YELLOW_MAX = YELLOW_TIME - 1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= HW_GREEN;
            timer         <= 8'd0;
        end else begin
            current_state <= next_state;

            if (current_state != next_state)
                timer <= 8'd0;
            else
                timer <= timer + 8'd1;
        end
    end

    always @(*) begin
        next_state = current_state;

        case (current_state)
            HW_GREEN:
                if (sensor)
                    next_state = HW_YELLOW;

            HW_YELLOW:
                if (timer == YELLOW_MAX)
                    next_state = ALL_RED;

            ALL_RED:
                next_state = SR_GREEN;

            SR_GREEN:
                if (!sensor && timer == GREEN_MAX)
                    next_state = SR_YELLOW;

            SR_YELLOW:
                if (timer == YELLOW_MAX)
                    next_state = HW_GREEN;

            default:
                next_state = HW_GREEN;
        endcase
    end

    always @(*) begin
        highway_light = RED;
        side_light    = RED;

        case (current_state)
            HW_GREEN:  highway_light = GREEN;
            HW_YELLOW: highway_light = YELLOW;
            SR_GREEN:  side_light    = GREEN;
            SR_YELLOW: side_light    = YELLOW;
            default: ;
        endcase
    end

endmodule
