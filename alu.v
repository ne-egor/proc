`include "simple/funct.vh"

module alu ( input [15:0] in_1,
             input [15:0] in_2,
             input [3:0] op,

             output zero,
             output reg [15:0] out );

    always @(in_1, in_2, op) begin
        case (op)
        `FUNCT_ADD: out <= in_1 + in_2;
        `FUNCT_SUB: out <= in_1 - in_2;
        `FUNCT_AND: out <= in_1 & in_2;
        `FUNCT_OR: out <= in_1 | in_2;
        //`FUNCT_SLTU: out = in_1 (***) in_2;
        //`FUNCT_SLT: out = in_1 (**) in_2;
        default: out <= 0;
        endcase
    end
    assign zero = out == 0;

endmodule
