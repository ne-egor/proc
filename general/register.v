module register (input [15:0] in,
                 input clk,
                 input rst,
                 input store,

                 output reg [15:0] out);

    always @(posedge clk, posedge rst)
        if (rst)
            out <= 0;
        else if (store)
            out <= in;

endmodule
