`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Michael Bourquin
// 
// Create Date: 11/13/2018 03:30:46 PM
// Design Name: Accelerometer (AXDL362 Top Level)
// Module Name: mhp_axdl362
// Project Name: Toad Maze Game Final Project
// Target Devices: 
// Tool Versions: 
// Description: 
// Top Level Interface Module to the Accelerometer Onboard Chipset
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mhp_axdl362(
    input clk_50, clk_SPI, reset, MISO,
    output MOSI, n_CS,
    output [11:0] x_acc_reg, y_acc_reg, z_acc_reg,
    output [2:0] counter, SPI_state
    );
    
    wire spi_reset, roundDD;
    wire [11:0] x_acc_temp, y_acc_temp, z_acc_temp;
    
    //instantiate the SPI driver (interfaces with the accelerometer chip)
    spi_interface SPI_driver(
        .clk_SPI(clk_SPI), 
        .reset(spi_reset), 
        .MISO(MISO),
        .MOSI(MOSI), 
        .n_CS(n_CS),
        .roundDD(roundDD),
        .x_acc_reg_temp(x_acc_temp),
        .y_acc_reg_temp(y_acc_temp),
        .z_acc_reg_temp(z_acc_temp),
        .counter(counter), 
        .SPI_state(SPI_state)
    );
    
    //instantiate the MIPS synchonizer module (syncs the SPI clock inputs to the MIPS sys)
    sys_sync spi_sync(
       .clk_50(clk_50), 
       .roundDD(roundDD), 
       .reset(reset),
       .x_acc_reg_temp(x_acc_temp),
       .y_acc_reg_temp(y_acc_temp),
       .z_acc_reg_temp(z_acc_temp),
       .x_acc_reg(x_acc_reg), 
       .y_acc_reg(y_acc_reg), 
       .z_acc_reg(z_acc_reg),
       .reset1(spi_reset)
    );
      
endmodule
