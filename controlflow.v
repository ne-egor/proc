`include "simple/asm.vh"

module controlflow ( input [5:0] opcode,
					 input [3:0] funct,
					 input zero,

					 output pc_store,
					 output reg_block_w,
					 output dmem_w,
					 output [3:0] alu_funct,
					 
					 output m1_num,
					 output m2_num,
					 output m3_num,
					 output m4_num,
					 output m5_num,
					 output m6_num,
					 output m7_num
	);

	always @(*) 
		case (opcode)
			`OPCODE_AR: 
						begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= funct;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1;
							m5_num <= 0;
							m6_num <= 0;
							m7_num <= 0;
						end
			`OPCODE_ADDIU:
						begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_ADD;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_ADDI:
						begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_ADD;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_ANDIU: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_AND;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_ANDI: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_AND;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_ORIU: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_OR;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_ORI: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_OR;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_SLTIU: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_SLTU;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_SLTI: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_SLT;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 1; // dc
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 0;
						end
			`OPCODE_BEQ: begin
							pc_store <= 1;
							reg_block_w <= 0;
							dmem_w <= 0;
							alu_funct <= `FUNCT_SUB;
							m1_num <= zero;
							m2_num <= 0;
							m3_num <= 0;
							m4_num <= 0; 
							m5_num <= 0;
							m6_num <= 0;
							m7_num <= 0; //dc
						end
			`OPCODE_BNE: begin
							pc_store <= 1;
							reg_block_w <= 0;
							dmem_w <= 0;
							alu_funct <= `FUNCT_SUB;
							m1_num <= !zero;
							m2_num <= 0;
							m3_num <= 0;
							m4_num <= 0; 
							m5_num <= 0;
							m6_num <= 0;
							m7_num <= 0; //dc
						end
			`OPCODE_LW: begin
							pc_store <= 1;
							reg_block_w <= 1;
							dmem_w <= 0;
							alu_funct <= `FUNCT_ADD;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 1;
							m4_num <= 0; //dc 
							m5_num <= 0;
							m6_num <= 1;
							m7_num <= 1;
						end
			`OPCODE_SW: begin
							pc_store <= 1;
							reg_block_w <= 0;
							dmem_w <= 1;
							alu_funct <= `FUNCT_ADD;
							m1_num <= 0;
							m2_num <= 0;
							m3_num <= 0;
							m4_num <= 0; 
							m5_num <= 1;
							m6_num <= 1;
							m7_num <= 0; //dc 
						end
			`OPCODE_J: begin
							pc_store <= 1;
							reg_block_w <= 0;
							dmem_w <= 0;
							alu_funct <= 0;
							m1_num <= 0;
							m2_num <= 1;
							m3_num <= 1; // dc
							m4_num <= 1; // dc
							m5_num <= 0; // dc
							m6_num <= 1; // dc
							m7_num <= 0; // dc
						end
		endcase // opcode


endmodule