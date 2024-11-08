module user_proj_example #(
parameter BITS = 7
)(
`ifdef USE_POWER_PINS
    inout vccd1,    // User area 1 1.8V supply
    inout vssd1,    // User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    //input wb_rst_i,
    //input wbs_stb_i,
    //input wbs_cyc_i,
    //input wbs_we_i,
    //input [3:0] wbs_sel_i,
   // input [31:0] wbs_dat_i,
   // input [31:0] wbs_adr_i,
   // output wbs_ack_o,
   // output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
  //  input  [127:0] la_data_in,
 //   output [127:0] la_data_out,
  //  input  [127:0] la_oenb,

    // IOs
    input  [BITS-1:0] io_in,
    output [BITS-1:0] io_out,
    output [BITS-1:0] io_oeb

    // IRQ
   // output [2:0] irq
);

    // Internal signals for top_module
    wire clk;
    wire rst;
    wire [4:0] bits;
    wire nbit_final;

    // Instantiate top_module
    agrochip top_module_inst (
        .clk(clk),
        .rst(rst),
        .bits(bits),
        .nbit_final(nbit_final) // Connect output to internal signal
    );

    // Assigning the necessary signals
    assign clk = wb_clk_i; 
    assign rst = io_in[5];
    assign bits = io_in[4:0]; // Take the lower 5 bits from io_in
	assign io_out[6] = nbit_final; // Assign nbit_final to the first bit of io_out
	assign io_oeb[6] = 1'b0;
    //assign io_out[BITS-1:8] = {BITS-9{1'b0}}; // Set the remaining bits to zero if needed
	assign io_out[5:0] = 6'b000000;
	assign io_oeb[5:0] = 6'b111111;
	
endmodule
`default_nettype wire
