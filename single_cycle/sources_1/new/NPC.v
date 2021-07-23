
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:16:08
// Design Name: 
// Module Name: NPC
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


module NPC(
    input [31:0] pc,
    input [31:0] imm,
    input [31:0] aluc,
    input [1:0] npc_op,
    output reg [31:0] npc,
    output [31:0] pc4
    );

    always @(*) begin
        case (npc_op)
            2'b00:   npc = pc + 32'd4;          // pc+4
            2'b01:   npc = pc + imm;            // branch
            2'b10:   npc = pc + imm;            // jal
            2'b11:   npc = {aluc[31:1], 1'b0};  // jalr
            default: npc = 32'b0;
        endcase
    end

    assign pc4 = pc + 32'd4;

endmodule
