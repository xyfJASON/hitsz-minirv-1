
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/06 09:34:05
// Design Name: 
// Module Name: testCPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// use for trace

module testCPU(
    input         clk,
    input         rst_n,

    input  [31:0] dramrd,
    input  [31:0] inst,
    output [31:0] pc,
    output [31:0] aluc, 
    output [31:0] rd2,
    output        dram_we,
    
    output [31:0] debug_wb_pc,
    output        debug_wb_ena,
    output [4:0]  debug_wb_reg,
    output [31:0] debug_wb_value
    );

    wire [1:0] npc_op, wd_sel;
    wire rf_we, alub_sel, branch;
    wire [2:0] sext_op;
    wire [3:0] alu_op;
    wire zero, sgn;

    wire [31:0] npc, pc4;
    wire [31:0] imm;
    wire [31:0] rd1;
    wire [31:0] wD;

    assign debug_wb_pc = pc;
    assign debug_wb_ena = rf_we;
    assign debug_wb_reg = inst[11:7];
    assign debug_wb_value = wD;

    PC U_PC(
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (pc_en),
        .npc        (npc),
        .pc         (pc)
    );

    SEXT U_SEXT(
        .din        (inst[31:7]),
        .sext_op    (sext_op),
        .ext        (imm)
    );

    RF U_RF(
        .clk        (clk),
        .rst_n      (rst_n),
        .rR1        (inst[19:15]),
        .rR2        (inst[24:20]),
        .wR         (inst[11:7]),
        .wD_aluc    (aluc),
        .wD_dramrd  (dramrd),
        .wD_npcpc4  (pc4),
        .wD_sextext (imm),
        .rf_we      (rf_we),
        .wd_sel     (wd_sel),
        .rd1        (rd1),
        .rd2        (rd2),
        .wD         (wD)
    );

    ALU U_ALU(
        .rfrd1      (rd1),
        .rfrd2      (rd2),
        .sextext    (imm),
        .C          (aluc),
        .zero       (zero),
        .sgn        (sgn),
        .alu_op     (alu_op),
        .alub_sel   (alub_sel),
        .branch     (branch)
    );

    NPC U_NPC(
        .pc         (pc),
        .imm        (imm),
        .aluc       (aluc),
        .npc_op     (npc_op),
        .npc        (npc),
        .pc4        (pc4)
    );

    Control U_Control(
        .funct7     (inst[31:25]),
        .funct3     (inst[14:12]),
        .opcode     (inst[6:0]),
        .zero       (zero),
        .sgn        (sgn), 
        .npc_op     (npc_op),
        .rf_we      (rf_we),
        .wd_sel     (wd_sel),
        .sext_op    (sext_op),
        .alu_op     (alu_op),
        .alub_sel   (alub_sel),
        .branch     (branch),
        .dram_we    (dram_we),
        
        .pc_en      (pc_en)
    );

endmodule
