
module NPC(
    input [31:0] pc4,
    input [31:0] npc_bj, // pc+imm(branch/jal) or aluc&-1(jalr)
    input npc_op,
    output [31:0] npc
    );

    assign npc = (npc_op == 1'b0) ? pc4 : npc_bj;

endmodule
