// testbench.v
// 31 May 2014
//
// Drive the mipsfpga_sys module for simulation testing

`timescale 1ps/1ps

module test_speed;
    reg clk, rst;
    reg [11:0] x_acc_reg, y_acc_reg;
    wire [2:0] speed; 
    wire [11:0] x_acc_twoC, y_acc_twoC;
    
    speed_calc calc1(
       .clk(clk), 
       .rst(rst),
       .x_acc(x_acc_reg), 
       .y_acc(y_acc_reg),
       .speed(speed),
       .x_acc_twoC(x_acc_twoC), 
       .y_acc_twoC(y_acc_twoC)
        );

    initial
    begin
        rst = 0;
        clk = 0;
        x_acc_reg = 12'b100111000010;
        y_acc_reg = 12'b100111000111;
        forever begin
            #1 clk = ~clk;
        end
    end
    
    initial
    begin
        repeat (4) @(posedge clk);
        rst <= 1;
        repeat (3000) @(posedge clk);
        $stop;
    end

endmodule
