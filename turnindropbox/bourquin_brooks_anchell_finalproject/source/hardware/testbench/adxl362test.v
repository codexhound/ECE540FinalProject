// adxl362test.v
// 13 Nov 2018
// Engineers: Michael Bourquin, Jonathon Anchell, and Chelsea Brooks
// Drive the ADXL interface module to test correct driver operation

`timescale 1ps/1ps

module adxl362test;
    reg clk_50, clk_SPI, reset, MISO;
    wire MISI, n_CS;
    wire [11:0] x_acc_reg, y_acc_reg, z_acc_reg;
    wire [2:0] counter;
    wire [2:0] readState;
    reg [7:0] data;
    
    mhp_axdl362 accel_test (
        .clk_50(clk_50),
        .clk_SPI(clk_SPI),
        .reset(reset),
        .MISO(MISO),
        .MOSI(MISI),
        .n_CS(n_CS),
        .x_acc_reg(x_acc_reg),
        .y_acc_reg(y_acc_reg),
        .z_acc_reg(z_acc_reg),
        .counter(counter),
        .SPI_state(readState)
    );

    initial
    begin
        MISO = 0;
        data = 255;
        clk_50 = 0;
        clk_SPI = 0;
        forever begin
            #1 clk_50 = ~clk_50;
        end
    end
    
    initial forever #4 clk_SPI = ~clk_SPI;
    
    always@(posedge clk_50) begin
        if(readState == 3'd3) begin
                    MISO <= data[counter];
                end
    end
    
    initial
    begin
        reset <= 0;
        repeat (4) @(posedge clk_SPI);
        reset <= 1;
        repeat (1000) @(posedge clk_SPI);
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
