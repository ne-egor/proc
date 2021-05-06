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

endmodule
