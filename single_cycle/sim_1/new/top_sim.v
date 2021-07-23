`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/06 10:23:04
// Design Name: 
// Module Name: top_sim
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


module top_sim();

    reg clk;
    reg rst_n;
    wire        debug_wb_have_inst;
    wire [31:0] debug_wb_pc;
    wire        debug_wb_ena;
    wire [4:0]  debug_wb_reg;
    wire [31:0] debug_wb_value;

    top U_top(
        .clk    (clk),
        .rst_n  (rst_n),
        .debug_wb_have_inst (debug_wb_have_inst),
        .debug_wb_pc (debug_wb_pc),
        .debug_wb_ena (debug_wb_ena),
        .debug_wb_reg (debug_wb_reg),
        .debug_wb_value (debug_wb_value)
    );

    always #5 clk = ~clk;

    initial begin
        #0 clk = 0;
        #10 rst_n = 0;
        #200 rst_n = 1;
    end

endmodule
