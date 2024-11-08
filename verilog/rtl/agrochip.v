module agrochip(
    input wire clk,
    input wire rst,
    input wire [4:0] bits, // 5-bit input for comparador_5_bits
    output wire nbit_final // Output from nbit_counter
);

    // Instantiate nbit_counter
    wire obit;
    // Instantiate comparador_5_bits
    Comparador_5_bits comparador_5_bits_inst (
        .bits(bits),
        .obit(obit) // Connect output to top module output
    );
    nbit_counter nbit_counter_inst (
        .clk(clk),
        .rst(rst),
        .in(obit),
        .finalbit(nbit_final) // Connect output to the wire
    );

endmodule
