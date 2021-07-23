
module miniCPU(
    input clk,
    input rst_n,
    
    input  [31:0] irom_inst,
    output [31:0] irom_pc,
    
    input  [31:0] dram_rd,
    output [31:0] dram_adr,
    output [31:0] dram_wdin,
    output dram_we,
    
    output        debug_wb_have_inst,
    output [31:0] debug_wb_pc,
    output        debug_wb_ena,
    output [4:0]  debug_wb_reg,
    output [31:0] debug_wb_value
    );
    
    // control signals
    wire npc_op_EX;
    wire [1:0] wd_sel_ID, wd_sel_EX, wd_sel_MEM;
    wire rf_we_ID, rf_we_EX, rf_we_MEM, rf_we_WB;
    wire alub_sel_ID, alub_sel_EX;
    wire dram_we_ID, dram_we_EX, dram_we_MEM;
    wire [2:0] sext_op_ID, sext_op_EX;
    wire [3:0] alu_op_ID, alu_op_EX;
    wire zero_EX, sgn_EX;
    wire [2:0] branch_ID, branch_EX;
    wire [1:0] jump_ID, jump_EX;
    // info signals
    wire [31:0] pcimm_ID, pcimm_EX;
    wire [31:0] npc, npc_bj_EX;
    wire [31:0] pc_IF, pc_ID;
    wire [31:0] pc4_IF, pc4_ID;
    wire [31:0] inst_IF, inst_ID;
    wire [31:0] imm_ID, imm_EX;
    wire [31:0] rd1_ID, rd1_EX;
    wire [31:0] rd2_ID, rd2_EX, rd2_MEM;
    wire [31:0] aluc_EX, aluc_MEM;
    wire [31:0] dram_rd_MEM;
    wire [31:0] wD_EX, wD_EX_tmp, wD_MEM, wD_MEM_tmp, wD_WB;
    wire [4:0] wR_ID, wR_EX, wR_MEM, wR_WB;

// ------------------------- DEBUG(TRACE) ------------------------- //
    wire [31:0] debug_pc_EX, debug_pc_MEM, debug_pc_WB;
    wire debug_have_inst_ID, debug_have_inst_EX, debug_have_inst_MEM, debug_have_inst_WB;
    assign debug_wb_ena = rf_we_WB;
    assign debug_wb_reg = wR_WB;
    assign debug_wb_value = wD_WB;
    assign debug_wb_pc = debug_pc_WB;
    assign debug_wb_have_inst = debug_have_inst_WB;
// ------------------------- DEBUG(TRACE) ------------------------- //

// ------------------------- STALL & FLUSH & FORWARDING ------------------------- //
    wire re1_ID, re2_ID;
    wire [31:0] rd1_f, rd2_f;
    wire rd1_op, rd2_op;
    wire stall_PC, stall_IF_ID, stall_ID_EX, stall_EX_MEM, stall_MEM_WB;
    wire flush_IF_ID, flush_ID_EX, flush_EX_MEM, flush_MEM_WB;
    hzDetect U_hzDetect(
        .clk            (clk),
        .rst_n          (rst_n),
        
        .wd_sel         (wd_sel_EX),
        .re1_ID         (re1_ID),
        .re2_ID         (re2_ID),
        .we_EX          (rf_we_EX),
        .we_MEM         (rf_we_MEM),
        .we_WB          (rf_we_WB),
        .rR1_ID         (inst_ID[19:15]),
        .rR2_ID         (inst_ID[24:20]),
        .wR_EX          (wR_EX),
        .wR_MEM         (wR_MEM),
        .wR_WB          (wR_WB),
        .wD_EX          (wD_EX),
        .wD_MEM         (wD_MEM),
        .wD_WB          (wD_WB),
        .npc_op         (npc_op_EX),
        
        .stall_PC       (stall_PC),
        .stall_IF_ID    (stall_IF_ID),
        .stall_ID_EX    (stall_ID_EX),
        .stall_EX_MEM   (stall_EX_MEM),
        .stall_MEM_WB   (stall_MEM_WB),
        .flush_IF_ID    (flush_IF_ID),
        .flush_ID_EX    (flush_ID_EX),
        .flush_EX_MEM   (flush_EX_MEM),
        .flush_MEM_WB   (flush_MEM_WB),
        .rd1_f          (rd1_f),
        .rd2_f          (rd2_f),
        .rd1_op         (rd1_op),
        .rd2_op         (rd2_op)
    );
// ------------------------- STALL & FLUSH & FORWARDING ------------------------- // 

// ------------------------- IF ------------------------- //    
    Adder1 U_Adder1(
        .pc     (pc_IF),
        .pc4    (pc4_IF)
    );
    PC U_PC(
        .clk        (clk),
        .rst_n      (rst_n),
        .stall      (stall_PC),
        .npc        (npc),
        .pc         (pc_IF)
    );
    NPC U_NPC(
        .pc4        (pc4_IF),
        .npc_bj     (npc_bj_EX),
        .npc_op     (npc_op_EX),
        .npc        (npc)
    );
    pr_IF_ID U_pr_IF_ID(
        .clk        (clk),
        .rst_n      (rst_n),
        .stall      (stall_IF_ID),
        .flush      (flush_IF_ID),
        
        .pc_i       (pc_IF),
        .pc4_i      (pc4_IF),
        .inst_i     (inst_IF),
        
        .pc_o       (pc_ID),
        .pc4_o      (pc4_ID),
        .inst_o     (inst_ID)
    );
    assign inst_IF = irom_inst;
    assign irom_pc = pc_IF;
// ------------------------- IF ------------------------- //

// ------------------------- ID ------------------------- //
    Adder2 U_Adder2(
        .pc     (pc_ID),
        .imm    (imm_ID),
        .pcimm  (pcimm_ID)
    );
    SEXT U_SEXT(
        .din        (inst_ID[31:7]),
        .sext_op    (sext_op_ID),
        .ext        (imm_ID)
    );
    RF U_RF(
        .clk        (clk),
        .rst_n      (rst_n),
        .rR1        (inst_ID[19:15]),
        .rR2        (inst_ID[24:20]),
        .wR         (wR_WB),
        .wD         (wD_WB),
        .we         (rf_we_WB),
        .rd1        (rd1_ID),
        .rd2        (rd2_ID)
    );
    assign wR_ID = inst_ID[11:7];
    Control U_Control(
        .funct7     (inst_ID[31:25]),
        .funct3     (inst_ID[14:12]),
        .opcode     (inst_ID[6:0]),
        .wd_sel     (wd_sel_ID),
        .alu_op     (alu_op_ID),
        .alub_sel   (alub_sel_ID),
        .rf_we      (rf_we_ID),
        .dram_we    (dram_we_ID),
        .sext_op    (sext_op_ID),
        .branch     (branch_ID),
        .jump       (jump_ID),
        .re1        (re1_ID),
        .re2        (re2_ID),
        
        .debug_have_inst    (debug_have_inst_ID)
    );
    pr_ID_EX U_pr_ID_EX(
        .clk        (clk),
        .rst_n      (rst_n),
        .flush      (flush_ID_EX),
        
        .wd_sel_i   (wd_sel_ID),
        .alu_op_i   (alu_op_ID),
        .alub_sel_i (alub_sel_ID),
        .rf_we_i    (rf_we_ID),
        .dram_we_i  (dram_we_ID),
        .branch_i   (branch_ID),
        .jump_i     (jump_ID),
        .pcimm_i    (pcimm_ID),
        .rd1_i      (rd1_ID),
        .rd2_i      (rd2_ID),
        .imm_i      (imm_ID),
        .wD_i       (pc4_ID),
        .wR_i       (wR_ID),
        
        .rd1_f      (rd1_f),
        .rd2_f      (rd2_f),
        .rd1_op     (rd1_op),
        .rd2_op     (rd2_op),
        
        .wd_sel_o   (wd_sel_EX),
        .alu_op_o   (alu_op_EX),
        .alub_sel_o (alub_sel_EX),
        .rf_we_o    (rf_we_EX),
        .dram_we_o  (dram_we_EX),
        .branch_o   (branch_EX),
        .jump_o     (jump_EX),
        .pcimm_o    (pcimm_EX),
        .rd1_o      (rd1_EX),
        .rd2_o      (rd2_EX),
        .imm_o      (imm_EX),
        .wD_o       (wD_EX_tmp),
        .wR_o       (wR_EX),
        
        .debug_pc_i         (pc_ID),
        .debug_pc_o         (debug_pc_EX),
        .debug_have_inst_i  (debug_have_inst_ID),
        .debug_have_inst_o  (debug_have_inst_EX)
    );
// ------------------------- ID ------------------------- //

// ------------------------- EX ------------------------- //
    auxControl U_auxControl(
        .branch     (branch_EX),
        .jump       (jump_EX),
        .zero       (zero_EX),
        .sgn        (sgn_EX), 
        .pcimm      (pcimm_EX),
        .aluc       (aluc_EX),
        .npc_op     (npc_op_EX),
        .npc_bj     (npc_bj_EX)
    );
    ALU U_ALU(
        .rfrd1      (rd1_EX),
        .rfrd2      (rd2_EX),
        .sextext    (imm_EX),
        .C          (aluc_EX),
        .zero       (zero_EX),
        .sgn        (sgn_EX),
        .alu_op     (alu_op_EX),
        .alub_sel   (alub_sel_EX)
    );
    MUX1 U_MUX1(
        .wd_sel     (wd_sel_EX),
        .wD         (wD_EX_tmp),
        .imm        (imm_EX),
        .aluc       (aluc_EX),
        .wD_o       (wD_EX)
    );
    pr_EX_MEM U_pr_EX_MEM(
        .clk        (clk),
        .rst_n      (rst_n),
        
        .wd_sel_i   (wd_sel_EX),
        .rf_we_i    (rf_we_EX),
        .dram_we_i  (dram_we_EX),
        .wR_i       (wR_EX),
        .wD_i       (wD_EX),
        .aluc_i     (aluc_EX),
        .rd2_i      (rd2_EX),
        
        .wd_sel_o   (wd_sel_MEM),
        .rf_we_o    (rf_we_MEM),
        .dram_we_o  (dram_we_MEM),
        .wR_o       (wR_MEM),
        .wD_o       (wD_MEM_tmp),
        .aluc_o     (aluc_MEM),
        .rd2_o      (rd2_MEM),
        
        .debug_pc_i         (debug_pc_EX),
        .debug_pc_o         (debug_pc_MEM),
        .debug_have_inst_i  (debug_have_inst_EX),
        .debug_have_inst_o  (debug_have_inst_MEM)
    );
// ------------------------- EX ------------------------- //

// ------------------------- MEM ------------------------- //
    assign dram_adr = aluc_MEM;
    assign dram_wdin = rd2_MEM;
    assign dram_we = dram_we_MEM;
    assign dram_rd_MEM = dram_rd;
    MUX2 U_MUX2(
        .wd_sel     (wd_sel_MEM),
        .dram_rd    (dram_rd_MEM),
        .wD         (wD_MEM_tmp),
        .wD_o       (wD_MEM)
    );
    pr_MEM_WB U_pr_MEM_WB(
        .clk        (clk),
        .rst_n      (rst_n),
        
        .rf_we_i    (rf_we_MEM),
        .wR_i       (wR_MEM),
        .wD_i       (wD_MEM),
        
        .rf_we_o    (rf_we_WB),
        .wR_o       (wR_WB),
        .wD_o       (wD_WB),
        
        .debug_pc_i         (debug_pc_MEM),
        .debug_pc_o         (debug_pc_WB),
        .debug_have_inst_i  (debug_have_inst_MEM),
        .debug_have_inst_o  (debug_have_inst_WB)
    );
// ------------------------- MEM ------------------------- //

endmodule
