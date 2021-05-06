module dataflow (	input clk,
					input rst,

					input pc_store,

					input reg_block_w,
					input dmem_w,

					input [3:0] alu_funct,

					input m1_num,
					input m2_num, 
					input m3_num, 
					input m4_num, 
					input m5_num,
					input m6_num,
					input m7_num,

					output [5:0] opcode,
					output [3:0] funct,
					output alu_zero
);

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

	alu _alu(.in_1(m5_num ? reg_block_rd2 : reg_block_rd1), .in_2(m6_num ? constant : reg_block_rd2), .op(alu_funct), .zero(alu_zero), .out(alu_out));

	dmem _dmem(.id(reg_block_rd1), .addr(alu_out), .clk(clk), .w(dmem_w), .od(dmem_out));


	/*
	controlflow _controlflow(.opcode(opcode), .funct(funct), .zero(alu_zero), 
								.pc_store(pc_store), .reg_block_w(reg_block_w), .dmem_w(dmem_w), .alu_funct(alu_funct), 
								.multy());
	*/



endmodule