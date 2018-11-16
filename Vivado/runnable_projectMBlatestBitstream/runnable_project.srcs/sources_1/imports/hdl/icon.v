`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 05:05:14 PM
// Design Name: 
// Module Name: icon
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


module icon(
    input clk,
    input [7:0] locXReg, locYReg, botInfoReg,
    //input [6:0] map_row, map_col,
    input [11:0] pixel_row, pixel_column,
    output reg [1:0] icon
    );
    reg [2:0] orientation, orientation1;
    //store reg for each different icon orientation
    
    //icon registers (shifted and clked)
    reg [1:0] icon1;
    
    reg read1, read2, read1a, read2a;

    //for 16X16 range regs to get icon index's
    reg [4:0] map_current_rowcol;
    reg [3:0] map_row, map_col, map_row1, map_col1;
    //////////////////////////////////////////
    
    reg [11:0] pixel_l, pixel_m, locXpixel, locYpixel, pixel_colRange; //pixel range variables and unsigned display coord of robot
    reg onDisplay;

    reg [7:0] ramAddr; //address for the image pixel map RAM 
    
    
   /*memory maps for the icon, need 0, 45, 90, 135, 180, 225, 270, 315*/
        reg [1:0] iconmap0 [255:0]; //forward(0) icon pixel map
        reg [1:0] iconmap45 [255:0]; //45 icon pixel map
        reg [1:0] iconmap90 [255:0]; //90 icon pixel map
        reg [1:0] iconmap135 [255:0]; //135 icon pixel map
        reg [1:0] iconmap180 [255:0]; //180 icon pixel map
        reg [1:0] iconmap225 [255:0]; //225 icon pixel map
        reg [1:0] iconmap270 [255:0]; //270 icon pixel map
        reg [1:0] iconmap315 [255:0]; //315 icon pixel map
        
        initial begin
            //map_row = 0;
            //map_col = 0;
            //read1 = 0;
            //read2 = 0;
            //orientation = 0;
            //icon = 0;
           $readmemh("0deg.dat", iconmap0);
           $readmemh("45deg.dat", iconmap45);
           $readmemh("90deg.dat", iconmap90);
           $readmemh("135deg.dat", iconmap135);
           $readmemh("180deg.dat", iconmap180);
           $readmemh("225deg.dat", iconmap225);
           $readmemh("270deg.dat", iconmap270);
           $readmemh("315deg.dat", iconmap315);
        end  
    
    //sequential logic
    always@(posedge clk) begin
        //split some of the combo logic by pipelining
        map_row <= map_row1;
        map_col <= map_col1;
        read1 <= read1a;
        read2 <= read2a;
        orientation <= orientation1;
        //sync icon (valid data 2 clocks after change of display)
        icon <= icon1;
    end
    
    //combinatorial logic, to determine icon mem address and whether to read from the icon memory, output transparent
    always@(*) begin
        orientation1 = botInfoReg[2:0];
        read1a = 0;
        read2a = 0; //both read1 and read2 must be 1 for icon memory to be read, says that the icon is within the 24X32 box range (display size)
        map_row1 = 0; //default row index
        map_col1 = 0; //default col index
        
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
        
        //128X128 -> 768X1024: (column_index*6)X(row_index*8) -> 512X512 -> (column_index*6*4)X(row_index*8*4)
        //display range for icon is (locXpixel - (locXpixel + 32)) X (locYpixel - (locYpixel + 24))

                //get the pixel row in the icon map array (range from 0 - 24, every 1.5 pixel so use pattern
        		//112,122,112,...
                map_current_rowcol = 0; //112 pattern
                pixel_l = locYpixel;
                pixel_m = locYpixel+1;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+1;
                pixel_m = locYpixel+2;
                map_current_rowcol = 1;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+2;
                pixel_m = locYpixel+4;
                map_current_rowcol = 2;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                pixel_l = locYpixel+4; //122 pattern
                pixel_m = locYpixel+5;
                map_current_rowcol = 3;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+5;
                pixel_m = locYpixel+7;
                map_current_rowcol = 4;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+7;
                pixel_m = locYpixel+9;
                map_current_rowcol = 5;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                pixel_l = locYpixel+9; //112 pattern
                pixel_m = locYpixel+10;
                map_current_rowcol = 6;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+10;
                pixel_m = locYpixel+11;
                map_current_rowcol = 7;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+11;
                pixel_m = locYpixel+13;
                map_current_rowcol = 8;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                pixel_l = locYpixel+13; //122 pattern
                pixel_m = locYpixel+14;
                map_current_rowcol = 9;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+14;
                pixel_m = locYpixel+16;
                map_current_rowcol = 10;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+16;
                pixel_m = locYpixel+18;
                map_current_rowcol = 11;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                pixel_l = locYpixel+18; //112 pattern
                pixel_m = locYpixel+19;
                map_current_rowcol = 12;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+19;
                pixel_m = locYpixel+20;
                map_current_rowcol = 13;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end
                pixel_l = locYpixel+20;
                pixel_m = locYpixel+22;
                map_current_rowcol = 14;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                pixel_l = locYpixel+22; //end pattern
                pixel_m = locYpixel+24;
                map_current_rowcol = 15;
                if(pixel_row >= pixel_l && pixel_row < pixel_m && onDisplay) begin
                    map_row1 = map_current_rowcol[3:0];
                    read1a = 1;
                end

                //get the pixel column in the icon map array (range from 0 - 32, every 2 pixels
                pixel_colRange = 32+locXpixel;
                for (map_current_rowcol=0, pixel_l = locXpixel, pixel_m = locXpixel+2; pixel_l < pixel_colRange && map_current_rowcol<16; map_current_rowcol = map_current_rowcol+1,pixel_l = pixel_l + 2, pixel_m = pixel_m +2)
                begin
                   if (pixel_column >= pixel_l && pixel_column < pixel_m && onDisplay) begin
                     map_col1 = map_current_rowcol[3:0];
                     read2a = 1;
                   end
                end

        //begin at next clk edge, all inputs are shifted by 1 clk
        ramAddr = map_row*16 + map_col;
        
        if(read1 && read2) begin
        case(orientation) //choose the correct map to get the icon bits from (determined by orientation of robot)
          3'd0: icon1 = iconmap0[ramAddr];
          3'd1: icon1 = iconmap45[ramAddr];
          3'd2: icon1 = iconmap90[ramAddr];
          3'd3: icon1 = iconmap135[ramAddr];
          3'd4: icon1 = iconmap180[ramAddr];
          3'd5: icon1 = iconmap225[ramAddr];
          3'd6: icon1 = iconmap270[ramAddr];
          3'd7: icon1 = iconmap315[ramAddr];
        endcase
        end
        else icon1 = 0;
    end
endmodule
