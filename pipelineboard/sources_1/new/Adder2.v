
module Adder2(
    input [31:0] pc,
    input [31:0] imm,
    output [31:0] pcimm
    );
    
    assign pcimm = pc + imm;

endmodule
