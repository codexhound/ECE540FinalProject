`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2018 01:49:29 PM
// Design Name: 
// Module Name: Maze_Icon
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

module Maze_Icon(
    input clk,
    input [3:0] motor_control,
    output reg [7:0] LocX_reg,
    output reg [7:0] LocY_reg
    );
    
reg [27:0] count_limit;
reg [28:0] counter;
reg count_reached;
reg first_run;

reg [3:0] old_motor_control;
    
initial begin
    //count_limit = 4'b1000;
	count_limit = 20'b1111_1111_1111_1111_1111;
    first_run = 1;
    counter = 0;
    count_reached = 0;
    LocX_reg = 8'b0010_0000; // 32
    LocY_reg = 8'b0010_0000; // 32
end

always @(posedge clk) begin
    if (first_run == 1) begin // make sure old_mot_control != new motor control on first run so counter starts
        old_motor_control = ~motor_control;
        first_run = 0;
    end
        
    if (motor_control != old_motor_control) begin // if new direction, restart counter
        counter = 0;
        old_motor_control = motor_control;
    end
    else begin // else keep counting
        counter = counter + 1;
    end
    
    if (counter == count_limit) begin
        counter = 0;
        
        if(motor_control == 4'b0001) begin  // head north 1
            if(LocY_reg != 124) begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg + 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0010) begin  // head south 2
            if(LocY_reg != 3) begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg - 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0011) begin  // head east 3
            if(LocX_reg != 124) begin
                LocX_reg = LocX_reg + 1;
                LocY_reg = LocY_reg;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0100) begin  // head west 4
            if(LocX_reg != 3) begin
                LocX_reg = LocX_reg - 1;
                LocY_reg = LocY_reg;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0101) begin  // head north-east 5
            if(LocX_reg != 124 && LocY_reg != 124) begin
                LocX_reg = LocX_reg + 1;
                LocY_reg = LocY_reg + 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0110) begin  // head south-east 6
            if(LocX_reg != 124 && LocY_reg != 3) begin
                LocX_reg = LocX_reg + 1;
                LocY_reg = LocY_reg - 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b0111) begin  // head south-west 7
            if(LocX_reg != 3 && LocY_reg != 3) begin
                LocX_reg = LocX_reg - 1;
                LocY_reg = LocY_reg - 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else if(motor_control == 4'b1000) begin  // head north-west 8
            if(LocX_reg != 3 && LocY_reg != 124) begin
                LocX_reg = LocX_reg - 1;
                LocY_reg = LocY_reg + 1;
            end else begin
                LocX_reg = LocX_reg;
                LocY_reg = LocY_reg;
            end
        end
        else begin
            LocX_reg = LocX_reg;
            LocY_reg = LocY_reg;
        end
    end
end
    
endmodule
