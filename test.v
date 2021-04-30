
module test();
    reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg [1:0] rn_1;
    reg [1:0] rn_2;
    reg rst;
    reg [1:0] wn; // куда записываем
    reg w; // флаг записи
    reg [15:0] wd; // что записываем 

    wire [15:0] rd_1;
    wire [15:0] rd_2;

    wire reg_1_out;
	wire reg_2_out;
	wire reg_3_out;
	wire reg_4_out;

    reg_block testee(.rn_1(rn_1), .rn_2(rn_2), .rst(rst), .wn(wn), .w(w), .wd(wd), .rd_1(rd_1), .rd_2(rd_2), .reg_1_store(reg_1_out), .reg_2_store(reg_2_out), .reg_3_store(reg_3_out), .reg_4_store(reg_4_out));

    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(1, test);
	    $display("time \t clock \t rst \t rn_1 \t rn_2 \t rst \t wn \t w \t wd \t rd_1 \t rd_2");
	    $monitor(" %2d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d \t %1d", $stime, clk, rst, rn_1, rn_2, rst, wn, w, wd, rd_1, rd_2, reg_1_out, reg_2_out, reg_3_out, reg_4_out);

	    rst = 1;
	    rn_1 = 0;
	    rn_2 = 2;
	    wn = 2;
	    wd = 15;
	    w = 0;
	    #4 rst = 0; w = 1;
	    #8 wn = 17; wn = 0;
	    #8 rn_1 = 1; rn_2 = 3; wd = 100; wn = 1;
	    #8 w = 0; rn_2 = 2;

	end
endmodule


/*
module test(); //test for demult2_4
    reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg in;
    reg [1:0] num;

    wire out_1;
    wire out_2;
    wire out_3;
    wire out_4;

    demult2_4 testee(.in(in), .num(num), .out_1(out_1), .out_2(out_2), .out_3(out_3), .out_4(out_4));

    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(1, test);

	    in = 1;
	    num = 0;
	    #4 num = 1;
	    #4 num = 2;
	    #4 num = 3;
	    #4 in = 0;
	end

endmodule
*/

/* 
module test (); //test for mult4_2
	reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg [15:0] in_1;
    reg [15:0] in_2;
    reg [15:0] in_3;
    reg [15:0] in_4;

    reg [1:0] num;

    wire [15:0] out;

    mult4_2 testee(.in_1(in_1), .in_2(in_2), .in_3(in_3), .in_4(in_4), .num(num), .out(out));

    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(1, test);
	    $monitor("%1d ", out);

	    #4 in_1 = 1; in_2 = 2; in_3 = 3; in_4 = 4; num = 0;
	    #4 num = 1;
	    #4 num = 2;
	    #4 num = 3;
	end

endmodule
*/




/*
module test(); //test for register
    reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg [15:0] in; reg rst; reg store; 
    wire [15:0] out;

    register testee(.in(in), .clk(clk), .rst(rst), .store(store), .out(out));

    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(1, test);
	    $display("time \t clock \t rst \t store \t in \t out");
	    $monitor(" %2d \t %1d \t %1d \t %1d \t %1d \t %1d", $stime, clk, rst, store, in, out);

	    rst = 1;
	    in = 15;
	    store = 0;
	    #4 rst = 0; store = 1;
	    #4 store = 0; in = 17;
	    #4 in = 21;
	    #4 store = 1;

	end
endmodule
*/