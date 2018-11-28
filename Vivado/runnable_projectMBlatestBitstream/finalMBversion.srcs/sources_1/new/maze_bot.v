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

module maze_bot(
    input clk,rst,soft_rst,
    input [2:0] ball_direction,
    input [1:0] x_speed, y_speed,
    input [1:0] mapPixel,
    output reg [7:0] LocX_reg,
    output reg [7:0] LocY_reg,
    output reg mazeEnd, hitMazeWall, deadlock, //deadlock the icon, hit a wall, so cannot move
    output reg [13:0] mapAddress,
    output reg [2:0] internal_ball_direction
    );
    
reg [29:0] count_limit_x, count_limit_y;
reg [28:0] counter_x, counter_y;
reg [7:0] prev_LocX_reg, prev_LocY_reg;

reg wallHit;
reg [1:0] resetState;

parameter   NORTH = 3'd0,
            NORTHEAST = 3'd1,
            EAST = 3'd2,
            SOUTHEAST = 3'd3,
            SOUTH = 3'd4,
            SOUTHWEST = 3'd5,
            WEST = 3'd6,
            NORTHWEST = 3'd7;

parameter   IDLE = 2'd0,
            SLOWEST = 2'd1,
            SLOW = 2'd2,
            FAST = 2'd3;

parameter   BLACK = 2'd1,
            WHITE = 2'd0,
            RED = 2'd2;

parameter   SLOWESTCOUNT = 29'd8775000,
            SLOWCOUNT = 29'd6442500,
            FASTCOUNT = 29'd4050000;
    
initial begin
    counter_x = 0;
    counter_y = 0;
    prev_LocX_reg = 64;
    prev_LocY_reg = 64;
    LocX_reg = 64;
    LocY_reg = 64;
    internal_ball_direction = 0;
    mazeEnd = 0;
    hitMazeWall = 0;
    deadlock = 0;
end



always @(*) begin
    if(mapPixel == BLACK || mapPixel == RED)
        wallHit = 1;
    else wallHit = 0;

    mapAddress = LocY_reg*128 + LocX_reg;

    case(x_speed)
        SLOWEST : count_limit_x = SLOWESTCOUNT;
        SLOW : count_limit_x = SLOWCOUNT;
        FAST : count_limit_x = FASTCOUNT;
        default : count_limit_x = SLOWESTCOUNT;
    endcase

    case(y_speed)
        SLOWEST : count_limit_y = SLOWESTCOUNT;
        SLOW : count_limit_y = SLOWCOUNT;
        FAST : count_limit_y = FASTCOUNT;
        default : count_limit_y = SLOWESTCOUNT;
    endcase
end
            

always @(posedge clk) begin
    if(!rst || !soft_rst) begin
        internal_ball_direction <= 0;
        counter_x <= 0;
        counter_y <= 0;
        LocX_reg <=  64;
        LocY_reg <= 64;
        prev_LocX_reg = 64;
        prev_LocY_reg = 64;
        mazeEnd <= 0;
        hitMazeWall <= 0;
        deadlock <= 0;
    end 
    else begin
        if (ball_direction != internal_ball_direction) begin // if new direction, restart counter
            counter_x <= 0;
            counter_y <= 0;
            internal_ball_direction <= ball_direction;
        end
        else begin
            if(wallHit) begin //a wall was hit, deadlock and move backwards
                deadlock <= 1;
                counter_x <= 0;
                counter_y <= 0;
                if(mapPixel == BLACK) hitMazeWall <= 1;
                else mazeEnd <= 1;
                
                //move back to prev location without wallHit
                LocX_reg <= prev_LocX_reg;
                LocY_reg <= prev_LocY_reg;
            end
            else begin
                if(!deadlock && (x_speed != IDLE || y_speed != IDLE)) begin
                    if(counter_x >= count_limit_x && x_speed != IDLE) begin
                        counter_x <= 0;
                        if((internal_ball_direction == EAST || internal_ball_direction == NORTHEAST || internal_ball_direction == SOUTHEAST) && LocX_reg != 127) begin  // move east
                                LocX_reg <= LocX_reg + 1;
                                prev_LocX_reg <= LocX_reg;
                        end
                        else if((internal_ball_direction == WEST || internal_ball_direction == SOUTHWEST || internal_ball_direction == NORTHWEST) && LocX_reg != 0) begin  // move west
                                LocX_reg <= LocX_reg - 1;
                                prev_LocX_reg <= LocX_reg;
                        end
                        else begin 
                            LocX_reg <= LocX_reg;
                            prev_LocX_reg <= prev_LocX_reg;
                        end
                    end
                    else if(x_speed != IDLE) counter_x <= counter_x + 1;
                    else counter_x <= counter_x;
                    
                    if(counter_y >= count_limit_y && y_speed != IDLE) begin //y speed is not idle and counter limit has been reached, move north or west
                        counter_y <= 0;
                        if((internal_ball_direction == NORTH || internal_ball_direction == NORTHEAST || internal_ball_direction == NORTHWEST) && LocY_reg != 0) begin  // move north
                                LocY_reg <= LocY_reg - 1;
                                prev_LocY_reg <= LocY_reg;
                        end
                        else if((internal_ball_direction == SOUTH || internal_ball_direction == SOUTHEAST || internal_ball_direction == SOUTHWEST) && LocY_reg != 127) begin  // move south
                                LocY_reg <= LocY_reg + 1;
                                prev_LocY_reg <= LocY_reg;
                        end
                        else begin 
                            LocY_reg <= LocY_reg;
                            prev_LocY_reg <= prev_LocY_reg;
                        end
                    end
                    else if(y_speed != IDLE) counter_y <= counter_y + 1; //speed y is not idle, then increment the counter
                    else counter_y <= counter_y;
                end
                else begin
                    counter_x <= counter_x;
                    counter_y <= counter_y;
                end
            end 
        end
    end
end
    
endmodule
