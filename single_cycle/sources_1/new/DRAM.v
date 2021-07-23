
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 23:28:30
// Design Name: 
// Module Name: DRAM
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


module DRAM(
    input clk,
    input [31:0] adr,
    input [31:0] wdin,
    input dram_we,
    output reg [31:0] rd,
    
    input      [23:0] device_sw,
    output reg [23:0] device_led
    );

    assign ram_clk = !clk;
    
    reg we; // write enable given to dram ip core
    always @(*) begin
        if(adr == 32'hFFFFF060)         we = 1'b0;
        else if(adr == 32'hFFFFF062)    we = 1'b0;
        else                            we = dram_we;
    end
    always @(*) begin
        if(adr == 32'hFFFFF060 && dram_we)      device_led = {device_led[23:16], wdin[15:0]};
        else if(adr == 32'hFFFFF062 && dram_we) device_led = {wdin[7:0], device_led[15:0]};
        else                                    device_led = device_led;
    end
    
    wire [31:0] tmp_rd; // data read from dram ip core
    always @(*) begin
        if(adr == 32'hFFFFF070)         rd = {16'b0, device_sw[15:0]};
        else if(adr == 32'hFFFFF072)    rd = {24'b0, device_sw[23:16]};
        else                            rd = tmp_rd;
    end
    
    dram U_dram (
        .clk    (ram_clk),
        .a      (adr[15:2]),
        .spo    (tmp_rd),
        .we     (we),
        .d      (wdin)
    );
    
endmodule
