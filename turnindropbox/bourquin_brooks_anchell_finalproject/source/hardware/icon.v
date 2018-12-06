`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Michael Bourquin
// 
// Create Date: 10/23/2018 05:05:14 PM
// Design Name: icon
// Module Name: icon
// Project Name: Toad Maze Game Final Project
// Target Devices: 
// Tool Versions: 
// Description: memory module for the toad icon and mapping logic to the display colorizer
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module icon(
    input clk,
    input [7:0] locXReg, locYReg,
    input [11:0] pixel_row, pixel_column,
    output reg [1:0] icon
    );
    //reg [2:0] orientation;
    
    reg onDisplay, readIcon;

    reg [11:0] locXoffset,locYoffset,locXpixel,locYpixel;
    reg [7:0] ramAddr; //address for the image pixel map RAM 
    reg [3:0] map_col1, map_row1;
    
   	reg [1:0] iconmap0 [255:0]; //memory map array reg for the toad icon (16X16)
        
    initial begin
       $readmemh("icon1.dat", iconmap0);
    end  
    
    always@(posedge clk) begin
    	if(readIcon) begin
    		icon <= iconmap0[ramAddr]; output icon pixels when bot overlaps current display pixels
    	end
    	else icon <= 0;
    end
    
    //combinatorial logic, to determine icon mem address and whether to read from the icon memory, output transparent
    always@(*) begin 
        if(locXReg < 2 || locYReg < 2 || locXReg > 125 || locYReg > 125)  begin //robot is off the screen
            onDisplay = 0;
            locXpixel = 0;
            locYpixel = 0;
        end
        else begin
           onDisplay = 1;
           locXpixel = (locXReg*8)-12; 
           locYpixel = (locYReg*6)-9; 
        end
        
        //check if the display pixels overlap the icon and icon is on the screen
        if(pixel_row >= locYpixel && pixel_row < locYpixel + 24 && pixel_column >= locXpixel && pixel_column < locXpixel + 32 && onDisplay) begin
        	locXoffset = pixel_column - locXpixel;
        	locYoffset = pixel_row - locYpixel;

        	//get the pixel row in the icon map array (range from 0 - 24, every 1.5 pixel so use pattern
        	//112,122,112,...
        	if(locYoffset >= 0 && locYoffset < 1) map_row1 = 0; //112
        	else if(locYoffset >= 1 && locYoffset < 2) map_row1 = 1;
        	else if(locYoffset >= 2 && locYoffset < 4) map_row1 = 2;

        	else if(locYoffset >= 4 && locYoffset < 5) map_row1 = 3; //122
        	else if(locYoffset >= 5 && locYoffset < 7) map_row1 = 4;
        	else if(locYoffset >= 7 && locYoffset < 9) map_row1 = 5;

        	else if(locYoffset >= 9 && locYoffset < 10) map_row1 = 6; //112
        	else if(locYoffset >= 10 && locYoffset < 11) map_row1 = 7;
        	else if(locYoffset >= 11 && locYoffset < 13) map_row1 = 8;

        	else if(locYoffset >= 13 && locYoffset < 14) map_row1 = 9; //122
        	else if(locYoffset >= 14 && locYoffset < 16) map_row1 = 10;
        	else if(locYoffset >= 16 && locYoffset < 18) map_row1 = 11;

        	else if(locYoffset >= 18 && locYoffset < 19) map_row1 = 12; //112
        	else if(locYoffset >= 19 && locYoffset < 20) map_row1 = 13;
        	else if(locYoffset >= 20 && locYoffset < 22) map_row1 = 14;
        	
        	else  map_row1 = 15; //1

        	//get the pixel column in the icon map array
        	map_col1 = locXoffset/2;

        	readIcon = 1;
        end
        else begin
            locXoffset = 0;
            locYoffset = 0;
        
        	map_row1 = 0; //default row index
        	map_col1 = 0; //default col index

        	readIcon = 0;
        end

        ramAddr = map_row1*16 + map_col1;
    end
endmodule
