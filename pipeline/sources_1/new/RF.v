
module RF(
    input clk,
    input rst_n,
    input [4:0] rR1,
    input [4:0] rR2,
    input [4:0] wR,
    input [31:0] wD,
    input we,
    output [31:0] rd1,
    output [31:0] rd2
    );

    reg [31:0] rf[31:0];

    assign rd1 = (rR1 == 5'b0) ? 32'b0 : rf[rR1];
    assign rd2 = (rR2 == 5'b0) ? 32'b0 : rf[rR2];

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
        else if (we)    rf[wR] <= wD;
        else            rf[0] <= 32'b0;
    end

endmodule
