module cpu ();

	reg clk = 0;
    always #2 clk = !clk;
    initial #75 $finish;

    reg rst;

    dataflow _data(.clk(clk), .rst(rst));

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(0, cpu);

	    rst = 1;
	    #4 rst = 0;
	end

endmodule