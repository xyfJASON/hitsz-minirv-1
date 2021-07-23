
module pr_IF_ID(
    input clk,
    input rst_n,
    input stall,
    input flush,
    
    input [31:0] pc_i,
    input [31:0] pc4_i,
    input [31:0] inst_i,
    input [4:0] wR_i,
    
    output reg [31:0] pc_o,
    output reg [31:0] pc4_o,
    output reg [31:0] inst_o,
    output reg [4:0] wR_o
    );
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      pc_o <= 32'b0;
        else if(flush)  pc_o <= 32'b0;
        else if(stall)  pc_o <= pc_o;
        else            pc_o <= pc_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      pc4_o <= 32'b0;
        else if(flush)  pc4_o <= 32'b0;
        else if(stall)  pc4_o <= pc4_o;
        else            pc4_o <= pc4_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      inst_o <= 32'b0;
        else if(flush)  inst_o <= 32'b0;
        else if(stall)  inst_o <= inst_o;
        else            inst_o <= inst_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wR_o <= 5'b0;
        else if(flush)  wR_o <= 5'b0;
        else if(stall)  wR_o <= wR_o;
        else            wR_o <= wR_i;
    end

endmodule
