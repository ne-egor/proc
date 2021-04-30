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


module mult4_2 (input [15:0] in_1,
                input [15:0] in_2,
                input [15:0] in_3,
                input [15:0] in_4,
                input [1:0] num,

                output reg [15:0] out);

    always @(*)
        case (num)
            0: out <= in_1;
            1: out <= in_2;  
            2: out <= in_3;  
            3: out <= in_4;  
            //default: out <= 0;
        endcase

endmodule

module demult2_4 ( input in,
                   input [1:0] num,

                   output out_1,
                   output out_2,
                   output out_3,
                   output out_4); 

    assign out_1 = num == 0 ? in : 0;
    assign out_2 = num == 1 ? in : 0;
    assign out_3 = num == 2 ? in : 0;
    assign out_4 = num == 3 ? in : 0;

    /*
    always @(*)
        case (num)
            0: begin
                out_1 <= in;
                out_2 <= 0;
                out_3 <= 0;
                out_4 <= 0;
               end 
            1: begin
                out_1 <= 0;
                out_2 <= in;
                out_3 <= 0;
                out_4 <= 0;
               end  
            2: begin
                out_1 <= 0;
                out_2 <= 0;
                out_3 <= in;
                out_4 <= 0;
               end  
            3: begin
                out_1 <= 0;
                out_2 <= 0;
                out_3 <= 0;
                out_4 <= in;
               end  
        endcase
        */

endmodule














