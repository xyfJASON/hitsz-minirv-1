
module pr_ID_EX(
    input clk,
    input rst_n,
    input flush,
    
    input [1:0] wd_sel_i,
    input [3:0] alu_op_i,
    input alub_sel_i,
    input rf_we_i,
    input dram_we_i,
    input [2:0] branch_i,
    input [1:0] jump_i,
    input [31:0] pcimm_i,
    input [31:0] rd1_i,
    input [31:0] rd2_i,
    input [31:0] imm_i,
    input [31:0] wD_i,
    input [4:0] wR_i,
    
    input [31:0] rd1_f, // forwarding
    input [31:0] rd2_f, // forwarding
    input rd1_op,
    input rd2_op,
    
    output reg [1:0] wd_sel_o,
    output reg [3:0] alu_op_o,
    output reg alub_sel_o,
    output reg rf_we_o,
    output reg dram_we_o,
    output reg [2:0] branch_o,
    output reg [1:0] jump_o,
    output reg [31:0] pcimm_o,
    output reg [31:0] rd1_o,
    output reg [31:0] rd2_o,
    output reg [31:0] imm_o,
    output reg [31:0] wD_o,
    output reg [4:0] wR_o
    );
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wd_sel_o <= 2'b0;
        else if(flush)  wd_sel_o <= 2'b0;
        else            wd_sel_o <= wd_sel_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      alu_op_o <= 4'b0;
        else if(flush)  alu_op_o <= 4'b0;
        else            alu_op_o <= alu_op_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      alub_sel_o <= 1'b0;
        else if(flush)  alub_sel_o <= 1'b0;
        else            alub_sel_o <= alub_sel_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rf_we_o <= 1'b0;
        else if(flush)  rf_we_o <= 1'b0;
        else            rf_we_o <= rf_we_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      dram_we_o <= 1'b0;
        else if(flush)  dram_we_o <= 1'b0;
        else            dram_we_o <= dram_we_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      branch_o <= 3'b0;
        else if(flush)  branch_o <= 3'b0;
        else            branch_o <= branch_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      jump_o <= 2'b0;
        else if(flush)  jump_o <= 2'b0;
        else            jump_o <= jump_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      pcimm_o <= 32'b0;
        else            pcimm_o <= pcimm_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rd1_o <= 32'b0;
        else if(rd1_op) rd1_o <= rd1_f;
        else            rd1_o <= rd1_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      rd2_o <= 32'b0;
        else if(rd2_op) rd2_o <= rd2_f;
        else            rd2_o <= rd2_i;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      imm_o <= 32'b0;
        else            imm_o <= imm_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wD_o <= 32'b0;
        else            wD_o <= wD_i;
    end

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)      wR_o <= 5'b0;
        else            wR_o <= wR_i;
    end

endmodule
