
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 15:24:46
// Design Name: 
// Module Name: Control
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


module Control(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    input zero,
    input sgn, 
    output reg [1:0] npc_op,
    output wire rf_we,
    output reg [1:0] wd_sel,
    output reg [2:0] sext_op,
    output reg [3:0] alu_op,
    output alub_sel,
    output branch,
    output dram_we,
    
    output wire pc_en
    );

    assign pc_en = {funct7, funct3, opcode} != 17'b0;

    always @(*) begin
        case(opcode)
            7'b0110011: npc_op = 2'b00; // R
            7'b0010011: npc_op = 2'b00; // I
            7'b0000011: npc_op = 2'b00; // lw
            7'b0110111: npc_op = 2'b00; // lui
            7'b0100011: npc_op = 2'b00; // sw
            7'b1100111: npc_op = 2'b11; // jalr
            7'b1100011: begin // B
                case(funct3)
                    3'b000:  npc_op = zero ? 2'b01 : 2'b00; // beq
                    3'b001:  npc_op = zero ? 2'b00 : 2'b01; // bne
                    3'b100:  npc_op = sgn  ? 2'b01 : 2'b00; // blt
                    3'b101:  npc_op = sgn  ? 2'b00 : 2'b01; // bge
                    default: npc_op = 2'b00;
                endcase
            end
            7'b1101111: npc_op = 2'b10; // jal
            default:    npc_op = 2'b00;
        endcase
    end
    
    assign rf_we = (opcode == 7'b0100011 || opcode == 7'b1100011) ? 1'b0 : 1'b1;
    
    always @(*) begin
        case(opcode)
            7'b0110011: wd_sel = 2'b00; // R
            7'b0010011: wd_sel = 2'b00; // I
            7'b0000011: wd_sel = 2'b01; // lw
            7'b0110111: wd_sel = 2'b11; // lui
            7'b1100111: wd_sel = 2'b10; // jalr
            7'b1101111: wd_sel = 2'b10; // jal
            default:    wd_sel = 2'b00;
        endcase
    end

    always @(*) begin
        case(opcode)
            7'b0010011: begin // I
                if(funct3 == 3'b000 || funct3 == 3'b111 || funct3 == 3'b110 || funct3 == 3'b100)
                    sext_op = 3'b000;
                else if(funct3 == 3'b001 || funct3 == 3'b101)
                    sext_op = 3'b001;
                else sext_op = 3'b000;
            end
            7'b0000011: sext_op = 3'b000; // lw
            7'b0110111: sext_op = 3'b011; // lui
            7'b0100011: sext_op = 3'b010; // sw
            7'b1100111: sext_op = 3'b000; // jalr
            7'b1100011: sext_op = 3'b100; // B
            7'b1101111: sext_op = 3'b101; // jal
            default:    sext_op = 3'b000;
        endcase
    end

    always @(*) begin
        case(opcode)
            7'b0110011: begin // R
                case(funct3)
                    3'b000:  alu_op = funct7[5] ? 4'b0110 : 4'b0010;
                    3'b111:  alu_op = 4'b0000;
                    3'b110:  alu_op = 4'b0001;
                    3'b100:  alu_op = 4'b0101;
                    3'b001:  alu_op = 4'b1000;
                    3'b101:  alu_op = funct7[5] ? 4'b1011 : 4'b1010;
                    default: alu_op = 4'b0000;
                endcase
            end
            7'b0010011: begin // I
                case(funct3)
                    3'b000:  alu_op = 4'b0010;
                    3'b111:  alu_op = 4'b0000;
                    3'b110:  alu_op = 4'b0001;
                    3'b100:  alu_op = 4'b0101;
                    3'b001:  alu_op = 4'b1000;
                    3'b101:  alu_op = funct7[5] ? 4'b1011 : 4'b1010;
                endcase
            end
            7'b0000011: alu_op = 4'b0010; // lw
            7'b0100011: alu_op = 4'b0010; // sw
            7'b1100111: alu_op = 4'b0010; // jalr
            7'b1100011: alu_op = 4'b0110; // B
            default:    alu_op = 4'b0000;
        endcase
    end

    assign alub_sel = (opcode == 7'b0010011 || opcode == 7'b0000011 || opcode == 7'b1100111 || opcode == 7'b0100011) ? 1'b1 : 1'b0;
    assign branch = (opcode == 7'b1100011) ? 1'b1 : 1'b0;
    assign dram_we = (opcode == 7'b0100011) ? 1'b1 : 1'b0;

endmodule
