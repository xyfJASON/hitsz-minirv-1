
module MUX2(
    input [1:0] wd_sel,
    input [31:0] dram_rd,
    input [31:0] wD,
    output reg [31:0] wD_o
    );
    
    always @ (*) begin
        if(wd_sel == 2'b01) wD_o = dram_rd;
        else                wD_o = wD;
    end
    
endmodule
