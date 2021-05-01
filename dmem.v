module dmem (
	input clk,    // Clock
	input [15:0] addr,
	input [15:0] id,
	input w,

	output [15:0] od);

	reg [15:0] RAM[31:0];

	always @(posedge clk)
		if (w)
			RAM[addr] <= id;

	assign od = RAM[addr];

endmodule