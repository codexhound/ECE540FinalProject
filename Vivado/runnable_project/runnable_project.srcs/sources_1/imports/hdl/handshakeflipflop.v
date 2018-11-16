`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2018 11:15:54 PM
// Design Name: 
// Module Name: handshakeflipflop
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


module handshakeflipflop(
    input clk50,
    input IO_INT_ACK,
    input IO_BotUpdt,
    output reg IO_BotUpdt_Sync);

    always @ (posedge clk50) begin
        if (IO_INT_ACK == 1'b1) begin
            IO_BotUpdt_Sync <= 1'b0;
        end
        else if (IO_BotUpdt == 1'b1) begin
            IO_BotUpdt_Sync <= 1'b1;
        end else begin
            IO_BotUpdt_Sync <= IO_BotUpdt_Sync;
        end
    end // always
endmodule
