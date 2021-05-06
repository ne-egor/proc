module pc (	input clk,    // control
			input rst,	//control
			input [15:0] in, //data
			input store,	//control

			output [15:0] out); //data

	register lul(.clk(clk), .rst(rst), .in(in), .store(store), .out(out));

endmodule