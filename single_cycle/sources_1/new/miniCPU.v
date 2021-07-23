
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 16:56:51
// Design Name: 
// Module Name: miniCPU
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


module miniCPU(
    input clk_i,
    input rst_n,
    
    output [31:0] pc, // for led display
    input  [23:0] device_sw,
    output [23:0] device_led
    );

    wire clk;

    wire [1:0] npc_op, wd_sel;
    wire rf_we, alub_sel, branch, dram_we;
    wire [2:0] sext_op;
    wire [3:0] alu_op;
    wire zero, sgn;
    wire pc_en;

    wire [31:0] npc, pc4;
    wire [31:0] inst, imm;
    wire [31:0] rd1, rd2, aluc;
    wire [31:0] dramrd;

    cpuclk UCLK(
        .clk_in1    (clk_i),
        .clk_out1   (clk)
    );

    PC U_PC(
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (pc_en),
        .npc        (npc),
        .pc         (pc)
    );

    IROM U_IROM(
        .pc         (pc),
        .inst       (inst)
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
        .rd2        (rd2)
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

    DRAM U_DRAM(
        .clk        (clk),
        .adr        (aluc),
        .wdin       (rd2),
        .dram_we    (dram_we),
        .rd         (dramrd),
        
        .device_sw  (device_sw),
        .device_led (device_led)
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
