// testbench.v
// 31 May 2014
//
// Drive the mipsfpga_sys module for simulation testing

`timescale 1ps/1ps

module test_maze_icon;
    reg clk, rst, soft_rst;
    reg [1:0] x_speed, y_speed;
    reg [3:0] ball_dir;
    wire [7:0] LocX_reg, LocY_reg;
    wire [13:0] worldmap_addr;
    reg [1:0] worldmap_data;
    wire mazeEnd, hitMazeWall, deadlock;
    
    parameter   NORTH = 4'd0,
                SOUTH = 4'd1,
                EAST = 4'd2,
                WEST = 4'd3,
                NORTHEAST = 4'd4,
                SOUTHEAST = 4'd5,
                SOUTHWEST = 4'd6,
                NORTHWEST = 4'd7;
    
    parameter   IDLE = 2'd0,
                SLOWEST = 2'd1,
                SLOW = 2'd2,
                FAST = 2'd3;
    
    parameter   BLACK = 2'd1,
                WHITE = 2'd0,
                RED = 2'd2;
    
    maze_robot_testing Maze_Icon(
            .clk(clk),
            .ball_direction(ball_dir),
            .LocX_reg(LocX_reg),
            .LocY_reg(LocY_reg),
            .rst(rst),
            .soft_rst(soft_rst),
            .x_speed(x_speed),
            .y_speed(y_speed),
            .mapPixel(worldmap_data),
            .mazeEnd(mazeEnd), 
            .hitMazeWall(hitMazeWall), 
            .deadlock(deadlock),
            .mapAddress(worldmap_addr)
        );  

    initial
    begin
        rst = 0;
        soft_rst = 1;
        clk = 0;
        worldmap_data = 0;
        x_speed = SLOWEST;
        y_speed = SLOW;
        ball_dir = NORTHEAST;
        forever begin
            #1 clk = ~clk;
        end
    end
    
    initial
    begin
        repeat (4) @(posedge clk);
        rst = 1;
        repeat (10) @(posedge clk);
        worldmap_data = 1;
        repeat (10) @(posedge clk);
        soft_rst = 0;
        repeat (2) @(posedge clk);
        soft_rst = 1;
        repeat (10) @(posedge clk);
        worldmap_data = 2;
        repeat (10) @(posedge clk);
        soft_rst = 0;
        worldmap_data = 0;
        repeat (10) @(posedge clk);
        soft_rst = 1;
        y_speed = IDLE;
        repeat (30) @(posedge clk);
        $stop;
    end

endmodule
