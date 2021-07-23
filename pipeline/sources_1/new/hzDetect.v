
module hzDetect(
    input clk,
    input rst_n,
    
    input [1:0] wd_sel,
    input re1_ID,
    input re2_ID,
    input we_EX,
    input we_MEM,
    input we_WB,
    input [4:0] rR1_ID,
    input [4:0] rR2_ID,
    input [4:0] wR_EX,
    input [4:0] wR_MEM,
    input [4:0] wR_WB,
    input [31:0] wD_EX,
    input [31:0] wD_MEM,
    input [31:0] wD_WB,
    input npc_op,
    
    output reg stall_PC,
    output reg stall_IF_ID,
    output reg stall_ID_EX,
    output reg stall_EX_MEM,
    output reg stall_MEM_WB,
    output reg flush_IF_ID,
    output reg flush_ID_EX,
    output reg flush_EX_MEM,
    output reg flush_MEM_WB,
    output reg [31:0] rd1_f,
    output reg [31:0] rd2_f,
    output rd1_op,
    output rd2_op
    );
    
    wire data_hz1_rd1 = (wR_EX == rR1_ID) & we_EX & re1_ID & (wR_EX != 5'b0);
    wire data_hz1_rd2 = (wR_EX == rR2_ID) & we_EX & re2_ID & (wR_EX != 5'b0);
    wire data_hz2_rd1 = (wR_MEM == rR1_ID) & we_MEM & re1_ID & (wR_MEM != 5'b0);
    wire data_hz2_rd2 = (wR_MEM == rR2_ID) & we_MEM & re2_ID & (wR_MEM != 5'b0);
    wire data_hz3_rd1 = (wR_WB == rR1_ID) & we_WB & re1_ID & (wR_WB != 5'b0);
    wire data_hz3_rd2 = (wR_WB == rR2_ID) & we_WB & re2_ID & (wR_WB != 5'b0);
    assign rd1_op = data_hz1_rd1 | data_hz2_rd1 | data_hz3_rd1;
    assign rd2_op = data_hz1_rd2 | data_hz2_rd2 | data_hz3_rd2;
    always @ (*) begin
        if(data_hz1_rd1)        rd1_f = wD_EX;
        else if(data_hz2_rd1)   rd1_f = wD_MEM;
        else if(data_hz3_rd1)   rd1_f = wD_WB;
        else                    rd1_f = 32'b0;
    end
    always @ (*) begin
        if(data_hz1_rd2)        rd2_f = wD_EX;
        else if(data_hz2_rd2)   rd2_f = wD_MEM;
        else if(data_hz3_rd2)   rd2_f = wD_WB;
        else                    rd2_f = 32'b0;
    end
    
    wire load_use_hz = (data_hz1_rd1 | data_hz1_rd2) & (wd_sel == 2'b01);
    wire control_hz = npc_op;
    always @ (*) begin
        if(load_use_hz) stall_PC = 1'b1;
        else            stall_PC = 1'b0;
    end
    always @ (*) begin
        if(load_use_hz) stall_IF_ID = 1'b1;
        else            stall_IF_ID = 1'b0;
    end
    always @ (*) begin
        if(control_hz)  flush_IF_ID = 1'b1;
        else            flush_IF_ID = 1'b0;
    end
    always @ (*) begin
        if(load_use_hz)     flush_ID_EX = 1'b1;
        else if(control_hz) flush_ID_EX = 1'b1;
        else                flush_ID_EX = 1'b0;
    end

endmodule
