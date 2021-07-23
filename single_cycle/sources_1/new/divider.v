
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/07 09:57:26
// Design Name: 
// Module Name: divider
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

module divider(
    input  wire clk_i,
    input  wire rst_n,
    output reg  clk_o
    );

    reg [16:0] cnt;
    
    always @ (posedge clk_i or negedge rst_n) begin
        if(rst_n == 1'b0)   cnt <= 17'h0;
        else if(cnt < 9999) cnt <= cnt + 17'h1;
        else                cnt <= 17'h0;
    end
    
    always @ (posedge clk_i or negedge rst_n) begin
        if(rst_n == 1'b0)       clk_o <= 1'b0;
        else if(cnt == 9999)    clk_o <= ~clk_o;
        else                    clk_o <= clk_o;
    end

endmodule

