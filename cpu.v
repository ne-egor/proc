`include "simple/asm.vh"


module cpu (	input clk,
				input rst
);

	reg pc_store;

	reg reg_block_w;
	reg dmem_w;

	reg [3:0] alu_funct;

	reg m1_num;
	reg m2_num; 
	reg m3_num; 
	reg m4_num; 
	reg m5_num;
	reg m6_num;
	reg m7_num;

	wire [5:0] opcode;
	wire [3:0] funct;
	wire zero;


	wire [15:0] pc_in;
	wire [15:0] pc_out;
	wire [15:0] pc_next;
	
	pc _pc(.clk(clk), .rst(rst), .store(pc_store), .in(pc_in), .out(pc_out));

	// assign pc_in = pc_out + 1;

	wire [15:0] com;

	imem _imem(.addr(pc_out), .com(com));

	//output [5:0] opcode;
	wire [1:0] t;
	wire [1:0] s1;
	wire [1:0] s2;
	//output [3:0] funct;
	wire [5:0] constant;
	wire [9:0] j;

	assign {opcode, t, s1, s2, funct} = com;
	assign constant = com[5:0];
	assign j = com[9:0];

	//mux2_1 m1(.in_1(pc_out + 1), .in_2(pc_out + 1 + constant), .num(m1_num), .out)
	assign pc_next = m1_num ? pc_out + 1 + constant : pc_out + 1;
	assign pc_in = m2_num ? j : pc_next;

	wire [15:0] reg_block_rd1;
	wire [15:0] reg_block_rd2;

	wire [15:0] alu_out;
	//output alu_zero;

	wire [15:0] dmem_out;

	reg_block _reg_block(.rn_1(m3_num ? s1 : t), .rn_2(m4_num ? s2 : s1), .wn(t), .clk(clk), .rst(rst), .w(reg_block_w), 
		.wd(m7_num ? dmem_out : alu_out), .rd_1(reg_block_rd1), .rd_2(reg_block_rd2));

	alu _alu(.in_1(m5_num ? reg_block_rd2 : reg_block_rd1), .in_2(m6_num ? constant : reg_block_rd2), .op(alu_funct), .zero(zero), .out(alu_out));

	dmem _dmem(.id(reg_block_rd1), .addr(alu_out), .clk(clk), .w(dmem_w), .od(dmem_out));




	always @(opcode, funct, zero) 
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



	/*
	controlflow _controlflow(.opcode(opcode), .funct(funct), .zero(alu_zero), 
								.pc_store(pc_store), .reg_block_w(reg_block_w), .dmem_w(dmem_w), .alu_funct(alu_funct), 
								.multy());
	*/



endmodule