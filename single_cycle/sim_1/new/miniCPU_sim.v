`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 17:41:37
// Design Name: 
// Module Name: miniCPU_sim
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


module miniCPU_sim();

    reg clk;
    reg rst_n;

    miniCPU U_miniCPU(
        .clk_i  (clk),
        .rst_n  (rst_n)
    );

    always #1 clk = ~clk;

    initial begin
        #0 clk = 0;
           rst_n = 0;
        #500 rst_n = 1;
    end

endmodule
