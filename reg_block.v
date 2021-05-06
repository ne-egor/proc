module reg_block( input [1:0] rn_1,	//
                  input [1:0] rn_2,
                  input [1:0] wn,
                  input clk,
                  input rst,	// control
                  input w,		// control
                  input [15:0] wd,

                  output [15:0] rd_1,
                  output [15:0] rd_2);

    //register arr [3:0];
    wire [15:0] reg_1_out;
	wire [15:0] reg_2_out;
	wire [15:0] reg_3_out;
	wire [15:0] reg_4_out;

	wire reg_1_store;
	wire reg_2_store;
	wire reg_3_store;
	wire reg_4_store;

    register reg_1(.in(wd), .clk(clk), .rst(rst), .store(reg_1_store), .out(reg_1_out));
    register reg_2(.in(wd), .clk(clk), .rst(rst), .store(reg_2_store), .out(reg_2_out));
    register reg_3(.in(wd), .clk(clk), .rst(rst), .store(reg_3_store), .out(reg_3_out));
    register reg_4(.in(wd), .clk(clk), .rst(rst), .store(reg_4_store), .out(reg_4_out));

    mult4_2 to_rd_1(.in_1(reg_1_out), .in_2(reg_2_out), .in_3(reg_3_out), .in_4(reg_4_out), .num(rn_1), .out(rd_1));
    mult4_2 to_rd_2(.in_1(reg_1_out), .in_2(reg_2_out), .in_3(reg_3_out), .in_4(reg_4_out), .num(rn_2), .out(rd_2));

    demult2_4 store_signal(.in(w), .num(wn), .out_1(reg_1_store), .out_2(reg_2_store), .out_3(reg_3_store), .out_4(reg_4_store));



endmodule

/*
                      output [15:0] reg_1_out,
	output [15:0] reg_2_out,
	output [15:0] reg_3_out,
	output [15:0] reg_4_out
	*/

	/*
	output reg_1_store,
	output reg_2_store,
	output reg_3_store,
	output reg_4_store
	*/