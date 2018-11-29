-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Nov 28 21:50:57 2018
-- Host        : LAPTOP-VQA3KK4R running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Chelsea/Documents/GitHub/ECE540FinalProject/Vivado/runnable_projectMBlatestBitstream/finalMBversion.srcs/sources_1/ip/worldmap_level1/worldmap_level1_stub.vhdl
-- Design      : worldmap_level1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity worldmap_level1 is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 13 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end worldmap_level1;

architecture stub of worldmap_level1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[13:0],douta[1:0],clkb,addrb[13:0],doutb[1:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2018.2";
begin
end;
