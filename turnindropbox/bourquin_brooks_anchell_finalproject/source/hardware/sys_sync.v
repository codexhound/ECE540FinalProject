`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2018 12:45:04 PM
// Design Name: 
// Module Name: sys_sync
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


module sys_sync(
        input clk_50, roundDD, reset,
        input [11:0] x_acc_reg_temp, y_acc_reg_temp, z_acc_reg_temp,
        output reg [11:0] x_acc_reg, y_acc_reg, z_acc_reg,
        output reg reset1
    );
    
    reg en1, en2, en3;
    reg [5:0] rstHold;
    
    initial begin
        x_acc_reg = 0;
                        y_acc_reg = 0;
                        z_acc_reg = 0;
                        en1 = 0;
                        en2 = 0;
                        en3 = 0;
                        reset1 = 0;
                        rstHold = 0;
        end
    
    always@(posedge clk_50) begin
            if(!reset) begin
                x_acc_reg <= 0;
                y_acc_reg <= 0;
                z_acc_reg <= 0;
                en1 <= 0;
                en2 <= 0;
                en3 <= 0;
                reset1 <= 0;
                rstHold <= 0;
            end
            else begin
                en1 <= roundDD;
                en2 <= en1;
                en3 <= en2;
                
                //hold reset for other clock doman
                if(rstHold == 63) reset1 <= 1;
                else if(!reset1) rstHold = rstHold + 1;
                else reset1 <= reset1;
                
                if(en3) begin //x,y,z are valid for sync while roundDone is held
                   x_acc_reg <=  x_acc_reg_temp;
                   y_acc_reg <=  y_acc_reg_temp;
                   z_acc_reg <=  z_acc_reg_temp;
                end
                else begin
                    x_acc_reg <=  x_acc_reg;
                    y_acc_reg <=  y_acc_reg;
                    z_acc_reg <=  z_acc_reg;
                end
            end
        end
endmodule
