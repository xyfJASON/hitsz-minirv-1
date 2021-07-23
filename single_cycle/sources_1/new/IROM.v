
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:44:06
// Design Name: 
// Module Name: IROM
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


module IROM(
    input [31:0] pc,
    output [31:0] inst
    );
    
    // 64KB IROM
    prgrom UIROM(
        .a      (pc[15:2]),
        .spo    (inst)
    );

endmodule
