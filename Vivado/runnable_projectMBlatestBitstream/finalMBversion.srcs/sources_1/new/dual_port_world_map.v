`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2018 11:58:46 AM
// Design Name: 
// Module Name: dual_port_world_map
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

// testbench.v
// 31 May 2014
//
// Drive the mipsfpga_sys module for simulation testing

module world_map_top(
    input clk,
    input [13:0] addra, addrb,
    output [1:0] douta, doutb
    );
    
    dual_port_world_map world_map1(
        .clk(clk),
        .addra(addra),
        .addrb(addrb),
        .douta(douta),
        .doutb(doutb)
        );
     defparam world_map1.MEMFILE = "level1.mem";
endmodule

    


module dual_port_world_map(
    input clk,
    input [13:0] addra, addrb,
    output reg [1:0] douta,doutb
    );
    
    parameter MEMFILE = "";
    
    reg [1:0] ramArray [16383:0];
    
    initial begin
        $readmemh(MEMFILE, ramArray);
    end
    
    always@(posedge clk) begin
        douta <= ramArray[addra];
        doutb <= ramArray[addrb];
    end
endmodule
