
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:05:39
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(
    input clk,
    input rst_n,
    input en,
    input [31:0] npc, 
    output reg [31:0] pc
    );

    reg rst_n_p;
    always @(posedge clk) begin
        rst_n_p <= rst_n;
    end

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)          pc <= 32'b0;
        else if(!rst_n_p)   pc <= 32'b0;
        else if(en)         pc <= npc;
        else                pc <= pc;
    end

endmodule
