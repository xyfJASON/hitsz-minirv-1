
module PC(
    input clk,
    input rst_n,
    input [31:0] npc,
    input stall,
    output reg [31:0] pc
    );

//    reg rst_n_p;
//    always @(posedge clk) begin
//        rst_n_p <= rst_n;
//    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)          pc <= 32'b0;
        else if(stall)      pc <= pc;
//        else if(!rst_n_p)   pc <= 32'b0;
        else                pc <= npc;
    end

endmodule
