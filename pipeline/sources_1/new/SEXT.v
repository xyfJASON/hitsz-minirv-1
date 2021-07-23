
module SEXT(
    input [24:0] din,
    input [2:0] sext_op,
    output reg [31:0] ext
    );

    wire sgn = din[24];
    always @(*) begin
        case (sext_op)
            3'b000:  ext = {sgn == 1'b1 ? 20'hFFFFF : 20'b0, din[24:13]};
            3'b001:  ext = {27'b0, din[17:13]};
            3'b010:  ext = {sgn == 1'b1 ? 20'hFFFFF : 20'b0, din[24:18], din[4:0]};
            3'b011:  ext = {din[24:5], 12'b0};
            3'b100:  ext = {sgn == 1'b1 ? 19'h7FFFF : 19'b0, din[24], din[0], din[23:18], din[4:1], 1'b0};
            3'b101:  ext = {sgn == 1'b1 ? 11'h7FF : 11'b0, din[24], din[12:5], din[13], din[23:14], 1'b0};
            default: ext = 32'b0;
        endcase
    end

endmodule
