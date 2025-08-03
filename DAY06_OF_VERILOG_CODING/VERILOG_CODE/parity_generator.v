`timescale 1ns / 1ps

module parity_generator (
  input wire [7:0] data_in,
  output wire parity
);

assign parity = ^data_in;

endmodule