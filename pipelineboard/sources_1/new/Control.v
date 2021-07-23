
module Control(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [1:0] wd_sel,
    output reg [3:0] alu_op,
    output alub_sel,
    output rf_we,
    output dram_we,
    output reg [2:0] sext_op,
    output [2:0] branch,
    output [1:0] jump,
    output re1, // whether rd1 will be used
    output re2  // whether rd2 will be used
    );
    
    wire R    = (opcode == 7'b0110011) ? 1'b1 : 1'b0;
    wire I    = (opcode == 7'b0010011) ? 1'b1 : 1'b0;
    wire lw   = (opcode == 7'b0000011) ? 1'b1 : 1'b0;
    wire lui  = (opcode == 7'b0110111) ? 1'b1 : 1'b0;
    wire sw   = (opcode == 7'b0100011) ? 1'b1 : 1'b0;
    wire jalr = (opcode == 7'b1100111) ? 1'b1 : 1'b0;
    wire jal  = (opcode == 7'b1101111) ? 1'b1 : 1'b0;
    wire B    = (opcode == 7'b1100011) ? 1'b1 : 1'b0;
    assign is_inst = R | I | lw | lui | sw | jalr | jal | B;
    
    always @ (*) begin
        if(R)           wd_sel = 2'b00;
        else if(I)      wd_sel = 2'b00;
        else if(lw)     wd_sel = 2'b01;
        else if(lui)    wd_sel = 2'b11;
        else if(jalr)   wd_sel = 2'b10;
        else if(jal)    wd_sel = 2'b10;
        else            wd_sel = 2'b00;
    end

    always @ (*) begin
        if(R) begin
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
        else if(I) begin
            case(funct3)
                3'b000:  alu_op = 4'b0010;
                3'b111:  alu_op = 4'b0000;
                3'b110:  alu_op = 4'b0001;
                3'b100:  alu_op = 4'b0101;
                3'b001:  alu_op = 4'b1000;
                3'b101:  alu_op = funct7[5] ? 4'b1011 : 4'b1010;
            endcase
        end
        else if(lw)     alu_op = 4'b0010;
        else if(sw)     alu_op = 4'b0010;
        else if(jalr)   alu_op = 4'b0010;
        else if(B)      alu_op = 4'b0110;
        else            alu_op = 4'b0000;
    end
    
    assign alub_sel = (I | lw | sw | jalr);
    assign rf_we = is_inst & ~(sw | B);
    assign dram_we = sw;

    always @ (*) begin
        if(I) begin
            if(funct3 == 3'b000 || funct3 == 3'b111 || funct3 == 3'b110 || funct3 == 3'b100)
                sext_op = 3'b000;
            else if(funct3 == 3'b001 || funct3 == 3'b101)
                sext_op = 3'b001;
            else sext_op = 3'b000;
        end
        else if(lw)     sext_op = 3'b000;
        else if(lui)    sext_op = 3'b011;
        else if(sw)     sext_op = 3'b010;
        else if(jalr)   sext_op = 3'b000;
        else if(B)      sext_op = 3'b100;
        else if(jal)    sext_op = 3'b101;
        else            sext_op = 3'b000;
    end
    
    assign branch = {funct3[2], funct3[0], B}; // 00:beq; 01:bne; 10:blt; 11:bge
    assign jump = {opcode[3], jalr | jal};     // 0:jalr; 1:jal
    
    assign re1 = is_inst & ~(lui | jal);
    assign re2 = (R | sw | B);

endmodule
