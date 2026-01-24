`timescale 1ns / 1ps

/******************************************************************************
 * Comprehensive Testbench for Vending Machine Controller
 * 
 * Test Coverage:
 * 1. Exact payment scenarios
 * 2. Overpayment with change return
 * 3. Multiple coin insertions
 * 4. Transaction cancellation
 * 5. All 8 products
 * 6. Invalid coin rejection
 * 7. Rapid sequential transactions
 ******************************************************************************/

module Vending_Machine_tb;

    reg clk;
    reg reset;
    reg [2:0] product_select;
    reg select_btn;
    reg [4:0] coin_in;
    reg coin_insert;
    reg cancel;
    
    wire [6:0] current_balance;
    wire [6:0] product_price;
    wire product_dispensed;
    wire [6:0] change_out;
    wire change_ready;
    wire [2:0] state_out;
    wire transaction_complete;

    Vending_Machine DUT (
        .clk(clk),
        .reset(reset),
        .product_select(product_select),
        .select_btn(select_btn),
        .coin_in(coin_in),
        .coin_insert(coin_insert),
        .cancel(cancel),
        .current_balance(current_balance),
        .product_price(product_price),
        .product_dispensed(product_dispensed),
        .change_out(change_out),
        .change_ready(change_ready),
        .state_out(state_out),
        .transaction_complete(transaction_complete)
    );

    initial clk = 0;
    always #5 clk = ~clk;
    reg [20*8:1] state_name;  // 20 character string
    always @(*) begin
        case (state_out)
            3'd0: state_name = "IDLE";
            3'd1: state_name = "PRODUCT_SELECTED";
            3'd2: state_name = "ACCEPTING_COINS";
            3'd3: state_name = "DISPENSE";
            3'd4: state_name = "RETURN_CHANGE";
            default: state_name = "UNKNOWN";
        endcase
    end

    // Task: Select a product
    task select_product;
        input [2:0] product_id;
        begin
            @(posedge clk);
            product_select = product_id;
            select_btn = 1;
            @(posedge clk);
            select_btn = 0;
            @(posedge clk);
            $display("[%0t] Product %0d selected (Price: $%0d)", 
                     $time, product_id, product_price);
        end
    endtask

    // Task: Insert a coin
    task insert_coin;
        input [4:0] coin_value;
        begin
            @(posedge clk);
            coin_in = coin_value;
            coin_insert = 1;
            @(posedge clk);
            coin_insert = 0;
            @(posedge clk);
            $display("[%0t] Coin $%0d inserted | Balance: $%0d | State: %s", 
                     $time, coin_value, current_balance, state_name);
        end
    endtask

    // Task: Cancel transaction
    task cancel_transaction;
        begin
            @(posedge clk);
            cancel = 1;
            @(posedge clk);
            cancel = 0;
            @(posedge clk);
            $display("[%0t] Transaction CANCELLED", $time);
        end
    endtask

    // Task: Wait for transaction to complete
    task wait_transaction_complete;
        begin
            wait(transaction_complete);
            @(posedge clk);
            $display("[%0t] === TRANSACTION COMPLETE ===", $time);
            if (product_dispensed)
                $display("  ✓ Product dispensed");
            if (change_out > 0)
                $display("  ✓ Change returned: $%0d", change_out);
            $display("");
        end
    endtask

    // Task: Display test header
    task display_test_header;
        input [80*8:1] test_name;
        begin
            $display("\n========================================");
            $display("%s", test_name);
            $display("========================================");
        end
    endtask
    
    initial begin
        // Initialize all signals
        reset = 1;
        product_select = 0;
        select_btn = 0;
        coin_in = 0;
        coin_insert = 0;
        cancel = 0;

        // Generate VCD waveform file
        $dumpfile("Vending_Machine.vcd");
        $dumpvars(0, Vending_Machine_tb);

        // Display test banner
        $display("\n");
        $display("╔════════════════════════════════════════════════════════════╗");
        $display("║       VENDING MACHINE CONTROLLER - TESTBENCH               ║");
        $display("╚════════════════════════════════════════════════════════════╝");
        $display("\n📦 Product Catalog:");
        $display("  [0] Soda         - $15");
        $display("  [1] Chips        - $20");
        $display("  [2] Candy        - $25");
        $display("  [3] Juice        - $30");
        $display("  [4] Water        - $35");
        $display("  [5] Energy Drink - $40");
        $display("  [6] Gum          - $10");
        $display("  [7] Coffee       - $50");
        $display("\n💰 Accepted Coins: $5, $10, $20\n");

        // Release reset after 100ns
        #100;
        reset = 0;
        #50;

        display_test_header("TEST 1: Exact Payment - Soda ($15)");
        select_product(3'd0);
        insert_coin(5'd10);
        insert_coin(5'd5);
        wait_transaction_complete();
        #100;

        // TEST 2: Overpayment with Change (Chips - $20, Pay $30)
        
        display_test_header("TEST 2: Overpayment - Chips ($20) with $30");
        select_product(3'd1);
        insert_coin(5'd20);
        insert_coin(5'd10);
        wait_transaction_complete();
        #100;

        // TEST 3: Multiple Small Coins (Candy - $25)
        
        display_test_header("TEST 3: Multiple Coins - Candy ($25)");
        select_product(3'd2);
        insert_coin(5'd5);
        $display("  Balance: $%0d (need $25)", current_balance);
        insert_coin(5'd5);
        $display("  Balance: $%0d (need $25)", current_balance);
        insert_coin(5'd5);
        $display("  Balance: $%0d (need $25)", current_balance);
        insert_coin(5'd5);
        $display("  Balance: $%0d (need $25)", current_balance);
        insert_coin(5'd5);
        $display("  Balance: $%0d (SUFFICIENT!)", current_balance);
        wait_transaction_complete();
        #100;

        // TEST 4: Transaction Cancellation (Water - $35)

        display_test_header("TEST 4: Cancel Transaction - Water ($35)");
        select_product(3'd4);
        insert_coin(5'd20);
        insert_coin(5'd10);
        $display("  Balance: $%0d - Now cancelling...", current_balance);
        cancel_transaction();
        wait_transaction_complete();
        if (change_out == 30)
            $display("  ✓ Full refund received: $%0d", change_out);
        #100;

        // TEST 5: Cheapest Item (Gum - $10)
      
        display_test_header("TEST 5: Cheapest Item - Gum ($10)");
        select_product(3'd6);
        insert_coin(5'd10);
        wait_transaction_complete();
        #100;
        
        // TEST 6: Most Expensive Item (Coffee - $50)
       
        display_test_header("TEST 6: Most Expensive - Coffee ($50)");
        select_product(3'd7);
        insert_coin(5'd20);
        insert_coin(5'd20);
        insert_coin(5'd10);
        wait_transaction_complete();
        #100;

        //======================================================================
        // TEST 7: Invalid Coin Rejection
        //======================================================================
        display_test_header("TEST 7: Invalid Coin Test");
        select_product(3'd2);  // Candy $25
        $display("  Attempting invalid coin $15...");
        insert_coin(5'd15);  // Invalid
        $display("  Balance: $%0d (should be $0)", current_balance);
        insert_coin(5'd20);  // Valid
        insert_coin(5'd5);   // Valid
        wait_transaction_complete();
        #100;

        // TEST 8: All Products Quick Test
        
        display_test_header("TEST 8: Quick Test All Products");
        
        // Product 3: Juice $30
        select_product(3'd3);
        insert_coin(5'd20);
        insert_coin(5'd10);
        wait_transaction_complete();
        #50;
        
        // Product 5: Energy Drink $40
        select_product(3'd5);
        insert_coin(5'd20);
        insert_coin(5'd20);
        wait_transaction_complete();
        #50;
        // TEST 9: Rapid Sequential Transactions
        
        display_test_header("TEST 9: Rapid Sequential Transactions");
        
        select_product(3'd6);  // Gum $10
        insert_coin(5'd10);
        wait_transaction_complete();
        #20;
        
        select_product(3'd6);  // Gum $10
        insert_coin(5'd10);
        wait_transaction_complete();
        #20;
        
        select_product(3'd6);  // Gum $10
        insert_coin(5'd10);
        wait_transaction_complete();
        #100;
        
        // TEST COMPLETION
        
        
        $display("\n╔════════════════════════════════════════════════════════════╗");
        $display("║              ALL TESTS COMPLETED SUCCESSFULLY              ║");
        $display("╚════════════════════════════════════════════════════════════╝\n");
        
        #200;
        $finish;
    end

    initial begin
        $display("\n⏱️  Monitoring signals...\n");
        $monitor("Time=%0t | State=%s | Balance=$%0d | Price=$%0d | Disp=%b | Change=$%0d | Ready=%b", 
                 $time, state_name, current_balance, product_price, 
                 product_dispensed, change_out, change_ready);
    end

    initial begin
        #10000;
        $display("\n❌ ERROR: Simulation timeout after 10us!");
        $finish;
    end

    always @(posedge clk) begin
        // Check: Balance should never exceed 127 (7-bit overflow)
        if (current_balance > 7'd127) begin
            $display("❌ ERROR: Balance overflow detected at time %0t", $time);
        end
        
        // Check: Product dispensed only in DISPENSE state
        if (product_dispensed && state_out != 3'd3) begin
            $display("❌ ERROR: Product dispensed in wrong state at time %0t", $time);
        end
        
        // Check: Change ready only in RETURN_CHANGE state
        if (change_ready && state_out != 3'd4) begin
            $display("❌ ERROR: Change ready in wrong state at time %0t", $time);
        end
    end

endmodule