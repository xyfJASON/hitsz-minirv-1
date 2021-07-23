`timescale 1ns/1ps

module top_sim();

    reg clk;
    reg rst;
    wire        debug_wb_have_inst;
    wire [31:0] debug_wb_pc;
    wire        debug_wb_ena;
    wire [4:0]  debug_wb_reg;
    wire [31:0] debug_wb_value;

    top U_top(
        .clk_i  (clk),
        .rst    (rst)
        
//        .debug_wb_have_inst (debug_wb_have_inst),
//        .debug_wb_pc        (debug_wb_pc),
//        .debug_wb_ena       (debug_wb_ena),
//        .debug_wb_reg       (debug_wb_reg),
//        .debug_wb_value     (debug_wb_value)
    );

    always #1 clk = ~clk;

    initial begin
        #0      clk = 0;
                rst = 1;
        #500    rst = 0;
    end

endmodule

