
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:56:02
// Design Name: 
// Module Name: RF
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


module RF(
    input clk,
    input rst_n,
    input [4:0] rR1,
    input [4:0] rR2,
    input [4:0] wR,
    input [31:0] wD_aluc,
    input [31:0] wD_dramrd,
    input [31:0] wD_npcpc4,
    input [31:0] wD_sextext,
    input rf_we,
    input [1:0] wd_sel,
    output [31:0] rd1,
    output [31:0] rd2,
    output reg [31:0] wD
    );

    reg [31:0] rf[31:0];

    assign rd1 = (rR1 == 5'b0) ? 32'b0 : rf[rR1];
    assign rd2 = (rR2 == 5'b0) ? 32'b0 : rf[rR2];

    always @(*) begin
        case(wd_sel)
            2'b00:   wD = wD_aluc;
            2'b01:   wD = wD_dramrd;
            2'b10:   wD = wD_npcpc4;
            2'b11:   wD = wD_sextext;
            default: wD = 32'b0;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rf[0]  <= 32'b0;
            rf[1]  <= 32'b0;
            rf[2]  <= 32'b0;
            rf[3]  <= 32'b0;
            rf[4]  <= 32'b0;
            rf[5]  <= 32'b0;
            rf[6]  <= 32'b0;
            rf[7]  <= 32'b0;
            rf[8]  <= 32'b0;
            rf[9]  <= 32'b0;
            rf[10] <= 32'b0;
            rf[11] <= 32'b0;
            rf[12] <= 32'b0;
            rf[13] <= 32'b0;
            rf[14] <= 32'b0;
            rf[15] <= 32'b0;
            rf[16] <= 32'b0;
            rf[17] <= 32'b0;
            rf[18] <= 32'b0;
            rf[19] <= 32'b0;
            rf[20] <= 32'b0;
            rf[21] <= 32'b0;
            rf[22] <= 32'b0;
            rf[23] <= 32'b0;
            rf[24] <= 32'b0;
            rf[25] <= 32'b0;
            rf[26] <= 32'b0;
            rf[27] <= 32'b0;
            rf[28] <= 32'b0;
            rf[29] <= 32'b0;
            rf[30] <= 32'b0;
            rf[31] <= 32'b0;
        end
        else if (rf_we) rf[wR] <= wD;
        else            rf[0] <= 32'b0;
    end

endmodule
