`timescale 1ns / 1ps

module nor_gate(
    input Vin1, Vin2,
    output Vout
);
    supply0 gnd;
    supply1 vdd;
    wire temp;

    // PMOS pull-up network
    pmos (temp, vdd, Vin1);
    pmos (Vout, temp, Vin2);

    // NMOS pull-down network
    nmos (Vout, gnd, Vin1);
    nmos (Vout, gnd, Vin2);
endmodule
