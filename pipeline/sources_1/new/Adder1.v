
module Adder1(
    input [31:0] pc,
    output [31:0] pc4
    );
    
    assign pc4 = pc + 32'd4;
    
endmodule
