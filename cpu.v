module cpu ();

	reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg rst;

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

	reg [5:0] opcode;
	reg [3:0] funct;
	reg alu_zero;

	wire pc_store_wire;

	wire wire_block_w_wire;
	wire dmem_w_wire;

	wire [3:0] alu_funct_wire;

	wire m1_num_wire;
	wire m2_num_wire; 
	wire m3_num_wire; 
	wire m4_num_wire; 
	wire m5_num_wire;
	wire m6_num_wire;
	wire m7_num_wire;

	wire [5:0] opcode_wire;
	wire [3:0] funct_wire;
	wire alu_zero_wire;

	assign pc_store_wire = pc_store;
	assign reg_block_w_wire = reg_block_w;
	assign dmem_w_wire = dmem_w;
	assign alu_funct_wire = alu_funct;
	assign m1_num_wire = m1_num;
	assign m2_num_wire = m2_num;
	assign m3_num_wire = m3_num;
	assign m4_num_wire = m4_num;
	assign m5_num_wire = m5_num;
	assign m6_num_wire = m6_num;
	assign m7_num_wire = m7_num;
	assign opcode_wire = opcode;
	assign funct_wire = funct;
	assign alu_zero_wire = alu_zero;

	dataflow _data(.clk(clk), .rst(rst), .pc_store(pc_store), .reg_block_w(reg_block_w), .dmem_w(dmem_w), .alu_funct(alu_funct), .m1_num(m1_num), .m2_num(m2_num), .m3_num(m3_num), .m4_num(m4_num), .m5_num(m5_num), .m6_num(m6_num), .m7_num(m7_num), .opcode(opcode_wire), .funct(funct_wire), .alu_zero(alu_zero_wire));
	controlflow _control(.opcode(opcode), .funct(funct), .zero(zero), .pc_store(pc_store_wire), .reg_block_w(reg_block_w_wire), .dmem_w(dmem_w_wire), .alu_funct(alu_funct_wire), .m1_num(m1_num_wire), .m2_num(m2_num_wire), .m3_num(m3_num_wire), .m4_num(m4_num_wire), .m5_num(m5_num_wire), .m6_num(m6_num_wire), .m7_num(m7_num_wire));


	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(0, test);

	    rst = 1;
	    #4 rst = 0;
	end

endmodule