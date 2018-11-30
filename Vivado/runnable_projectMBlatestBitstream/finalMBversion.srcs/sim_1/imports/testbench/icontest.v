// testbench.v
// 31 May 2014
//
// Drive the mipsfpga_sys module for simulation testing

`timescale 1ps/1ps

module icontest;
    reg clk;
    reg [7:0] locXReg, locYReg, botInfoReg;
    reg [11:0] pixel_row, pixel_column;
    wire [1:0] icon;
    
    icon icon1(
        .clk(clk),
        .locXReg(locXReg),
        .locYReg(locYReg),
        .pixel_row(pixel_row),
        .pixel_column(pixel_column),
        .icon(icon));

    initial
    begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end
    
    integer row;
    integer col;
    initial
    begin
        locXReg <= 2;
        locYReg <= 2;
        for(row = 3; row < 27; row=row+1) begin
            for(col = 4; col < 36; col=col+1) begin
                pixel_row <= row;
                pixel_column <= col;
                repeat (1) @(posedge clk);
            end
        end
        $stop;
    end
/*
    initial
    begin
        $dumpvars;
        $timeformat (-9, 1, "ns", 10);
    end
*/    
endmodule
