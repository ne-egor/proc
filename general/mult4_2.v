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

