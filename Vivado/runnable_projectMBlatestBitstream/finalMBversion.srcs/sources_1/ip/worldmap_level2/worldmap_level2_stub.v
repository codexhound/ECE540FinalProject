// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Nov 28 21:52:07 2018
// Host        : LAPTOP-VQA3KK4R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top worldmap_level2 -prefix
//               worldmap_level2_ worldmap_level2_stub.v
// Design      : worldmap_level2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *)
module worldmap_level2(clka, addra, douta, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[13:0],douta[1:0],clkb,addrb[13:0],doutb[1:0]" */;
  input clka;
  input [13:0]addra;
  output [1:0]douta;
  input clkb;
  input [13:0]addrb;
  output [1:0]doutb;
endmodule
