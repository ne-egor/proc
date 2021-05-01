module imem ( input [15:0] addr,
	
			  output [15:0] com);

	reg [15:0] RAM[0:27]; // len of program

	initial 
		$readmemb("input/imem.mem", RAM);

	assign com = RAM[addr];

endmodule