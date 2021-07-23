
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/07 09:03:00
// Design Name: 
// Module Name: board
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


module board(
    input  clk_i,
    input  rst,
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
    output led_dp ,
    
    input  [23:0] device_sw,
    output [23:0] device_led
    );
    
    wire rst_n = !rst;
    wire busy = 1'b0;
    wire clk_display;
    wire [31:0] display_pc;
    
    miniCPU U_CPU(
        .clk_i  (clk_i),
        .rst_n  (rst_n),
        
        .pc         (display_pc),
        .device_sw  (device_sw),
        .device_led (device_led)
    );
    
    divider U_divider(
        .clk_i  (clk_i),
        .rst_n  (rst_n),
        .clk_o  (clk_display)
    );
    
    display U_display(
        .clk        (clk_display),
        .rst_n      (rst_n),
        .busy       (busy),
        .z1         (display_pc[31:24]),
        .r1         (display_pc[23:16]),
        .z2         (display_pc[15:8]),
        .r2         (display_pc[7:0]),
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
