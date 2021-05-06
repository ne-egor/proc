`include "simple/asm.vh"

module imem ( input [15:0] addr,	//data
	
			  output reg [15:0] com);	//data + control


	always @(*)
		case (addr)
			0: com <= `ASM_ADDIU(2'b00, 2'b00, 6'b111001); //$0 = $0 + 57
			1: com <= `ASM_ADDIU(2'b01, 2'b00, 6'b000001); //$1 = $0 + 1
			2: com <= `ASM_AND(2'b10, 2'b00, 2'b01); //$2 = $0 & $1
			3: com <= `ASM_SW(2'b10, 2'b11, 6'b000010); //mem[$3(0) + 2] = $2;
			4: com <= `ASM_LW(2'b00, 2'b11, 6'b000010); //$0 = mem[$3 + 2];
			5: com <= `ASM_BEQ(2'b00, 2'b10, 6'b000001); //$0 == $1? goto 7 : goto 6;
			6: com <= `ASM_SUB(2'b00, 2'b00, 2'b00); //$0 = $0 - $0;
			7: com <= `ASM_ADDIU(2'b00, 2'b00, 6'b000111); //$0 = $0 + 7;
			8: com <= `ASM_J(10'b0000000101); //goto 5;
		endcase

	/* 
	reg [15:0] RAM[0:27]; // len of program

	initial 
		$readmemb("input/imem.mem", RAM);

	assign com = RAM[addr];
	*/

endmodule