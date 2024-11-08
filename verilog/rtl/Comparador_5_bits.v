module Comparador_5_bits(input wire [4:0] bits,
                         output reg obit);

always @(bits)
    if(bits >= 5'b10000 && bits <= 5'b11000)
        obit = 1'b1;
    else
        obit = 1'b0;

endmodule
