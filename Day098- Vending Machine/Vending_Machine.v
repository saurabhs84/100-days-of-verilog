`timescale 1ns / 1ps

module Vending_Machine(
    input clk,                   // System clock
    input reset,                 // Active high reset
    input [2:0] product_select,  // Product selection (0-7)
    input select_btn,            // Product selection button
    input [4:0] coin_in,         // Coin value input
    input coin_insert,           // Coin insertion trigger
    input cancel,                // Cancel transaction
    
    output reg [6:0] current_balance, // Current money inserted
    output reg [6:0] product_price,   // Selected product price
    output reg product_dispensed,     // Product dispensed (1 cycle pulse)
    output reg [6:0] change_out,      // Change amount to return
    output reg change_ready,          // Change ready flag (1 cycle pulse)
    output reg [2:0] state_out,       // Current state (for debugging)
    output reg transaction_complete   // Transaction done flag
);

    // STATE DEFINITIONS
    localparam [2:0] IDLE             = 3'd0;
    localparam [2:0] PRODUCT_SELECTED = 3'd1;
    localparam [2:0] ACCEPTING_COINS  = 3'd2;
    localparam [2:0] DISPENSE         = 3'd3;
    localparam [2:0] RETURN_CHANGE    = 3'd4;

    // PRODUCT PRICES
    localparam [6:0] PRICE_0 = 7'd15; // Soda
    localparam [6:0] PRICE_1 = 7'd20; // Chips
    localparam [6:0] PRICE_2 = 7'd25; // Candy
    localparam [6:0] PRICE_3 = 7'd30; // Juice
    localparam [6:0] PRICE_4 = 7'd35; // Water
    localparam [6:0] PRICE_5 = 7'd40; // Energy Drink
    localparam [6:0] PRICE_6 = 7'd10; // Gum
    localparam [6:0] PRICE_7 = 7'd50; // Coffee

    // INTERNAL REGISTERS
    reg [2:0] current_state, next_state;
    reg [2:0] selected_product;
    reg [6:0] balance;
    
    // SYNC AND EDGE DETECTION
    reg select_btn_s1, select_btn_s2, select_btn_prev;
    reg coin_ins_s1,   coin_ins_s2,   coin_ins_prev;
    reg cancel_s1,     cancel_s2,     cancel_prev;
    
    wire select_btn_edge = select_btn_s2 && !select_btn_prev;
    wire coin_insert_edge = coin_ins_s2  && !coin_ins_prev;
    wire cancel_edge     = cancel_s2     && !cancel_prev;

    // METASTABILITY & EDGE DETECTION
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            {select_btn_s1, select_btn_s2, select_btn_prev} <= 3'b0;
            {coin_ins_s1,   coin_ins_s2,   coin_ins_prev}   <= 3'b0;
            {cancel_s1,     cancel_s2,     cancel_prev}     <= 3'b0;
        end else begin
            select_btn_s1 <= select_btn;  
             select_btn_s2 <= select_btn_s1;   
             select_btn_prev <= select_btn_s2;
            coin_ins_s1   <= coin_insert;  
            coin_ins_s2   <= coin_ins_s1;     
            coin_ins_prev   <= coin_ins_s2;
            cancel_s1     <= cancel;       
            cancel_s2     <= cancel_s1;       
            cancel_prev     <= cancel_s2;
        end
    end

    always @(*) begin
        case (selected_product)
            3'd0: product_price = PRICE_0;
            3'd1: product_price = PRICE_1;
            3'd2: product_price = PRICE_2;
            3'd3: product_price = PRICE_3;
            3'd4: product_price = PRICE_4;
            3'd5: product_price = PRICE_5;
            3'd6: product_price = PRICE_6;
            3'd7: product_price = PRICE_7;
            default: product_price = 7'd0;
        endcase
    end

    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE:             if (select_btn_edge) next_state = PRODUCT_SELECTED;
            PRODUCT_SELECTED: if (cancel_edge) next_state = IDLE; 
                              else if (coin_insert_edge) next_state = ACCEPTING_COINS;
            ACCEPTING_COINS:  if (cancel_edge) next_state = RETURN_CHANGE;
                              else if (balance >= product_price) next_state = DISPENSE;
            DISPENSE:         next_state = RETURN_CHANGE;
            RETURN_CHANGE:    next_state = IDLE;
            default:          next_state = IDLE;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            balance <= 0;
            current_balance <= 0;
            product_dispensed <= 0;
            change_out <= 0;
            change_ready <= 0;
            selected_product <= 0;
            transaction_complete <= 0;
            state_out <= 0;
        end else begin
            current_state <= next_state;
            state_out <= current_state;
            
            // Pulse signals default to 0
            product_dispensed <= 0;
            change_ready <= 0;
            transaction_complete <= 0;

            case (current_state)
                IDLE: begin
                    balance <= 0;
                    current_balance <= 0;
                    change_out <= 0;
                    if (select_btn_edge) selected_product <= product_select;
                end

                PRODUCT_SELECTED: begin
                    if (coin_insert_edge && (coin_in == 5 || coin_in == 10 || coin_in == 20)) begin
                        balance <= coin_in;
                        current_balance <= coin_in;
                    end
                end

                ACCEPTING_COINS: begin
                    if (coin_insert_edge && (coin_in == 5 || coin_in == 10 || coin_in == 20)) begin
                        balance <= balance + coin_in;
                        current_balance <= balance + coin_in;
                    end
                    if (cancel_edge) change_out <= balance;
                end

                DISPENSE: begin
                    product_dispensed <= 1'b1;
                    change_out <= balance - product_price;
                    balance <= balance - product_price;
                end

                RETURN_CHANGE: begin
                    if (change_out > 0) change_ready <= 1'b1;
                    transaction_complete <= 1'b1;
                end
            endcase
        end
    end

endmodule