
module MUX1(
    input [1:0] wd_sel,
    input [31:0] wD,
    input [31:0] imm,
    input [31:0] aluc,
    output reg [31:0] wD_o
    );
    
    always @ (*) begin
        if(wd_sel == 2'b11)         wD_o = imm;
        else if(wd_sel == 2'b00)    wD_o = aluc;
        else                        wD_o = wD;
    end
    
endmodule
