
module pr_EX_MEM(
    input clk,
    input rst_n,
    
    input [1:0] wd_sel_i,
    input rf_we_i,
    input dram_we_i,
    input [4:0] wR_i,
    input [31:0] wD_i,
    input [31:0] aluc_i,
    input [31:0] rd2_i,
    
    output reg [1:0] wd_sel_o,
    output reg rf_we_o,
    output reg dram_we_o,
    output reg [4:0] wR_o,
    output reg [31:0] wD_o,
    output reg [31:0] aluc_o,
    output reg [31:0] rd2_o
    );
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wd_sel_o <= 2'b0;
        else            wd_sel_o <= wd_sel_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rf_we_o <= 1'b0;
        else            rf_we_o <= rf_we_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      dram_we_o <= 1'b0;
        else            dram_we_o <= dram_we_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wR_o <= 5'b0;
        else            wR_o <= wR_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wD_o <= 32'b0;
        else            wD_o <= wD_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      aluc_o <= 32'b0;
        else            aluc_o <= aluc_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rd2_o <= 32'b0;
        else            rd2_o <= rd2_i;
    end

endmodule
