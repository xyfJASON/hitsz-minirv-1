
module top(
    input   clk_i,
    input   rst,
    
    output led0_en,
    output led1_en,
    output led2_en,
    output led3_en,
    output led4_en,
    output led5_en,
    output led6_en,
    output led7_en,
    output led_ca ,
    output led_cb ,
    output led_cc ,
    output led_cd ,
    output led_ce ,
    output led_cf ,
    output led_cg ,
    output led_dp
    );
    
    wire rst_n = ~rst;
    
    wire clk;
    cpuclk UCLK(
        .clk_in1    (clk_i),
        .clk_out1   (clk)
    );
    
    wire [31:0] inst, pc;
    wire [31:0] rd, adr, wdin;
    wire we;
    wire [31:0] display_x19;
    
    miniCPU miniCPU_U(
        .clk            (clk),
        .rst_n          (rst_n),
        
        .irom_inst      (inst),     // input
        .irom_pc        (pc),       // output
        
        .dram_rd        (rd),       // input
        .dram_adr       (adr),      // output
        .dram_wdin      (wdin),     // output
        .dram_we        (we),       // output
        
        .display_x19    (display_x19)
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
        .rd         (rd)
    );
    
    wire clk_d;
    divider U_divider(
        .clk_i  (clk_i),
        .rst_n  (rst_n),
        .clk_o  (clk_d)
    );
    display U_display(
        .clk        (clk_d),
        .rst_n      (rst_n),
        .busy       (1'b0),
        .z1         (display_x19[31:24]),
        .r1         (display_x19[23:16]),
        .z2         (display_x19[15:8]),
        .r2         (display_x19[7:0]),
        .led0_en    (led0_en),
        .led1_en    (led1_en),
        .led2_en    (led2_en),
        .led3_en    (led3_en),
        .led4_en    (led4_en),
        .led5_en    (led5_en),
        .led6_en    (led6_en),
        .led7_en    (led7_en),
        .led_ca     (led_ca),
        .led_cb     (led_cb),
        .led_cc     (led_cc),
        .led_cd     (led_cd),
        .led_ce     (led_ce),
        .led_cf     (led_cf),
        .led_cg     (led_cg),
        .led_dp     (led_dp)
    );

endmodule
