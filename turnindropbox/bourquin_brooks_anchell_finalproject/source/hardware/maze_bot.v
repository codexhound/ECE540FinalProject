`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Michael Bourquin, Chelsea Brooks, Jonathon Anchell
// 
// Create Date: 11/25/2018 01:49:29 PM
// Design Name: Maze Bot
// Module Name: Maze Bot
// Project Name:  Toad Maze Game Final Project
// Target Devices: 
// Tool Versions: 
// Description: Hardware controller model/controller for the maze bot (displays as toad icon).
// Keeps track of current 128X128 coordinates, updates based on current x/y speed and direction inputs from the MIPS system
// Deadlocks on a wall hit (wait state), can then be restarted via software (MIPS sys)
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

reg wallHit;
reg [1:0] resetState;

//direction parameters
parameter   NORTH = 3'd0,
            NORTHEAST = 3'd1,
            EAST = 3'd2,
            SOUTHEAST = 3'd3,
            SOUTH = 3'd4,
            SOUTHWEST = 3'd5,
            WEST = 3'd6,
            NORTHWEST = 3'd7;

//speed parameters
parameter   IDLE = 2'd0,
            SLOWEST = 2'd1,
            SLOW = 2'd2,
            FAST = 2'd3;

//color parameters (wall hit detection)
parameter   BLACK = 2'd1,
            WHITE = 2'd0,
            RED = 2'd2;

parameter   SLOWESTCOUNT = 29'd6675000,
            SLOWCOUNT = 29'd5542500,
            FASTCOUNT = 29'd3350000;
    
initial begin
    counter_x = 0;
    counter_y = 0;
    LocX_reg = 68;
    LocY_reg = 60;
    internal_ball_direction = 0;
    mazeEnd = 0;
    hitMazeWall = 0;
    deadlock = 0;
end


//combinatorial logic begins here
//calculate current x,y speed count limits based on speed inputs, wall hit detection
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
            

//flip flop sequential logic
always @(posedge clk) begin
    //reset (hard reset or MIPS reset, reinitializes the maze bot to initial conditions
    if(!rst || !soft_rst) begin
        internal_ball_direction <= 0;
        counter_x <= 0;
        counter_y <= 0;
        LocX_reg <=  68;
        LocY_reg <= 60;
        mazeEnd <= 0;
        hitMazeWall <= 0;
        deadlock <= 0;
    end 
    else begin
        //restart the speed counters when the direction changes and update the direction
        if (ball_direction != internal_ball_direction) begin // if new direction, restart counter
            counter_x <= 0;
            counter_y <= 0;
            internal_ball_direction <= ball_direction;
        end
        else begin
            if(wallHit && !deadlock) begin //a wall was hit, deadlock and move icon off the screen (will not display when deadlocked)
                deadlock <= 1;
                counter_x <= 0;
                counter_y <= 0;
                if(mapPixel == BLACK) hitMazeWall <= 1;
                else mazeEnd <= 1;
                
                LocX_reg <= 0;
                LocY_reg <= 0;
            end
            else begin
                //only update the positions if one of the speeds is not idle and not currently deadlocked
                if(!deadlock && (x_speed != IDLE || y_speed != IDLE)) begin
                    //update x position if count limit has been reached and x speed not idle
                    if(counter_x >= count_limit_x && x_speed != IDLE) begin
                        counter_x <= 0; //reset the x counter
                        //cases for directions
                        if((internal_ball_direction == EAST || internal_ball_direction == NORTHEAST || internal_ball_direction == SOUTHEAST) && LocX_reg != 127) begin  // move east
                                LocX_reg <= LocX_reg + 1;
                        end
                        else if((internal_ball_direction == WEST || internal_ball_direction == SOUTHWEST || internal_ball_direction == NORTHWEST) && LocX_reg != 0) begin  // move west
                                LocX_reg <= LocX_reg - 1;
                        end
                        else begin 
                            LocX_reg <= LocX_reg;
                        end
                    end
                    else if(x_speed != IDLE) counter_x <= counter_x + 1;
                    else counter_x <= counter_x;
                    
                    //update y position if count limit has been reached and y speed not idle
                    if(counter_y >= count_limit_y && y_speed != IDLE) begin //y speed is not idle and counter limit has been reached, move north or west
                        counter_y <= 0; //reset the x counter
                        //cases for directions
                        if((internal_ball_direction == NORTH || internal_ball_direction == NORTHEAST || internal_ball_direction == NORTHWEST) && LocY_reg != 0) begin  // move north
                                LocY_reg <= LocY_reg - 1;
                        end
                        else if((internal_ball_direction == SOUTH || internal_ball_direction == SOUTHEAST || internal_ball_direction == SOUTHWEST) && LocY_reg != 127) begin  // move south
                                LocY_reg <= LocY_reg + 1;
                        end
                        else begin 
                            LocY_reg <= LocY_reg;
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
