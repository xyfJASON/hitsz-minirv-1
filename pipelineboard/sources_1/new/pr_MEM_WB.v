
module pr_MEM_WB(
    input clk,
    input rst_n,
    
    input rf_we_i,
    input [4:0] wR_i,
    input [31:0] wD_i,
    
    output reg rf_we_o,
    output reg [4:0] wR_o,
    output reg [31:0] wD_o
    );
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rf_we_o <= 1'b0;
        else            rf_we_o <= rf_we_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wR_o <= 5'b0;
        else            wR_o <= wR_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wD_o <= 32'b0;
        else            wD_o <= wD_i;
    end

endmodule
