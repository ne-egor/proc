`include "simple/asm.vh"

module imem ( input [15:0] addr,	//data
	
			  output reg [15:0] com);	//data + control


	always @(*)
		case (addr)
			0: com <= `ASM_ADDIU(2'b00, 2'b00, 6'b111001); //$0 = $0 + 57
			1: com <= `ASM_ADDIU(2'b01, 2'b00, 6'b000001); //$1 = $0 + 1
			2: com <= `ASM_AND(2'b10, 2'b00, 2'b01); //$2 = $0 & $1
		endcase

	/* 
	reg [15:0] RAM[0:27]; // len of program

	initial 
		$readmemb("input/imem.mem", RAM);

	assign com = RAM[addr];
	*/

endmodule