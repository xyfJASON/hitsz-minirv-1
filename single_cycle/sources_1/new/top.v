
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/06 09:19:29
// Design Name: 
// Module Name: top
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


module top(
    input         clk,
    input         rst_n,
    output        debug_wb_have_inst,
    output [31:0] debug_wb_pc,
    output        debug_wb_ena,
    output [4:0]  debug_wb_reg,
    output [31:0] debug_wb_value
    );
    
    wire [31:0] pc, inst;
    wire [31:0] dramrd, aluc, rd2;
    wire dram_we;
    
    testCPU testCPU_U(
        .clk            (clk),
        .rst_n          (rst_n),
        .inst           (inst),
        .dramrd         (dramrd),
        .pc             (pc),
        .aluc           (aluc),
        .rd2            (rd2),
        .dram_we        (dram_we),
        .debug_wb_pc    (debug_wb_pc),  
        .debug_wb_ena   (debug_wb_ena), 
        .debug_wb_reg   (debug_wb_reg), 
        .debug_wb_value (debug_wb_value)
    );
    
    assign ram_clk = !clk;
    
    inst_mem imem(
        .a          (pc[15:2]),
        .spo        (inst)
    );

    data_mem dmem(
        .clk    (ram_clk),
        .a      (aluc[15:2]),
        .spo    (dramrd),
        .we     (dram_we),
        .d      (rd2)
    );

//    IROM U_IROM(
//        .pc         (pc),
//        .inst       (inst)
//    );

//    DRAM U_DRAM(
//        .clk        (ram_clk),
//        .adr        (aluc),
//        .wdin       (rd2),
//        .dram_we    (dram_we),
//        .rd         (dramrd)
//    );
    
    assign debug_wb_have_inst = 1;

endmodule
