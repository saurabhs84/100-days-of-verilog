`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 23:31:25
// Design Name: 
// Module Name: tb_Hamming
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
module tb_Hamming;

    reg  [3:0] data_in;
    reg  [6:0] ham_with_error;
    wire [6:0] ham_encoded;
    wire [3:0] data_out;
    wire [2:0] error_position;
    wire       is_error;

    Hamming_Encoder ENC (
        .data(data_in),
        .ham_data(ham_encoded)
    );

    Hamming_Decoder DEC (
        .ham_data(ham_with_error),
        .data(data_out),
        .error_position(error_position),
        .is_error(is_error)
    );

    initial begin
        $monitor("Time=%0t | Data In=%b | Encoded=%b | Error Data=%b | Error Pos=%d | Corrected Data=%b",
                  $time, data_in, ham_encoded, ham_with_error, error_position, data_out);

        data_in = 4'b1011;
        #10 ham_with_error = ham_encoded;

        #10 ham_with_error = ham_encoded ^ 7'b0000100;

        #10 ham_with_error = ham_encoded ^ 7'b0100000;

        #10 data_in = 4'b0110;
            ham_with_error = ham_encoded ^ 7'b0000001;

        #20 $finish;
    end

endmodule

