module pc (
	input clk,    // Clock
	input rst,
	input [15:0] in,
	input store,

	output [15:0] out);

	register lul(.clk(clk), .rst(rst), .in(in), .store(store), .out(out));

endmodule