
module IROM(
    input [31:0] pc,
    output [31:0] inst
    );
    
    // 64KB IROM
    prgrom U_prgrom(
        .a      (pc[15:2]),
        .spo    (inst)
    );

endmodule
