`ifndef __ASM_VH
`define __ASM_VH

// Здесь хранятся макроопределения для удобного написания инструкций модельной архитектуры в машинном коде для использования в памяти инструкций.
// Названия макроопеределений говорят сами за себя.
// Порядок аргументах в макроопределениях - как в ассемблерной записи.

`include "simple/opcodes.vh"
`include "simple/funct.vh"

`define ASM_ADD(T, S1, S2) {`OPCODE_AR, T, S1, S2, `FUNCT_ADD}  // 6 2 2 2 4
`define ASM_SUB(T, S1, S2) {`OPCODE_AR, T, S1, S2, `FUNCT_SUB}  // 6 2 2 2 4
`define ASM_AND(T, S1, S2) {`OPCODE_AR, T, S1, S2, `FUNCT_AND}  // 6 2 2 2 4
`define ASM_OR(T, S1, S2)  {`OPCODE_AR, T, S1, S2, `FUNCT_OR}  // 6 2 2 2 4
`define ASM_SLTU(T, S1, S2) {`OPCODE_AR, T, S1, S2, `FUNCT_SLTU}  // 6 2 2 2 4
`define ASM_SLT(T, S1, S2) {`OPCODE_AR, T, S1, S2, `FUNCT_SLT}  // 6 2 2 2 4

`define ASM_ADDIU(T, S, IMM) {`OPCODE_ADDIU, T, S, IMM}  // 6 2 2 6
`define ASM_ADDI(T, S, IMM) {`OPCODE_ADDI, T, S, IMM}  // 6 2 2 6 
`define ASM_ANDIU(T, S, IMM) {`OPCODE_ANDIU, T, S, IMM}  // 6 2 2 6
`define ASM_ANDI(T, S, IMM) {`OPCODE_ANDI, T, S, IMM}  // 6 2 2 6
`define ASM_ORIU(T, S, IMM) {`OPCODE_ORIU, T, S, IMM}  // 6 2 2 6
`define ASM_ORI(T, S, IMM) {`OPCODE_ORI, T, S, IMM}  // 6 2 2 6
`define ASM_SLTIU(T, S, IMM) {`OPCODE_SLTIU, T, S, IMM}  // 6 2 2 6
`define ASM_SLTI(T, S, IMM) {`OPCODE_SLTI, T, S, IMM}  // 6 2 2 6

`define ASM_BEQ(S1, S2, IMM)  {`OPCODE_BEQ, S1, S2, IMM}  // 6 2 2 6
`define ASM_BNE(S1, S2, IMM)  {`OPCODE_BNE, S1, S2, IMM}  // 6 2 2 6

`define ASM_LW(T, S, IMM) {`OPCODE_LW, T, S, IMM}  // 6 2 2 6
`define ASM_SW(T, S, IMM) {`OPCODE_SW, T, S, IMM}  // 6 2 2 6

`define ASM_J(IMM) {`OPCODE_J, IMM}  // 6 10

`define ASM_NOP {`OPCODE_ADDI, 2'd0, 2'd0, 6'd0}  // 6 2 2 6

`endif // __ASM_VH
