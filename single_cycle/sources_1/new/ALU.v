
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 23:43:52
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] rfrd1,
    input [31:0] rfrd2,
    input [31:0] sextext,
    output reg [31:0] C,
    output zero,
    output sgn,
    input [3:0] alu_op,
    input alub_sel,
    input branch
    );

    wire [31:0] A = rfrd1;
    wire [31:0] B = (alub_sel == 1'b0) ? rfrd2 : sextext;
    wire [4:0] shamt = B[4:0];

    always @(*) begin
        case(alu_op)
            4'b0000: C = A & B;
            4'b0001: C = A | B;
            4'b0010: C = A + B;
            4'b0110: C = A + ((~B) + 1);
            4'b0101: C = A ^ B;
            4'b1000: begin 
                case(shamt)
                    5'd00: C = A;
                    5'd01: C = A << 01;
                    5'd02: C = A << 02;
                    5'd03: C = A << 03;
                    5'd04: C = A << 04;
                    5'd05: C = A << 05;
                    5'd06: C = A << 06;
                    5'd07: C = A << 07;
                    5'd08: C = A << 08;
                    5'd09: C = A << 09;
                    5'd10: C = A << 10;
                    5'd11: C = A << 11;
                    5'd12: C = A << 12;
                    5'd13: C = A << 13;
                    5'd14: C = A << 14;
                    5'd15: C = A << 15;
                    5'd16: C = A << 16;
                    5'd17: C = A << 17;
                    5'd18: C = A << 18;
                    5'd19: C = A << 19;
                    5'd20: C = A << 20;
                    5'd21: C = A << 21;
                    5'd22: C = A << 22;
                    5'd23: C = A << 23;
                    5'd24: C = A << 24;
                    5'd25: C = A << 25;
                    5'd26: C = A << 26;
                    5'd27: C = A << 27;
                    5'd28: C = A << 28;
                    5'd29: C = A << 29;
                    5'd30: C = A << 30;
                    5'd31: C = A << 31;
                    default: C = A;
                endcase
            end
            4'b1010: begin
                case(shamt)
                    5'd00: C = A;
                    5'd01: C = A >> 01;
                    5'd02: C = A >> 02;
                    5'd03: C = A >> 03;
                    5'd04: C = A >> 04;
                    5'd05: C = A >> 05;
                    5'd06: C = A >> 06;
                    5'd07: C = A >> 07;
                    5'd08: C = A >> 08;
                    5'd09: C = A >> 09;
                    5'd10: C = A >> 10;
                    5'd11: C = A >> 11;
                    5'd12: C = A >> 12;
                    5'd13: C = A >> 13;
                    5'd14: C = A >> 14;
                    5'd15: C = A >> 15;
                    5'd16: C = A >> 16;
                    5'd17: C = A >> 17;
                    5'd18: C = A >> 18;
                    5'd19: C = A >> 19;
                    5'd20: C = A >> 20;
                    5'd21: C = A >> 21;
                    5'd22: C = A >> 22;
                    5'd23: C = A >> 23;
                    5'd24: C = A >> 24;
                    5'd25: C = A >> 25;
                    5'd26: C = A >> 26;
                    5'd27: C = A >> 27;
                    5'd28: C = A >> 28;
                    5'd29: C = A >> 29;
                    5'd30: C = A >> 30;
                    5'd31: C = A >> 31;
                    default: C = A;
                endcase
            end
            4'b1011: begin
                case(shamt)
                    5'd00: C = A;
                    5'd01: C = $signed(A) >>> 01;
                    5'd02: C = $signed(A) >>> 02;
                    5'd03: C = $signed(A) >>> 03;
                    5'd04: C = $signed(A) >>> 04;
                    5'd05: C = $signed(A) >>> 05;
                    5'd06: C = $signed(A) >>> 06;
                    5'd07: C = $signed(A) >>> 07;
                    5'd08: C = $signed(A) >>> 08;
                    5'd09: C = $signed(A) >>> 09;
                    5'd10: C = $signed(A) >>> 10;
                    5'd11: C = $signed(A) >>> 11;
                    5'd12: C = $signed(A) >>> 12;
                    5'd13: C = $signed(A) >>> 13;
                    5'd14: C = $signed(A) >>> 14;
                    5'd15: C = $signed(A) >>> 15;
                    5'd16: C = $signed(A) >>> 16;
                    5'd17: C = $signed(A) >>> 17;
                    5'd18: C = $signed(A) >>> 18;
                    5'd19: C = $signed(A) >>> 19;
                    5'd20: C = $signed(A) >>> 20;
                    5'd21: C = $signed(A) >>> 21;
                    5'd22: C = $signed(A) >>> 22;
                    5'd23: C = $signed(A) >>> 23;
                    5'd24: C = $signed(A) >>> 24;
                    5'd25: C = $signed(A) >>> 25;
                    5'd26: C = $signed(A) >>> 26;
                    5'd27: C = $signed(A) >>> 27;
                    5'd28: C = $signed(A) >>> 28;
                    5'd29: C = $signed(A) >>> 29;
                    5'd30: C = $signed(A) >>> 30;
                    5'd31: C = $signed(A) >>> 31;
                    default: C = A;
                endcase
            end
        endcase
    end

    assign zero = (C == 32'b0) ? 1'b1 : 1'b0;
    assign sgn = C[31];

endmodule
