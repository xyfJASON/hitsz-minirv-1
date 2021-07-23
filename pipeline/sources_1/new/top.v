
module top(
    input   clk_i,
    input   rst,
    
//    output        debug_wb_have_inst,
//    output [31:0] debug_wb_pc,
//    output        debug_wb_ena,
//    output [4:0]  debug_wb_reg,
//    output [31:0] debug_wb_value,
    
    input  [23:0] device_sw,
    output [23:0] device_led
    );
    
    wire rst_n = ~rst;
    wire        debug_wb_have_inst;
    wire [31:0] debug_wb_pc;
    wire        debug_wb_ena;
    wire [4:0]  debug_wb_reg;
    wire [31:0] debug_wb_value;
    
    wire clk;
    cpuclk UCLK(
        .clk_in1    (clk_i),
        .clk_out1   (clk)
    );
    
    wire [31:0] inst, pc;
    wire [31:0] rd, adr, wdin;
    wire we;
    
    miniCPU miniCPU_U(
        .clk            (clk),
        .rst_n          (rst_n),
        
        .irom_inst      (inst),     // input
        .irom_pc        (pc),       // output
        
        .dram_rd        (rd),       // input
        .dram_adr       (adr),      // output
        .dram_wdin      (wdin),     // output
        .dram_we        (we),       // output
        
        .debug_wb_have_inst (debug_wb_have_inst),
        .debug_wb_pc        (debug_wb_pc),
        .debug_wb_ena       (debug_wb_ena),
        .debug_wb_reg       (debug_wb_reg),
        .debug_wb_value     (debug_wb_value)
    );
    
    assign ram_clk = !clk;
    
    IROM U_IROM(
        .pc         (pc),
        .inst       (inst)
    );

    DRAM U_DRAM(
        .clk        (ram_clk),
        .adr        (adr),
        .wdin       (wdin),
        .we         (we),
        .rd         (rd),
        
        .device_sw  (device_sw),
        .device_led (device_led)
    );
    
//    inst_mem imem(
//        .a          (pc[15:2]),
//        .spo        (inst)
//    );

//    data_mem dmem(
//        .clk    (ram_clk),
//        .a      (adr[15:2]),
//        .spo    (rd),
//        .we     (we),
//        .d      (wdin)
//    );

endmodule
