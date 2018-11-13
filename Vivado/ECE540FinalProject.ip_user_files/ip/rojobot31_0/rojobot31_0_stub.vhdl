-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Nov 12 21:23:11 2018
-- Host        : LAPTOP-8RH9CDEQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/VivadoProjects/ECE540FinalProject/ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/rojobot31_0_stub.vhdl
-- Design      : rojobot31_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rojobot31_0 is
  Port ( 
    MotCtl_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    LocX_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LocY_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Sensors_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BotInfo_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    worldmap_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    worldmap_data : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_in : in STD_LOGIC;
    reset : in STD_LOGIC;
    upd_sysregs : out STD_LOGIC;
    Bot_Config_reg : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end rojobot31_0;

architecture stub of rojobot31_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "MotCtl_in[7:0],LocX_reg[7:0],LocY_reg[7:0],Sensors_reg[7:0],BotInfo_reg[7:0],worldmap_addr[13:0],worldmap_data[1:0],clk_in,reset,upd_sysregs,Bot_Config_reg[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rojobot31,Vivado 2018.2";
begin
end;
