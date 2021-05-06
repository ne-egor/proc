module dmem (	input clk,    //
				input [15:0] addr,	//data
				input [15:0] id,	//data
				input w,	// control

				output [15:0] od);	//data

	reg [15:0] RAM[31:0];

	always @(posedge clk)
		if (w)
			RAM[addr] <= id;

	assign od = RAM[addr];

endmodule