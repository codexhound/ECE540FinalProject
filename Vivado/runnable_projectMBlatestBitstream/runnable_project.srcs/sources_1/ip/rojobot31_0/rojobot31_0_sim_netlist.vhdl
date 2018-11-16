-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Nov 12 21:23:11 2018
-- Host        : LAPTOP-8RH9CDEQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/VivadoProjects/ECE540FinalProject/ECE540FinalProject.srcs/sources_1/ip/rojobot31_0/rojobot31_0_sim_netlist.vhdl
-- Design      : rojobot31_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rojobot31_0_bot31_if is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    upd_sysregs : out STD_LOGIC;
    \DataOut_reg[0]_0\ : out STD_LOGIC;
    \DataOut_reg[1]_0\ : out STD_LOGIC;
    \DataOut_reg[2]_0\ : out STD_LOGIC;
    \DataOut_reg[3]_0\ : out STD_LOGIC;
    \DataOut_reg[4]_0\ : out STD_LOGIC;
    \DataOut_reg[5]_0\ : out STD_LOGIC;
    \DataOut_reg[6]_0\ : out STD_LOGIC;
    \DataOut_reg[7]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \data_path_loop[6].low_hwbuild.shift_rotate_flop\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LocX_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LocY_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BotInfo_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Sensors_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    worldmap_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    write_strobe_flop : in STD_LOGIC;
    clk_in : in STD_LOGIC;
    reset : in STD_LOGIC;
    write_strobe_flop_0 : in STD_LOGIC;
    kcpsm6_rom : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MotCtl_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    write_strobe_flop_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    write_strobe_flop_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    write_strobe_flop_3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    write_strobe_flop_4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    kcpsm6_rom_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    write_strobe_flop_5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    write_strobe_flop_6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of rojobot31_0_bot31_if : entity is "bot31_if";
end rojobot31_0_bot31_if;

architecture STRUCTURE of rojobot31_0_bot31_if is
  signal BotInfo_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal LocX_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal LocY_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  E(0) <= \^e\(0);
  Q(7 downto 0) <= \^q\(7 downto 0);
\BotInfo_int_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(0),
      Q => BotInfo_int(0)
    );
\BotInfo_int_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(1),
      Q => BotInfo_int(1)
    );
\BotInfo_int_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(2),
      Q => BotInfo_int(2)
    );
\BotInfo_int_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(3),
      Q => BotInfo_int(3)
    );
\BotInfo_int_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(4),
      Q => BotInfo_int(4)
    );
\BotInfo_int_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(5),
      Q => BotInfo_int(5)
    );
\BotInfo_int_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(6),
      Q => BotInfo_int(6)
    );
\BotInfo_int_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_3(0),
      CLR => reset,
      D => D(7),
      Q => BotInfo_int(7)
    );
\BotInfo_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(0),
      Q => BotInfo_reg(0)
    );
\BotInfo_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(1),
      Q => BotInfo_reg(1)
    );
\BotInfo_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(2),
      Q => BotInfo_reg(2)
    );
\BotInfo_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(3),
      Q => BotInfo_reg(3)
    );
\BotInfo_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(4),
      Q => BotInfo_reg(4)
    );
\BotInfo_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(5),
      Q => BotInfo_reg(5)
    );
\BotInfo_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(6),
      Q => BotInfo_reg(6)
    );
\BotInfo_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => BotInfo_int(7),
      Q => BotInfo_reg(7)
    );
\DataOut[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(0),
      I1 => LocY_int(0),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(0),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(0),
      O => \DataOut_reg[0]_0\
    );
\DataOut[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(1),
      I1 => LocY_int(1),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(1),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(1),
      O => \DataOut_reg[1]_0\
    );
\DataOut[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(2),
      I1 => LocY_int(2),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(2),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(2),
      O => \DataOut_reg[2]_0\
    );
\DataOut[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(3),
      I1 => LocY_int(3),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(3),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(3),
      O => \DataOut_reg[3]_0\
    );
\DataOut[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(4),
      I1 => LocY_int(4),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(4),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(4),
      O => \DataOut_reg[4]_0\
    );
\DataOut[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(5),
      I1 => LocY_int(5),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(5),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(5),
      O => \DataOut_reg[5]_0\
    );
\DataOut[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(6),
      I1 => LocY_int(6),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(6),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(6),
      O => \DataOut_reg[6]_0\
    );
\DataOut[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BotInfo_int(7),
      I1 => LocY_int(7),
      I2 => kcpsm6_rom(1),
      I3 => LocX_int(7),
      I4 => kcpsm6_rom(0),
      I5 => MotCtl_in(7),
      O => \DataOut_reg[7]_0\
    );
\DataOut_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(0),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(0),
      R => '0'
    );
\DataOut_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(1),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(1),
      R => '0'
    );
\DataOut_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(2),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(2),
      R => '0'
    );
\DataOut_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(3),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(3),
      R => '0'
    );
\DataOut_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(4),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(4),
      R => '0'
    );
\DataOut_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(5),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(5),
      R => '0'
    );
\DataOut_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(6),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(6),
      R => '0'
    );
\DataOut_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_in,
      CE => '1',
      D => kcpsm6_rom_0(7),
      Q => \data_path_loop[6].low_hwbuild.shift_rotate_flop\(7),
      R => '0'
    );
\LocX_int_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(0),
      Q => LocX_int(0)
    );
\LocX_int_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(1),
      Q => LocX_int(1)
    );
\LocX_int_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(2),
      Q => LocX_int(2)
    );
\LocX_int_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(3),
      Q => LocX_int(3)
    );
\LocX_int_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(4),
      Q => LocX_int(4)
    );
\LocX_int_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(5),
      Q => LocX_int(5)
    );
\LocX_int_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(6),
      Q => LocX_int(6)
    );
\LocX_int_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_1(0),
      CLR => reset,
      D => D(7),
      Q => LocX_int(7)
    );
\LocX_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(0),
      Q => LocX_reg(0)
    );
\LocX_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(1),
      Q => LocX_reg(1)
    );
\LocX_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(2),
      Q => LocX_reg(2)
    );
\LocX_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(3),
      Q => LocX_reg(3)
    );
\LocX_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(4),
      Q => LocX_reg(4)
    );
\LocX_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(5),
      Q => LocX_reg(5)
    );
\LocX_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(6),
      Q => LocX_reg(6)
    );
\LocX_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocX_int(7),
      Q => LocX_reg(7)
    );
\LocY_int_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(0),
      Q => LocY_int(0)
    );
\LocY_int_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(1),
      Q => LocY_int(1)
    );
\LocY_int_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(2),
      Q => LocY_int(2)
    );
\LocY_int_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(3),
      Q => LocY_int(3)
    );
\LocY_int_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(4),
      Q => LocY_int(4)
    );
\LocY_int_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(5),
      Q => LocY_int(5)
    );
\LocY_int_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(6),
      Q => LocY_int(6)
    );
\LocY_int_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_2(0),
      CLR => reset,
      D => D(7),
      Q => LocY_int(7)
    );
\LocY_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(0),
      Q => LocY_reg(0)
    );
\LocY_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(1),
      Q => LocY_reg(1)
    );
\LocY_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(2),
      Q => LocY_reg(2)
    );
\LocY_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(3),
      Q => LocY_reg(3)
    );
\LocY_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(4),
      Q => LocY_reg(4)
    );
\LocY_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(5),
      Q => LocY_reg(5)
    );
\LocY_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(6),
      Q => LocY_reg(6)
    );
\LocY_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => LocY_int(7),
      Q => LocY_reg(7)
    );
\MapX_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(0),
      Q => worldmap_addr(0)
    );
\MapX_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(1),
      Q => worldmap_addr(1)
    );
\MapX_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(2),
      Q => worldmap_addr(2)
    );
\MapX_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(3),
      Q => worldmap_addr(3)
    );
\MapX_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(4),
      Q => worldmap_addr(4)
    );
\MapX_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(5),
      Q => worldmap_addr(5)
    );
\MapX_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_5(0),
      CLR => reset,
      D => D(6),
      Q => worldmap_addr(6)
    );
\MapY_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(0),
      Q => worldmap_addr(7)
    );
\MapY_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(1),
      Q => worldmap_addr(8)
    );
\MapY_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(2),
      Q => worldmap_addr(9)
    );
\MapY_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(3),
      Q => worldmap_addr(10)
    );
\MapY_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(4),
      Q => worldmap_addr(11)
    );
\MapY_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(5),
      Q => worldmap_addr(12)
    );
\MapY_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_6(0),
      CLR => reset,
      D => D(6),
      Q => worldmap_addr(13)
    );
\Sensors_int_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(0),
      Q => \^q\(0)
    );
\Sensors_int_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(1),
      Q => \^q\(1)
    );
\Sensors_int_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(2),
      Q => \^q\(2)
    );
\Sensors_int_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(3),
      Q => \^q\(3)
    );
\Sensors_int_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(4),
      Q => \^q\(4)
    );
\Sensors_int_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(5),
      Q => \^q\(5)
    );
\Sensors_int_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(6),
      Q => \^q\(6)
    );
\Sensors_int_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => write_strobe_flop_4(0),
      CLR => reset,
      D => D(7),
      Q => \^q\(7)
    );
\Sensors_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(0),
      Q => Sensors_reg(0)
    );
\Sensors_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(1),
      Q => Sensors_reg(1)
    );
\Sensors_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(2),
      Q => Sensors_reg(2)
    );
\Sensors_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(3),
      Q => Sensors_reg(3)
    );
\Sensors_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(4),
      Q => Sensors_reg(4)
    );
\Sensors_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(5),
      Q => Sensors_reg(5)
    );
\Sensors_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(6),
      Q => Sensors_reg(6)
    );
\Sensors_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => \^e\(0),
      CLR => reset,
      D => \^q\(7),
      Q => Sensors_reg(7)
    );
load_sys_regs_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => '1',
      CLR => reset,
      D => write_strobe_flop,
      Q => \^e\(0)
    );
upd_sysregs_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_in,
      CE => '1',
      CLR => reset,
      D => write_strobe_flop_0,
      Q => upd_sysregs
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rojobot31_0_bot31_pgm is
  port (
    instruction : out STD_LOGIC_VECTOR ( 17 downto 0 );
    clk_in : in STD_LOGIC;
    bram_enable : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of rojobot31_0_bot31_pgm : entity is "bot31_pgm";
end rojobot31_0_bot31_pgm;

architecture STRUCTURE of rojobot31_0_bot31_pgm is
  signal data_in_b : STD_LOGIC_VECTOR ( 17 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of kcpsm6_rom : label is "PRIMITIVE";
begin
kcpsm6_rom: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"5A18618618618280A18618618618218957452AAAA220A008082D748A22802AAA",
      INITP_01 => X"820D82099D67766759DD8025508A1861861861822820DA0DA083683636363428",
      INITP_02 => X"552289249768924976892497689249768924976892497689249768924974820A",
      INITP_03 => X"00B42D8B62D8B62D8B62D25513744DD01555540880A82236222201548D34D345",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"00000000000000000000000000000000000000000000000000000002AAA91800",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"90000199900701AC00281C401D401E001F0200B1006500472004200420042004",
      INIT_01 => X"01F00F00008302E001F02026E01BC800D031E01BC900B03000280E00006001B2",
      INIT_02 => X"DC02DD010A0001900B00010502C001D0200D01E3180019000C100D0000D302E0",
      INIT_03 => X"400E400E400EE042410EA0200200400E00105000D00ED00ED00CD00CDA03DB04",
      INIT_04 => X"E10011CE1001E10011001001E100110010205000A02002105000300F5000400E",
      INIT_05 => X"5000E100114F1001E10011D81001E10011EE1001E10011CC1001E10011CE1001",
      INIT_06 => X"11421001E10011311001E10011201001E10011171000500000371220310F0100",
      INIT_07 => X"013041065000E10011061001E10011751001E10011641001E10011531001E100",
      INIT_08 => X"00406091D50820B00040608DD50420B000406089D50005200410500000371200",
      INIT_09 => X"20B0007E13000100007E1300014060A0D50D20B0007E130001406097D50C20B0",
      INIT_0A => X"004020B0007E13010100007E1301014060AFD50F20B0007E1301014060A6D50E",
      INIT_0B => X"E10011011001E10011111001E10011101001E100111F1001E100110F10105000",
      INIT_0C => X"400E400E310F0100004412105000E10011FF1001E10011F01001E10011F11001",
      INIT_0D => X"D10F060020DF960160DED00F60E5D40400CA07C006D0051004205000400E400E",
      INIT_0E => X"20F5170160F0D10F860020EC160160EBD00F60F2D40820F5071020F5970160E3",
      INIT_0F => X"500001700060500001C000D060FDD00201000270016050000170006020F58710",
      INIT_10 => X"110104000100920191016117DF000700010002C001D05000900A0000D209D108",
      INIT_11 => X"05000100120104000100920211016125DF015000017B06000100110105000100",
      INIT_12 => X"0100120105000100120104000100920111016133DF025000017B060001001101",
      INIT_13 => X"017B06000100120105000100910104000100120111026141DF035000017B0600",
      INIT_14 => X"DF055000017B0600010091010500010091010400010012011101614FDF045000",
      INIT_15 => X"9101616BDF065000017B0600010091010500010092010400010012029101615D",
      INIT_16 => X"0100920191026179DF075000017B060001009201050001009201040001001201",
      INIT_17 => X"40064006400640060070500010FF5000017B0600010092010500010011010400",
      INIT_18 => X"50005008618FD6025010618CD40250186189D50230F86186D701500740064006",
      INIT_19 => X"1105F1301105F1321101F133110050004010310701F0400640064006400600E0",
      INIT_1A => X"01901B00180019005000F131F130311F0100F1321107F1331101D000400EF131",
      INIT_1B => X"B332400E400E4008420E4008410E420E420E420E420E0200310F010050000A00",
      INIT_1C => X"508009200210E1CEC21021D0D200504008100120E1C7C12021C9D10022302130",
      INIT_1D => X"01D91219500061DA910101D51128500061D6900110115000400E400E400E400E",
      INIT_1E => X"930101DE13C8500061E9930101DE1364500061E4930101DE1332500061DF9201",
      INIT_1F => X"0000000000000000500061F893010330130A500061F3940101ED1405500061EE",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"D00ED00E01EDD00CD00CDC02DD014C060CD01D01D004900018FF19FF1C001D00",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000002304",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => address(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => clk_in,
      CLKBWRCLK => '0',
      DIADI(15 downto 2) => B"00000000000000",
      DIADI(1 downto 0) => address(11 downto 10),
      DIBDI(15 downto 0) => data_in_b(15 downto 0),
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => data_in_b(17 downto 16),
      DOADO(15 downto 0) => instruction(15 downto 0),
      DOBDO(15 downto 0) => data_in_b(15 downto 0),
      DOPADOP(1 downto 0) => instruction(17 downto 16),
      DOPBDOP(1 downto 0) => data_in_b(17 downto 16),
      ENARDEN => bram_enable,
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rojobot31_0_kcpsm6 is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \data_path_loop[4].small_spm.spm_flop_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \LocY_int_reg[7]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \BotInfo_int_reg[7]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \Sensors_int_reg[7]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \MapX_reg[6]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \MapY_reg[6]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    load_sys_regs_reg : out STD_LOGIC;
    upd_sysregs_reg : out STD_LOGIC;
    bram_enable : out STD_LOGIC;
    address : out STD_LOGIC_VECTOR ( 11 downto 0 );
    out_port : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \BotInfo_int_reg[2]\ : in STD_LOGIC;
    \BotInfo_int_reg[6]\ : in STD_LOGIC;
    \BotInfo_int_reg[0]\ : in STD_LOGIC;
    Bot_Config_reg : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    worldmap_data : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \BotInfo_int_reg[5]\ : in STD_LOGIC;
    \BotInfo_int_reg[7]_0\ : in STD_LOGIC;
    \BotInfo_int_reg[3]\ : in STD_LOGIC;
    \BotInfo_int_reg[1]\ : in STD_LOGIC;
    \BotInfo_int_reg[4]\ : in STD_LOGIC;
    load_sys_regs_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    upd_sysregs : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk_in : in STD_LOGIC;
    instruction : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \DataOut_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of rojobot31_0_kcpsm6 : entity is "kcpsm6";
end rojobot31_0_kcpsm6;

architecture STRUCTURE of rojobot31_0_kcpsm6 is
  signal \DataOut[0]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[0]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_2_n_0\ : STD_LOGIC;
  signal active_interrupt : STD_LOGIC;
  signal active_interrupt_value : STD_LOGIC;
  signal \^address\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal alu_mux_sel_0 : STD_LOGIC;
  signal alu_mux_sel_1 : STD_LOGIC;
  signal alu_mux_sel_value_0 : STD_LOGIC;
  signal alu_mux_sel_value_1 : STD_LOGIC;
  signal alu_result_0 : STD_LOGIC;
  signal alu_result_1 : STD_LOGIC;
  signal alu_result_2 : STD_LOGIC;
  signal alu_result_3 : STD_LOGIC;
  signal alu_result_4 : STD_LOGIC;
  signal alu_result_5 : STD_LOGIC;
  signal alu_result_6 : STD_LOGIC;
  signal alu_result_7 : STD_LOGIC;
  signal arith_carry : STD_LOGIC;
  signal arith_carry_in : STD_LOGIC;
  signal arith_carry_value : STD_LOGIC;
  signal arith_logical_result_0 : STD_LOGIC;
  signal arith_logical_result_1 : STD_LOGIC;
  signal arith_logical_result_2 : STD_LOGIC;
  signal arith_logical_result_3 : STD_LOGIC;
  signal arith_logical_result_4 : STD_LOGIC;
  signal arith_logical_result_5 : STD_LOGIC;
  signal arith_logical_result_6 : STD_LOGIC;
  signal arith_logical_result_7 : STD_LOGIC;
  signal arith_logical_sel_0 : STD_LOGIC;
  signal arith_logical_value_0 : STD_LOGIC;
  signal arith_logical_value_1 : STD_LOGIC;
  signal arith_logical_value_2 : STD_LOGIC;
  signal arith_logical_value_3 : STD_LOGIC;
  signal arith_logical_value_4 : STD_LOGIC;
  signal arith_logical_value_5 : STD_LOGIC;
  signal arith_logical_value_6 : STD_LOGIC;
  signal arith_logical_value_7 : STD_LOGIC;
  signal bank : STD_LOGIC;
  signal bank_value : STD_LOGIC;
  signal \^bram_enable\ : STD_LOGIC;
  signal carry_arith_logical_0 : STD_LOGIC;
  signal carry_arith_logical_1 : STD_LOGIC;
  signal carry_arith_logical_2 : STD_LOGIC;
  signal carry_arith_logical_3 : STD_LOGIC;
  signal carry_arith_logical_4 : STD_LOGIC;
  signal carry_arith_logical_5 : STD_LOGIC;
  signal carry_arith_logical_6 : STD_LOGIC;
  signal carry_arith_logical_7 : STD_LOGIC;
  signal carry_flag : STD_LOGIC;
  signal carry_flag_value : STD_LOGIC;
  signal carry_in_zero : STD_LOGIC;
  signal carry_lower_parity : STD_LOGIC;
  signal carry_lower_zero : STD_LOGIC;
  signal carry_middle_zero : STD_LOGIC;
  signal carry_pc_0 : STD_LOGIC;
  signal carry_pc_1 : STD_LOGIC;
  signal carry_pc_10 : STD_LOGIC;
  signal carry_pc_2 : STD_LOGIC;
  signal carry_pc_3 : STD_LOGIC;
  signal carry_pc_4 : STD_LOGIC;
  signal carry_pc_5 : STD_LOGIC;
  signal carry_pc_6 : STD_LOGIC;
  signal carry_pc_7 : STD_LOGIC;
  signal carry_pc_8 : STD_LOGIC;
  signal carry_pc_9 : STD_LOGIC;
  signal \^data_path_loop[4].small_spm.spm_flop_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal drive_carry_in_zero : STD_LOGIC;
  signal feed_pointer_value_0 : STD_LOGIC;
  signal feed_pointer_value_1 : STD_LOGIC;
  signal feed_pointer_value_2 : STD_LOGIC;
  signal feed_pointer_value_3 : STD_LOGIC;
  signal feed_pointer_value_4 : STD_LOGIC;
  signal flag_enable : STD_LOGIC;
  signal flag_enable_type : STD_LOGIC;
  signal flag_enable_value : STD_LOGIC;
  signal half_arith_logical_0 : STD_LOGIC;
  signal half_arith_logical_1 : STD_LOGIC;
  signal half_arith_logical_2 : STD_LOGIC;
  signal half_arith_logical_3 : STD_LOGIC;
  signal half_arith_logical_4 : STD_LOGIC;
  signal half_arith_logical_5 : STD_LOGIC;
  signal half_arith_logical_6 : STD_LOGIC;
  signal half_arith_logical_7 : STD_LOGIC;
  signal half_pc_0 : STD_LOGIC;
  signal half_pc_1 : STD_LOGIC;
  signal half_pc_10 : STD_LOGIC;
  signal half_pc_11 : STD_LOGIC;
  signal half_pc_2 : STD_LOGIC;
  signal half_pc_3 : STD_LOGIC;
  signal half_pc_4 : STD_LOGIC;
  signal half_pc_5 : STD_LOGIC;
  signal half_pc_6 : STD_LOGIC;
  signal half_pc_7 : STD_LOGIC;
  signal half_pc_8 : STD_LOGIC;
  signal half_pc_9 : STD_LOGIC;
  signal half_pointer_value_0 : STD_LOGIC;
  signal half_pointer_value_1 : STD_LOGIC;
  signal half_pointer_value_2 : STD_LOGIC;
  signal half_pointer_value_3 : STD_LOGIC;
  signal half_pointer_value_4 : STD_LOGIC;
  signal int_enable_type : STD_LOGIC;
  signal internal_reset : STD_LOGIC;
  signal internal_reset_value : STD_LOGIC;
  signal interrupt_enable : STD_LOGIC;
  signal interrupt_enable_value : STD_LOGIC;
  signal k_write_strobe_value : STD_LOGIC;
  signal loadstar_type : STD_LOGIC;
  signal logical_carry_mask_0 : STD_LOGIC;
  signal logical_carry_mask_1 : STD_LOGIC;
  signal logical_carry_mask_2 : STD_LOGIC;
  signal logical_carry_mask_3 : STD_LOGIC;
  signal logical_carry_mask_4 : STD_LOGIC;
  signal logical_carry_mask_5 : STD_LOGIC;
  signal logical_carry_mask_6 : STD_LOGIC;
  signal logical_carry_mask_7 : STD_LOGIC;
  signal lower_parity : STD_LOGIC;
  signal lower_parity_sel : STD_LOGIC;
  signal lower_zero : STD_LOGIC;
  signal lower_zero_sel : STD_LOGIC;
  signal middle_zero : STD_LOGIC;
  signal middle_zero_sel : STD_LOGIC;
  signal move_type : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_7_in : STD_LOGIC;
  signal parity : STD_LOGIC;
  signal pc_move_is_valid : STD_LOGIC;
  signal pc_value_0 : STD_LOGIC;
  signal pc_value_1 : STD_LOGIC;
  signal pc_value_10 : STD_LOGIC;
  signal pc_value_11 : STD_LOGIC;
  signal pc_value_2 : STD_LOGIC;
  signal pc_value_3 : STD_LOGIC;
  signal pc_value_4 : STD_LOGIC;
  signal pc_value_5 : STD_LOGIC;
  signal pc_value_6 : STD_LOGIC;
  signal pc_value_7 : STD_LOGIC;
  signal pc_value_8 : STD_LOGIC;
  signal pc_value_9 : STD_LOGIC;
  signal pc_vector_0 : STD_LOGIC;
  signal pc_vector_1 : STD_LOGIC;
  signal pc_vector_10 : STD_LOGIC;
  signal pc_vector_11 : STD_LOGIC;
  signal pc_vector_2 : STD_LOGIC;
  signal pc_vector_3 : STD_LOGIC;
  signal pc_vector_4 : STD_LOGIC;
  signal pc_vector_5 : STD_LOGIC;
  signal pc_vector_6 : STD_LOGIC;
  signal pc_vector_7 : STD_LOGIC;
  signal pc_vector_8 : STD_LOGIC;
  signal pc_vector_9 : STD_LOGIC;
  signal pop_stack : STD_LOGIC;
  signal port_id : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal push_stack : STD_LOGIC;
  signal read_strobe_value : STD_LOGIC;
  signal regbank_type : STD_LOGIC;
  signal register_enable : STD_LOGIC;
  signal register_enable_type : STD_LOGIC;
  signal register_enable_value : STD_LOGIC;
  signal register_vector : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal return_vector_0 : STD_LOGIC;
  signal return_vector_1 : STD_LOGIC;
  signal return_vector_10 : STD_LOGIC;
  signal return_vector_11 : STD_LOGIC;
  signal return_vector_2 : STD_LOGIC;
  signal return_vector_3 : STD_LOGIC;
  signal return_vector_4 : STD_LOGIC;
  signal return_vector_5 : STD_LOGIC;
  signal return_vector_6 : STD_LOGIC;
  signal return_vector_7 : STD_LOGIC;
  signal return_vector_8 : STD_LOGIC;
  signal return_vector_9 : STD_LOGIC;
  signal returni_type : STD_LOGIC;
  signal run : STD_LOGIC;
  signal run_value : STD_LOGIC;
  signal shadow_bank : STD_LOGIC;
  signal shadow_carry_flag : STD_LOGIC;
  signal shadow_zero_flag : STD_LOGIC;
  signal shadow_zero_value : STD_LOGIC;
  signal shift_carry : STD_LOGIC;
  signal shift_carry_value : STD_LOGIC;
  signal shift_in_bit : STD_LOGIC;
  signal shift_rotate_result_0 : STD_LOGIC;
  signal shift_rotate_result_1 : STD_LOGIC;
  signal shift_rotate_result_2 : STD_LOGIC;
  signal shift_rotate_result_3 : STD_LOGIC;
  signal shift_rotate_result_4 : STD_LOGIC;
  signal shift_rotate_result_5 : STD_LOGIC;
  signal shift_rotate_result_6 : STD_LOGIC;
  signal shift_rotate_result_7 : STD_LOGIC;
  signal shift_rotate_value_0 : STD_LOGIC;
  signal shift_rotate_value_1 : STD_LOGIC;
  signal shift_rotate_value_2 : STD_LOGIC;
  signal shift_rotate_value_3 : STD_LOGIC;
  signal shift_rotate_value_4 : STD_LOGIC;
  signal shift_rotate_value_5 : STD_LOGIC;
  signal shift_rotate_value_6 : STD_LOGIC;
  signal shift_rotate_value_7 : STD_LOGIC;
  signal special_bit : STD_LOGIC;
  signal spm_data_0 : STD_LOGIC;
  signal spm_data_1 : STD_LOGIC;
  signal spm_data_2 : STD_LOGIC;
  signal spm_data_3 : STD_LOGIC;
  signal spm_data_4 : STD_LOGIC;
  signal spm_data_5 : STD_LOGIC;
  signal spm_data_6 : STD_LOGIC;
  signal spm_data_7 : STD_LOGIC;
  signal spm_enable : STD_LOGIC;
  signal spm_enable_value : STD_LOGIC;
  signal spm_ram_data_0 : STD_LOGIC;
  signal spm_ram_data_1 : STD_LOGIC;
  signal spm_ram_data_2 : STD_LOGIC;
  signal spm_ram_data_3 : STD_LOGIC;
  signal spm_ram_data_4 : STD_LOGIC;
  signal spm_ram_data_5 : STD_LOGIC;
  signal spm_ram_data_6 : STD_LOGIC;
  signal spm_ram_data_7 : STD_LOGIC;
  signal stack_bank : STD_LOGIC;
  signal stack_bit : STD_LOGIC;
  signal stack_carry_flag : STD_LOGIC;
  signal stack_memory : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal stack_pointer : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal stack_pointer_carry_0 : STD_LOGIC;
  signal stack_pointer_carry_1 : STD_LOGIC;
  signal stack_pointer_carry_2 : STD_LOGIC;
  signal stack_pointer_carry_3 : STD_LOGIC;
  signal stack_pointer_carry_4 : STD_LOGIC;
  signal stack_pointer_value_0 : STD_LOGIC;
  signal stack_pointer_value_1 : STD_LOGIC;
  signal stack_pointer_value_2 : STD_LOGIC;
  signal stack_pointer_value_3 : STD_LOGIC;
  signal stack_pointer_value_4 : STD_LOGIC;
  signal stack_zero_flag : STD_LOGIC;
  signal strobe_type : STD_LOGIC;
  signal sx_addr : STD_LOGIC_VECTOR ( 4 to 4 );
  signal sx_addr4_value : STD_LOGIC;
  signal t_state_0 : STD_LOGIC;
  signal t_state_value_0 : STD_LOGIC;
  signal t_state_value_1 : STD_LOGIC;
  signal upper_parity : STD_LOGIC;
  signal upper_reg_banks_n_2 : STD_LOGIC;
  signal upper_reg_banks_n_3 : STD_LOGIC;
  signal upper_reg_banks_n_7 : STD_LOGIC;
  signal upper_zero_sel : STD_LOGIC;
  signal use_zero_flag : STD_LOGIC;
  signal use_zero_flag_value : STD_LOGIC;
  signal write_strobe : STD_LOGIC;
  signal write_strobe_value : STD_LOGIC;
  signal zero_flag : STD_LOGIC;
  signal zero_flag_value : STD_LOGIC;
  signal \NLW_address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_arith_carry_xorcy_CARRY4_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_arith_carry_xorcy_CARRY4_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_arith_carry_xorcy_CARRY4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_arith_carry_xorcy_CARRY4_S_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_init_zero_muxcy_CARRY4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_parity_muxcy_CARRY4_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_parity_muxcy_CARRY4_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_parity_muxcy_CARRY4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_parity_muxcy_CARRY4_S_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BotInfo_int[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \DataOut[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \DataOut[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \LocX_int[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \LocY_int[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \MapX[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \MapY[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Sensors_int[7]_i_1\ : label is "soft_lutpair1";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of active_interrupt_flop : label is "PRIMITIVE";
  attribute HBLKNM : string;
  attribute HBLKNM of active_interrupt_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of active_interrupt_flop : label is "FD";
  attribute BOX_TYPE of active_interrupt_lut : label is "PRIMITIVE";
  attribute HBLKNM of active_interrupt_lut : label is "kcpsm6_control";
  attribute BOX_TYPE of \address_loop[0].lsb_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[0].lsb_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[0].lsb_pc.pc_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[0].lsb_pc.pc_muxcy_CARRY4\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute XILINX_LEGACY_PRIM of \address_loop[0].lsb_pc.pc_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \address_loop[0].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[0].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110000";
  attribute BOX_TYPE of \address_loop[0].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[0].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[0].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[0].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110000";
  attribute XILINX_LEGACY_PRIM of \address_loop[0].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[10].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[10].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110001";
  attribute BOX_TYPE of \address_loop[10].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[10].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[10].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[10].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[10].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[10].upper_pc.low_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[10].upper_pc.low_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[11].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[11].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[11].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[11].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[11].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[11].upper_pc.low_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[11].upper_pc.low_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[1].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[1].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[1].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[1].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110000";
  attribute XILINX_LEGACY_PRIM of \address_loop[1].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[1].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[1].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[2].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[2].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110000";
  attribute BOX_TYPE of \address_loop[2].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[2].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[2].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[2].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110000";
  attribute XILINX_LEGACY_PRIM of \address_loop[2].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[2].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[2].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[3].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[3].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[3].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[3].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110000";
  attribute XILINX_LEGACY_PRIM of \address_loop[3].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[3].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[3].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110000";
  attribute BOX_TYPE of \address_loop[4].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[4].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110000";
  attribute BOX_TYPE of \address_loop[4].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[4].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[4].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[4].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[4].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[4].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[4].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[4].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[4].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[4].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \address_loop[5].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[5].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[5].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[5].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[5].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[5].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[5].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[6].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[6].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110000";
  attribute BOX_TYPE of \address_loop[6].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[6].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[6].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[6].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[6].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[6].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[6].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[7].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[7].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[7].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[7].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[7].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[7].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[7].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110001";
  attribute BOX_TYPE of \address_loop[8].output_data.pc_vector_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[8].output_data.pc_vector_mux_lut\ : label is "112'b0110101101100011011100000111001101101101001101100101111101110110011001010110001101110100011011110111001000110001";
  attribute BOX_TYPE of \address_loop[8].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[8].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[8].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[8].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[8].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[8].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[8].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute XILINX_LEGACY_PRIM of \address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \address_loop[9].pc_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[9].pc_flop\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of \address_loop[9].return_vector_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[9].return_vector_flop\ : label is "136'b0110101101100011011100000111001101101101001101100101111101110011011101000110000101100011011010110101111101110010011000010110110100110001";
  attribute XILINX_LEGACY_PRIM of \address_loop[9].return_vector_flop\ : label is "FD";
  attribute BOX_TYPE of \address_loop[9].upper_pc.high_int_vector.pc_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \address_loop[9].upper_pc.high_int_vector.pc_lut\ : label is "80'b01101011011000110111000001110011011011010011011001011111011100000110001100110010";
  attribute BOX_TYPE of alu_decode0_lut : label is "PRIMITIVE";
  attribute HBLKNM of alu_decode0_lut : label is "kcpsm6_decode2";
  attribute BOX_TYPE of alu_decode1_lut : label is "PRIMITIVE";
  attribute HBLKNM of alu_decode1_lut : label is "kcpsm6_decode1";
  attribute BOX_TYPE of alu_decode2_lut : label is "PRIMITIVE";
  attribute HBLKNM of alu_decode2_lut : label is "kcpsm6_decode2";
  attribute BOX_TYPE of alu_mux_sel0_flop : label is "PRIMITIVE";
  attribute HBLKNM of alu_mux_sel0_flop : label is "kcpsm6_decode2";
  attribute XILINX_LEGACY_PRIM of alu_mux_sel0_flop : label is "FD";
  attribute BOX_TYPE of alu_mux_sel1_flop : label is "PRIMITIVE";
  attribute HBLKNM of alu_mux_sel1_flop : label is "kcpsm6_decode1";
  attribute XILINX_LEGACY_PRIM of alu_mux_sel1_flop : label is "FD";
  attribute BOX_TYPE of arith_carry_flop : label is "PRIMITIVE";
  attribute HBLKNM of arith_carry_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of arith_carry_flop : label is "FD";
  attribute BOX_TYPE of arith_carry_xorcy_CARRY4 : label is "PRIMITIVE";
  attribute HBLKNM of arith_carry_xorcy_CARRY4 : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of arith_carry_xorcy_CARRY4 : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of bank_flop : label is "PRIMITIVE";
  attribute HBLKNM of bank_flop : label is "kcpsm6_stack1";
  attribute XILINX_LEGACY_PRIM of bank_flop : label is "FDR";
  attribute BOX_TYPE of bank_lut : label is "PRIMITIVE";
  attribute HBLKNM of bank_lut : label is "kcpsm6_stack1";
  attribute BOX_TYPE of carry_flag_flop : label is "PRIMITIVE";
  attribute HBLKNM of carry_flag_flop : label is "kcpsm6_flags";
  attribute BOX_TYPE of carry_flag_lut : label is "PRIMITIVE";
  attribute HBLKNM of carry_flag_lut : label is "kcpsm6_flags";
  attribute BOX_TYPE of \data_path_loop[0].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110000";
  attribute BOX_TYPE of \data_path_loop[0].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[0].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[0].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute BOX_TYPE of \data_path_loop[0].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[0].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[0].lsb_arith_logical.arith_logical_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].lsb_arith_logical.arith_logical_muxcy_CARRY4\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[0].lsb_arith_logical.arith_logical_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \data_path_loop[0].lsb_shift_rotate.shift_bit_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].lsb_shift_rotate.shift_bit_lut\ : label is "kcpsm6_decode1";
  attribute BOX_TYPE of \data_path_loop[0].lsb_shift_rotate.shift_rotate_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].lsb_shift_rotate.shift_rotate_lut\ : label is "kcpsm6_sandr";
  attribute BOX_TYPE of \data_path_loop[0].output_data.sy_kk_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].output_data.sy_kk_mux_lut\ : label is "kcpsm6_port_id";
  attribute BOX_TYPE of \data_path_loop[0].second_operand.out_port_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].second_operand.out_port_lut\ : label is "kcpsm6_out_port";
  attribute BOX_TYPE of \data_path_loop[0].small_spm.small_spm_ram.spm_ram\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \data_path_loop[0].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[0].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[0].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[1].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[1].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110000";
  attribute BOX_TYPE of \data_path_loop[1].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[1].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[1].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[1].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[1].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute BOX_TYPE of \data_path_loop[1].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[1].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[1].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[1].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[1].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[1].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[2].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110000";
  attribute BOX_TYPE of \data_path_loop[2].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[2].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[2].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute BOX_TYPE of \data_path_loop[2].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[2].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[2].mid_shift_rotate.shift_rotate_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].mid_shift_rotate.shift_rotate_lut\ : label is "kcpsm6_sandr";
  attribute BOX_TYPE of \data_path_loop[2].output_data.sy_kk_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].output_data.sy_kk_mux_lut\ : label is "kcpsm6_port_id";
  attribute BOX_TYPE of \data_path_loop[2].second_operand.out_port_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].second_operand.out_port_lut\ : label is "kcpsm6_out_port";
  attribute BOX_TYPE of \data_path_loop[2].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[2].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[2].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[3].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[3].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110000";
  attribute BOX_TYPE of \data_path_loop[3].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[3].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[3].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[3].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[3].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110000";
  attribute BOX_TYPE of \data_path_loop[3].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[3].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[3].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[3].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[3].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110000";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[3].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[4].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110001";
  attribute BOX_TYPE of \data_path_loop[4].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[4].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[4].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute BOX_TYPE of \data_path_loop[4].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[4].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[4].mid_shift_rotate.shift_rotate_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].mid_shift_rotate.shift_rotate_lut\ : label is "kcpsm6_sandr";
  attribute BOX_TYPE of \data_path_loop[4].output_data.sy_kk_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].output_data.sy_kk_mux_lut\ : label is "kcpsm6_port_id";
  attribute BOX_TYPE of \data_path_loop[4].second_operand.out_port_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].second_operand.out_port_lut\ : label is "kcpsm6_out_port";
  attribute BOX_TYPE of \data_path_loop[4].small_spm.small_spm_ram.spm_ram\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \data_path_loop[4].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[4].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[4].upper_arith_logical.arith_logical_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[4].upper_arith_logical.arith_logical_muxcy_CARRY4\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[4].upper_arith_logical.arith_logical_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \data_path_loop[5].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[5].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110001";
  attribute BOX_TYPE of \data_path_loop[5].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[5].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[5].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[5].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[5].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute BOX_TYPE of \data_path_loop[5].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[5].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[5].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[5].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[5].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[5].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[6].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110001";
  attribute BOX_TYPE of \data_path_loop[6].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[6].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[6].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute BOX_TYPE of \data_path_loop[6].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[6].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[6].msb_shift_rotate.shift_rotate_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].msb_shift_rotate.shift_rotate_lut\ : label is "kcpsm6_sandr";
  attribute BOX_TYPE of \data_path_loop[6].output_data.sy_kk_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].output_data.sy_kk_mux_lut\ : label is "kcpsm6_port_id";
  attribute BOX_TYPE of \data_path_loop[6].second_operand.out_port_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].second_operand.out_port_lut\ : label is "kcpsm6_out_port";
  attribute BOX_TYPE of \data_path_loop[6].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[6].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[6].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[7].alu_mux_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[7].alu_mux_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011011000111010100110001";
  attribute BOX_TYPE of \data_path_loop[7].arith_logical_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[7].arith_logical_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[7].arith_logical_flop\ : label is "FD";
  attribute BOX_TYPE of \data_path_loop[7].arith_logical_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[7].arith_logical_lut\ : label is "88'b0110101101100011011100000111001101101101001101100101111101100001011001000110010000110001";
  attribute BOX_TYPE of \data_path_loop[7].low_hwbuild.shift_rotate_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[7].low_hwbuild.shift_rotate_flop\ : label is "kcpsm6_sandr";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[7].low_hwbuild.shift_rotate_flop\ : label is "FDR";
  attribute BOX_TYPE of \data_path_loop[7].small_spm.spm_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \data_path_loop[7].small_spm.spm_flop\ : label is "88'b0110101101100011011100000111001101101101001101100101111101110011011100000110110100110001";
  attribute XILINX_LEGACY_PRIM of \data_path_loop[7].small_spm.spm_flop\ : label is "FD";
  attribute BOX_TYPE of flag_enable_flop : label is "PRIMITIVE";
  attribute HBLKNM of flag_enable_flop : label is "kcpsm6_strobes";
  attribute XILINX_LEGACY_PRIM of flag_enable_flop : label is "FDR";
  attribute BOX_TYPE of init_zero_muxcy_CARRY4 : label is "PRIMITIVE";
  attribute HBLKNM of init_zero_muxcy_CARRY4 : label is "kcpsm6_flags";
  attribute XILINX_LEGACY_PRIM of init_zero_muxcy_CARRY4 : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of int_enable_type_lut : label is "PRIMITIVE";
  attribute HBLKNM of int_enable_type_lut : label is "kcpsm6_decode0";
  attribute BOX_TYPE of internal_reset_flop : label is "PRIMITIVE";
  attribute HBLKNM of internal_reset_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of internal_reset_flop : label is "FD";
  attribute BOX_TYPE of interrupt_enable_flop : label is "PRIMITIVE";
  attribute HBLKNM of interrupt_enable_flop : label is "kcpsm6_decode0";
  attribute XILINX_LEGACY_PRIM of interrupt_enable_flop : label is "FD";
  attribute BOX_TYPE of interrupt_enable_lut : label is "PRIMITIVE";
  attribute HBLKNM of interrupt_enable_lut : label is "kcpsm6_decode0";
  attribute BOX_TYPE of lower_parity_lut : label is "PRIMITIVE";
  attribute HBLKNM of lower_parity_lut : label is "kcpsm6_decode2";
  attribute BOX_TYPE of lower_reg_banks : label is "PRIMITIVE";
  attribute HBLKNM of lower_reg_banks : label is "kcpsm6_reg0";
  attribute BOX_TYPE of lower_zero_lut : label is "PRIMITIVE";
  attribute HBLKNM of lower_zero_lut : label is "kcpsm6_flags";
  attribute BOX_TYPE of middle_zero_lut : label is "PRIMITIVE";
  attribute HBLKNM of middle_zero_lut : label is "kcpsm6_flags";
  attribute BOX_TYPE of move_type_lut : label is "PRIMITIVE";
  attribute HBLKNM of move_type_lut : label is "kcpsm6_decode0";
  attribute BOX_TYPE of parity_muxcy_CARRY4 : label is "PRIMITIVE";
  attribute HBLKNM of parity_muxcy_CARRY4 : label is "kcpsm6_decode2";
  attribute XILINX_LEGACY_PRIM of parity_muxcy_CARRY4 : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of pc_mode1_lut : label is "PRIMITIVE";
  attribute HBLKNM of pc_mode1_lut : label is "kcpsm6_vector1";
  attribute BOX_TYPE of pc_mode2_lut : label is "PRIMITIVE";
  attribute HBLKNM of pc_mode2_lut : label is "kcpsm6_vector1";
  attribute BOX_TYPE of pc_move_is_valid_lut : label is "PRIMITIVE";
  attribute HBLKNM of pc_move_is_valid_lut : label is "kcpsm6_decode0";
  attribute BOX_TYPE of push_pop_lut : label is "PRIMITIVE";
  attribute HBLKNM of push_pop_lut : label is "kcpsm6_stack1";
  attribute BOX_TYPE of read_strobe_lut : label is "PRIMITIVE";
  attribute HBLKNM of read_strobe_lut : label is "kcpsm6_strobes";
  attribute BOX_TYPE of regbank_type_lut : label is "PRIMITIVE";
  attribute HBLKNM of regbank_type_lut : label is "kcpsm6_stack1";
  attribute BOX_TYPE of register_enable_flop : label is "PRIMITIVE";
  attribute HBLKNM of register_enable_flop : label is "kcpsm6_strobes";
  attribute XILINX_LEGACY_PRIM of register_enable_flop : label is "FDR";
  attribute BOX_TYPE of register_enable_lut : label is "PRIMITIVE";
  attribute HBLKNM of register_enable_lut : label is "kcpsm6_strobes";
  attribute BOX_TYPE of register_enable_type_lut : label is "PRIMITIVE";
  attribute HBLKNM of register_enable_type_lut : label is "kcpsm6_strobes";
  attribute BOX_TYPE of reset_lut : label is "PRIMITIVE";
  attribute HBLKNM of reset_lut : label is "kcpsm6_control";
  attribute BOX_TYPE of run_flop : label is "PRIMITIVE";
  attribute HBLKNM of run_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of run_flop : label is "FD";
  attribute BOX_TYPE of shadow_bank_flop : label is "PRIMITIVE";
  attribute HBLKNM of shadow_bank_flop : label is "kcpsm6_stack_ram0";
  attribute XILINX_LEGACY_PRIM of shadow_bank_flop : label is "FD";
  attribute BOX_TYPE of shadow_carry_flag_flop : label is "PRIMITIVE";
  attribute HBLKNM of shadow_carry_flag_flop : label is "kcpsm6_stack_ram0";
  attribute XILINX_LEGACY_PRIM of shadow_carry_flag_flop : label is "FD";
  attribute BOX_TYPE of shadow_zero_flag_flop : label is "PRIMITIVE";
  attribute HBLKNM of shadow_zero_flag_flop : label is "kcpsm6_decode1";
  attribute XILINX_LEGACY_PRIM of shadow_zero_flag_flop : label is "FD";
  attribute BOX_TYPE of shift_carry_flop : label is "PRIMITIVE";
  attribute HBLKNM of shift_carry_flop : label is "kcpsm6_decode1";
  attribute XILINX_LEGACY_PRIM of shift_carry_flop : label is "FD";
  attribute BOX_TYPE of shift_carry_lut : label is "PRIMITIVE";
  attribute HBLKNM of shift_carry_lut : label is "kcpsm6_decode1";
  attribute BOX_TYPE of spm_enable_flop : label is "PRIMITIVE";
  attribute HBLKNM of spm_enable_flop : label is "kcpsm6_strobes";
  attribute XILINX_LEGACY_PRIM of spm_enable_flop : label is "FDR";
  attribute BOX_TYPE of spm_enable_lut : label is "PRIMITIVE";
  attribute HBLKNM of spm_enable_lut : label is "kcpsm6_strobes";
  attribute BOX_TYPE of stack_bit_flop : label is "PRIMITIVE";
  attribute HBLKNM of stack_bit_flop : label is "kcpsm6_stack_ram0";
  attribute XILINX_LEGACY_PRIM of stack_bit_flop : label is "FD";
  attribute BOX_TYPE of \stack_loop[0].lsb_stack.pointer_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[0].lsb_stack.pointer_flop\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute XILINX_LEGACY_PRIM of \stack_loop[0].lsb_stack.pointer_flop\ : label is "FDR";
  attribute BOX_TYPE of \stack_loop[0].lsb_stack.stack_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[0].lsb_stack.stack_muxcy_CARRY4\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute XILINX_LEGACY_PRIM of \stack_loop[0].lsb_stack.stack_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \stack_loop[0].lsb_stack.stack_pointer_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[0].lsb_stack.stack_pointer_lut\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute BOX_TYPE of \stack_loop[1].upper_stack.pointer_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[1].upper_stack.pointer_flop\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute XILINX_LEGACY_PRIM of \stack_loop[1].upper_stack.pointer_flop\ : label is "FDR";
  attribute BOX_TYPE of \stack_loop[1].upper_stack.stack_pointer_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[1].upper_stack.stack_pointer_lut\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute BOX_TYPE of \stack_loop[2].upper_stack.pointer_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[2].upper_stack.pointer_flop\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute XILINX_LEGACY_PRIM of \stack_loop[2].upper_stack.pointer_flop\ : label is "FDR";
  attribute BOX_TYPE of \stack_loop[2].upper_stack.stack_pointer_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[2].upper_stack.stack_pointer_lut\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute BOX_TYPE of \stack_loop[3].upper_stack.pointer_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[3].upper_stack.pointer_flop\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute XILINX_LEGACY_PRIM of \stack_loop[3].upper_stack.pointer_flop\ : label is "FDR";
  attribute BOX_TYPE of \stack_loop[3].upper_stack.stack_pointer_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[3].upper_stack.stack_pointer_lut\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110000";
  attribute BOX_TYPE of \stack_loop[4].upper_stack.pointer_flop\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[4].upper_stack.pointer_flop\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110001";
  attribute XILINX_LEGACY_PRIM of \stack_loop[4].upper_stack.pointer_flop\ : label is "FDR";
  attribute BOX_TYPE of \stack_loop[4].upper_stack.stack_muxcy_CARRY4\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[4].upper_stack.stack_muxcy_CARRY4\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110001";
  attribute XILINX_LEGACY_PRIM of \stack_loop[4].upper_stack.stack_muxcy_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \stack_loop[4].upper_stack.stack_pointer_lut\ : label is "PRIMITIVE";
  attribute HBLKNM of \stack_loop[4].upper_stack.stack_pointer_lut\ : label is "104'b01101011011000110111000001110011011011010011011001011111011100110111010001100001011000110110101100110001";
  attribute BOX_TYPE of stack_ram_high : label is "PRIMITIVE";
  attribute HBLKNM of stack_ram_high : label is "kcpsm6_stack_ram1";
  attribute BOX_TYPE of stack_ram_low : label is "PRIMITIVE";
  attribute HBLKNM of stack_ram_low : label is "kcpsm6_stack_ram0";
  attribute BOX_TYPE of stack_zero_flop : label is "PRIMITIVE";
  attribute HBLKNM of stack_zero_flop : label is "kcpsm6_stack_ram0";
  attribute XILINX_LEGACY_PRIM of stack_zero_flop : label is "FD";
  attribute BOX_TYPE of sx_addr4_flop : label is "PRIMITIVE";
  attribute HBLKNM of sx_addr4_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of sx_addr4_flop : label is "FD";
  attribute BOX_TYPE of t_state1_flop : label is "PRIMITIVE";
  attribute HBLKNM of t_state1_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of t_state1_flop : label is "FD";
  attribute BOX_TYPE of t_state2_flop : label is "PRIMITIVE";
  attribute HBLKNM of t_state2_flop : label is "kcpsm6_control";
  attribute XILINX_LEGACY_PRIM of t_state2_flop : label is "FD";
  attribute BOX_TYPE of t_state_lut : label is "PRIMITIVE";
  attribute HBLKNM of t_state_lut : label is "kcpsm6_control";
  attribute BOX_TYPE of upper_parity_lut : label is "PRIMITIVE";
  attribute HBLKNM of upper_parity_lut : label is "kcpsm6_decode2";
  attribute BOX_TYPE of upper_reg_banks : label is "PRIMITIVE";
  attribute HBLKNM of upper_reg_banks : label is "kcpsm6_reg1";
  attribute BOX_TYPE of upper_zero_lut : label is "PRIMITIVE";
  attribute HBLKNM of upper_zero_lut : label is "kcpsm6_flags";
  attribute BOX_TYPE of use_zero_flag_flop : label is "PRIMITIVE";
  attribute HBLKNM of use_zero_flag_flop : label is "kcpsm6_decode1";
  attribute XILINX_LEGACY_PRIM of use_zero_flag_flop : label is "FD";
  attribute BOX_TYPE of use_zero_flag_lut : label is "PRIMITIVE";
  attribute HBLKNM of use_zero_flag_lut : label is "kcpsm6_decode1";
  attribute BOX_TYPE of write_strobe_flop : label is "PRIMITIVE";
  attribute HBLKNM of write_strobe_flop : label is "kcpsm6_strobes";
  attribute XILINX_LEGACY_PRIM of write_strobe_flop : label is "FDR";
  attribute BOX_TYPE of zero_flag_flop : label is "PRIMITIVE";
  attribute HBLKNM of zero_flag_flop : label is "kcpsm6_flags";
begin
  address(11 downto 0) <= \^address\(11 downto 0);
  bram_enable <= \^bram_enable\;
  \data_path_loop[4].small_spm.spm_flop_0\(1 downto 0) <= \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0);
\BotInfo_int[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => write_strobe,
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => port_id(2),
      I4 => port_id(3),
      O => \BotInfo_int_reg[7]\(0)
    );
\DataOut[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \DataOut[0]_i_2_n_0\,
      I1 => port_id(3),
      I2 => \DataOut[0]_i_3_n_0\,
      I3 => port_id(2),
      I4 => \BotInfo_int_reg[0]\,
      O => D(0)
    );
\DataOut[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F8"
    )
        port map (
      I0 => worldmap_data(0),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => port_id(2),
      O => \DataOut[0]_i_2_n_0\
    );
\DataOut[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B3B0"
    )
        port map (
      I0 => Bot_Config_reg(0),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => Q(0),
      O => \DataOut[0]_i_3_n_0\
    );
\DataOut[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \DataOut[1]_i_2_n_0\,
      I1 => port_id(3),
      I2 => \DataOut[1]_i_3_n_0\,
      I3 => port_id(2),
      I4 => \BotInfo_int_reg[1]\,
      O => D(1)
    );
\DataOut[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CC08"
    )
        port map (
      I0 => worldmap_data(1),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => port_id(2),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \DataOut[1]_i_2_n_0\
    );
\DataOut[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88FC"
    )
        port map (
      I0 => Bot_Config_reg(1),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => Q(1),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \DataOut[1]_i_3_n_0\
    );
\DataOut[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \BotInfo_int_reg[2]\,
      I1 => port_id(2),
      I2 => \DataOut[2]_i_3_n_0\,
      I3 => port_id(3),
      O => D(2)
    );
\DataOut[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFBC"
    )
        port map (
      I0 => Bot_Config_reg(2),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => Q(2),
      O => \DataOut[2]_i_3_n_0\
    );
\DataOut[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80DFDF8F80D0D0"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I2 => port_id(3),
      I3 => \DataOut[3]_i_2_n_0\,
      I4 => port_id(2),
      I5 => \BotInfo_int_reg[3]\,
      O => D(3)
    );
\DataOut[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8830"
    )
        port map (
      I0 => Bot_Config_reg(3),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => Q(3),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \DataOut[3]_i_2_n_0\
    );
\DataOut[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I1 => port_id(3),
      I2 => \DataOut[4]_i_2_n_0\,
      I3 => port_id(2),
      I4 => \BotInfo_int_reg[4]\,
      O => D(4)
    );
\DataOut[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B3B0"
    )
        port map (
      I0 => Bot_Config_reg(4),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => Q(4),
      O => \DataOut[4]_i_2_n_0\
    );
\DataOut[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F808F8F8F808080"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I2 => port_id(3),
      I3 => \DataOut[5]_i_2_n_0\,
      I4 => port_id(2),
      I5 => \BotInfo_int_reg[5]\,
      O => D(5)
    );
\DataOut[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88FC"
    )
        port map (
      I0 => Bot_Config_reg(5),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => Q(5),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \DataOut[5]_i_2_n_0\
    );
\DataOut[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \BotInfo_int_reg[6]\,
      I1 => port_id(2),
      I2 => \DataOut[6]_i_3_n_0\,
      I3 => port_id(3),
      O => D(6)
    );
\DataOut[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFBC"
    )
        port map (
      I0 => Bot_Config_reg(6),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => Q(6),
      O => \DataOut[6]_i_3_n_0\
    );
\DataOut[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80DFDF8F80D0D0"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I2 => port_id(3),
      I3 => \DataOut[7]_i_2_n_0\,
      I4 => port_id(2),
      I5 => \BotInfo_int_reg[7]_0\,
      O => D(7)
    );
\DataOut[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8830"
    )
        port map (
      I0 => Bot_Config_reg(7),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => Q(7),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \DataOut[7]_i_2_n_0\
    );
\LocX_int[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => write_strobe,
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => port_id(2),
      I4 => port_id(3),
      O => E(0)
    );
\LocY_int[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => write_strobe,
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I3 => port_id(2),
      I4 => port_id(3),
      O => \LocY_int_reg[7]\(0)
    );
\MapX[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => write_strobe,
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => port_id(3),
      I3 => port_id(2),
      I4 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O => \MapX_reg[6]\(0)
    );
\MapY[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => write_strobe,
      I1 => port_id(3),
      I2 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I3 => port_id(2),
      I4 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      O => \MapY_reg[6]\(0)
    );
\Sensors_int[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => write_strobe,
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => port_id(2),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I4 => port_id(3),
      O => \Sensors_int_reg[7]\(0)
    );
active_interrupt_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => active_interrupt_value,
      Q => active_interrupt,
      R => '0'
    );
active_interrupt_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"CC33FF0080808080"
    )
        port map (
      I0 => interrupt_enable,
      I1 => \^bram_enable\,
      I2 => '0',
      I3 => bank,
      I4 => loadstar_type,
      I5 => '1',
      O5 => active_interrupt_value,
      O6 => sx_addr4_value
    );
\address_loop[0].lsb_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FF33CC0F00"
    )
        port map (
      I0 => register_vector(0),
      I1 => pc_vector_0,
      I2 => \^address\(0),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_0
    );
\address_loop[0].lsb_pc.pc_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => carry_pc_3,
      CO(2) => carry_pc_2,
      CO(1) => carry_pc_1,
      CO(0) => carry_pc_0,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => p_0_in,
      O(3) => pc_value_3,
      O(2) => pc_value_2,
      O(1) => pc_value_1,
      O(0) => pc_value_0,
      S(3) => half_pc_3,
      S(2) => half_pc_2,
      S(1) => half_pc_1,
      S(0) => half_pc_0
    );
\address_loop[0].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(0),
      I1 => return_vector_0,
      I2 => instruction(1),
      I3 => return_vector_1,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_0,
      O6 => pc_vector_1
    );
\address_loop[0].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_0,
      Q => \^address\(0),
      R => internal_reset
    );
\address_loop[0].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(0),
      Q => return_vector_0,
      R => '0'
    );
\address_loop[10].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(10),
      I1 => return_vector_10,
      I2 => instruction(11),
      I3 => return_vector_11,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_10,
      O6 => pc_vector_11
    );
\address_loop[10].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_10,
      Q => \^address\(10),
      R => internal_reset
    );
\address_loop[10].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(10),
      Q => return_vector_10,
      R => '0'
    );
\address_loop[10].upper_pc.low_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA0000CCCCF000"
    )
        port map (
      I0 => register_vector(10),
      I1 => pc_vector_10,
      I2 => \^address\(10),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_10
    );
\address_loop[11].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_11,
      Q => \^address\(11),
      R => internal_reset
    );
\address_loop[11].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(11),
      Q => return_vector_11,
      R => '0'
    );
\address_loop[11].upper_pc.low_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA0000CCCCF000"
    )
        port map (
      I0 => register_vector(11),
      I1 => pc_vector_11,
      I2 => \^address\(11),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_11
    );
\address_loop[1].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_1,
      Q => \^address\(1),
      R => internal_reset
    );
\address_loop[1].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(1),
      Q => return_vector_1,
      R => '0'
    );
\address_loop[1].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(1),
      I1 => pc_vector_1,
      I2 => \^address\(1),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_1
    );
\address_loop[2].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(2),
      I1 => return_vector_2,
      I2 => instruction(3),
      I3 => return_vector_3,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_2,
      O6 => pc_vector_3
    );
\address_loop[2].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_2,
      Q => \^address\(2),
      R => internal_reset
    );
\address_loop[2].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(2),
      Q => return_vector_2,
      R => '0'
    );
\address_loop[2].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(2),
      I1 => pc_vector_2,
      I2 => \^address\(2),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_2
    );
\address_loop[3].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_3,
      Q => \^address\(3),
      R => internal_reset
    );
\address_loop[3].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(3),
      Q => return_vector_3,
      R => '0'
    );
\address_loop[3].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(3),
      I1 => pc_vector_3,
      I2 => \^address\(3),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_3
    );
\address_loop[4].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(4),
      I1 => return_vector_4,
      I2 => instruction(5),
      I3 => return_vector_5,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_4,
      O6 => pc_vector_5
    );
\address_loop[4].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_4,
      Q => \^address\(4),
      R => internal_reset
    );
\address_loop[4].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(4),
      Q => return_vector_4,
      R => '0'
    );
\address_loop[4].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(4),
      I1 => pc_vector_4,
      I2 => \^address\(4),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_4
    );
\address_loop[4].upper_pc.mid_pc.pc_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => carry_pc_3,
      CO(3) => carry_pc_7,
      CO(2) => carry_pc_6,
      CO(1) => carry_pc_5,
      CO(0) => carry_pc_4,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => pc_value_7,
      O(2) => pc_value_6,
      O(1) => pc_value_5,
      O(0) => pc_value_4,
      S(3) => half_pc_7,
      S(2) => half_pc_6,
      S(1) => half_pc_5,
      S(0) => half_pc_4
    );
\address_loop[5].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_5,
      Q => \^address\(5),
      R => internal_reset
    );
\address_loop[5].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(5),
      Q => return_vector_5,
      R => '0'
    );
\address_loop[5].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(5),
      I1 => pc_vector_5,
      I2 => \^address\(5),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_5
    );
\address_loop[6].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(6),
      I1 => return_vector_6,
      I2 => instruction(7),
      I3 => return_vector_7,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_6,
      O6 => pc_vector_7
    );
\address_loop[6].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_6,
      Q => \^address\(6),
      R => internal_reset
    );
\address_loop[6].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(6),
      Q => return_vector_6,
      R => '0'
    );
\address_loop[6].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(6),
      I1 => pc_vector_6,
      I2 => \^address\(6),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_6
    );
\address_loop[7].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_7,
      Q => \^address\(7),
      R => internal_reset
    );
\address_loop[7].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(7),
      Q => return_vector_7,
      R => '0'
    );
\address_loop[7].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(7),
      I1 => pc_vector_7,
      I2 => \^address\(7),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_7
    );
\address_loop[8].output_data.pc_vector_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => instruction(8),
      I1 => return_vector_8,
      I2 => instruction(9),
      I3 => return_vector_9,
      I4 => instruction(12),
      I5 => '1',
      O5 => pc_vector_8,
      O6 => pc_vector_9
    );
\address_loop[8].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_8,
      Q => \^address\(8),
      R => internal_reset
    );
\address_loop[8].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(8),
      Q => return_vector_8,
      R => '0'
    );
\address_loop[8].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(8),
      I1 => pc_vector_8,
      I2 => \^address\(8),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_8
    );
\address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => carry_pc_7,
      CO(3) => \NLW_address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4_CO_UNCONNECTED\(3),
      CO(2) => carry_pc_10,
      CO(1) => carry_pc_9,
      CO(0) => carry_pc_8,
      CYINIT => '0',
      DI(3) => \NLW_address_loop[8].upper_pc.mid_pc.pc_muxcy_CARRY4_DI_UNCONNECTED\(3),
      DI(2 downto 0) => B"000",
      O(3) => pc_value_11,
      O(2) => pc_value_10,
      O(1) => pc_value_9,
      O(0) => pc_value_8,
      S(3) => half_pc_11,
      S(2) => half_pc_10,
      S(1) => half_pc_9,
      S(0) => half_pc_8
    );
\address_loop[9].pc_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => t_state_0,
      D => pc_value_9,
      Q => \^address\(9),
      R => internal_reset
    );
\address_loop[9].return_vector_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_memory(9),
      Q => return_vector_9,
      R => '0'
    );
\address_loop[9].upper_pc.high_int_vector.pc_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00FFCCCCF000"
    )
        port map (
      I0 => register_vector(9),
      I1 => pc_vector_9,
      I2 => \^address\(9),
      I3 => p_0_in,
      I4 => p_1_in,
      I5 => p_2_in,
      O => half_pc_9
    );
alu_decode0_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"03CA000004200000"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(15),
      I3 => instruction(16),
      I4 => '1',
      I5 => '1',
      O5 => alu_mux_sel_value_0,
      O6 => arith_logical_sel_0
    );
alu_decode1_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"7708000000000F00"
    )
        port map (
      I0 => carry_flag,
      I1 => instruction(13),
      I2 => instruction(14),
      I3 => instruction(15),
      I4 => instruction(16),
      I5 => '1',
      O5 => alu_mux_sel_value_1,
      O6 => arith_carry_in
    );
alu_decode2_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"D000000002000000"
    )
        port map (
      I0 => instruction(14),
      I1 => instruction(15),
      I2 => instruction(16),
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O5 => p_3_in,
      O6 => p_4_in
    );
alu_mux_sel0_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => alu_mux_sel_value_0,
      Q => alu_mux_sel_0,
      R => '0'
    );
alu_mux_sel1_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => alu_mux_sel_value_1,
      Q => alu_mux_sel_1,
      R => '0'
    );
arith_carry_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_carry_value,
      Q => arith_carry,
      R => '0'
    );
arith_carry_xorcy_CARRY4: unisim.vcomponents.CARRY4
     port map (
      CI => carry_arith_logical_7,
      CO(3 downto 0) => NLW_arith_carry_xorcy_CARRY4_CO_UNCONNECTED(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => NLW_arith_carry_xorcy_CARRY4_DI_UNCONNECTED(3 downto 0),
      O(3 downto 1) => NLW_arith_carry_xorcy_CARRY4_O_UNCONNECTED(3 downto 1),
      O(0) => arith_carry_value,
      S(3 downto 1) => NLW_arith_carry_xorcy_CARRY4_S_UNCONNECTED(3 downto 1),
      S(0) => '0'
    );
bank_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => bank_value,
      Q => bank,
      R => internal_reset
    );
bank_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACACFF00FF00FF00"
    )
        port map (
      I0 => instruction(0),
      I1 => shadow_bank,
      I2 => instruction(16),
      I3 => bank,
      I4 => regbank_type,
      I5 => t_state_0,
      O => bank_value
    );
carry_flag_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => flag_enable,
      D => carry_flag_value,
      Q => carry_flag,
      R => internal_reset
    );
carry_flag_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"3333AACCF0AA0000"
    )
        port map (
      I0 => shift_carry,
      I1 => arith_carry,
      I2 => parity,
      I3 => instruction(14),
      I4 => instruction(15),
      I5 => instruction(16),
      O5 => drive_carry_in_zero,
      O6 => carry_flag_value
    );
\data_path_loop[0].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_0,
      I1 => shift_rotate_result_0,
      I2 => \DataOut_reg[7]\(0),
      I3 => spm_data_0,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_0
    );
\data_path_loop[0].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_0,
      Q => arith_logical_result_0,
      R => '0'
    );
\data_path_loop[0].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I1 => register_vector(8),
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_0,
      O6 => half_arith_logical_0
    );
\data_path_loop[0].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_0,
      Q => shift_rotate_result_0,
      R => instruction(7)
    );
\data_path_loop[0].lsb_arith_logical.arith_logical_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => carry_arith_logical_3,
      CO(2) => carry_arith_logical_2,
      CO(1) => carry_arith_logical_1,
      CO(0) => carry_arith_logical_0,
      CYINIT => arith_carry_in,
      DI(3) => logical_carry_mask_3,
      DI(2) => logical_carry_mask_2,
      DI(1) => logical_carry_mask_1,
      DI(0) => logical_carry_mask_0,
      O(3) => arith_logical_value_3,
      O(2) => arith_logical_value_2,
      O(1) => arith_logical_value_1,
      O(0) => arith_logical_value_0,
      S(3) => half_arith_logical_3,
      S(2) => half_arith_logical_2,
      S(1) => half_arith_logical_1,
      S(0) => half_arith_logical_0
    );
\data_path_loop[0].lsb_shift_rotate.shift_bit_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBC8F8CB3B08380"
    )
        port map (
      I0 => instruction(0),
      I1 => instruction(1),
      I2 => instruction(2),
      I3 => carry_flag,
      I4 => register_vector(8),
      I5 => p_7_in,
      O => shift_in_bit
    );
\data_path_loop[0].lsb_shift_rotate.shift_rotate_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => shift_in_bit,
      I1 => register_vector(9),
      I2 => register_vector(8),
      I3 => register_vector(10),
      I4 => instruction(3),
      I5 => '1',
      O5 => shift_rotate_value_0,
      O6 => shift_rotate_value_1
    );
\data_path_loop[0].output_data.sy_kk_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(0),
      I1 => instruction(0),
      I2 => register_vector(1),
      I3 => instruction(1),
      I4 => instruction(12),
      I5 => '1',
      O5 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      O6 => \^data_path_loop[4].small_spm.spm_flop_0\(1)
    );
\data_path_loop[0].second_operand.out_port_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(8),
      I1 => instruction(4),
      I2 => register_vector(9),
      I3 => instruction(5),
      I4 => instruction(13),
      I5 => '1',
      O5 => out_port(0),
      O6 => out_port(1)
    );
\data_path_loop[0].small_spm.small_spm_ram.spm_ram\: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(5 downto 2) => port_id(5 downto 2),
      ADDRA(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRB(5 downto 2) => port_id(5 downto 2),
      ADDRB(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRC(5 downto 2) => port_id(5 downto 2),
      ADDRC(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRD(5 downto 2) => port_id(5 downto 2),
      ADDRD(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      DIA => register_vector(8),
      DIB => register_vector(9),
      DIC => register_vector(10),
      DID => register_vector(11),
      DOA => spm_ram_data_0,
      DOB => spm_ram_data_1,
      DOC => spm_ram_data_2,
      DOD => spm_ram_data_3,
      WCLK => clk_in,
      WE => spm_enable
    );
\data_path_loop[0].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_0,
      Q => spm_data_0,
      R => '0'
    );
\data_path_loop[1].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_1,
      I1 => shift_rotate_result_1,
      I2 => \DataOut_reg[7]\(1),
      I3 => spm_data_1,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_1
    );
\data_path_loop[1].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_1,
      Q => arith_logical_result_1,
      R => '0'
    );
\data_path_loop[1].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I1 => register_vector(9),
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_1,
      O6 => half_arith_logical_1
    );
\data_path_loop[1].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_1,
      Q => shift_rotate_result_1,
      R => instruction(7)
    );
\data_path_loop[1].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_1,
      Q => spm_data_1,
      R => '0'
    );
\data_path_loop[2].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_2,
      I1 => shift_rotate_result_2,
      I2 => \DataOut_reg[7]\(2),
      I3 => spm_data_2,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_2
    );
\data_path_loop[2].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_2,
      Q => arith_logical_result_2,
      R => '0'
    );
\data_path_loop[2].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(2),
      I1 => register_vector(10),
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_2,
      O6 => half_arith_logical_2
    );
\data_path_loop[2].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_2,
      Q => shift_rotate_result_2,
      R => instruction(7)
    );
\data_path_loop[2].mid_shift_rotate.shift_rotate_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(9),
      I1 => register_vector(11),
      I2 => register_vector(10),
      I3 => upper_reg_banks_n_3,
      I4 => instruction(3),
      I5 => '1',
      O5 => shift_rotate_value_2,
      O6 => shift_rotate_value_3
    );
\data_path_loop[2].output_data.sy_kk_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(2),
      I1 => instruction(2),
      I2 => register_vector(3),
      I3 => instruction(3),
      I4 => instruction(12),
      I5 => '1',
      O5 => port_id(2),
      O6 => port_id(3)
    );
\data_path_loop[2].second_operand.out_port_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(10),
      I1 => instruction(6),
      I2 => register_vector(11),
      I3 => instruction(7),
      I4 => instruction(13),
      I5 => '1',
      O5 => out_port(2),
      O6 => out_port(3)
    );
\data_path_loop[2].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_2,
      Q => spm_data_2,
      R => '0'
    );
\data_path_loop[3].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_3,
      I1 => shift_rotate_result_3,
      I2 => \DataOut_reg[7]\(3),
      I3 => spm_data_3,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_3
    );
\data_path_loop[3].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_3,
      Q => arith_logical_result_3,
      R => '0'
    );
\data_path_loop[3].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(3),
      I1 => register_vector(11),
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_3,
      O6 => half_arith_logical_3
    );
\data_path_loop[3].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_3,
      Q => shift_rotate_result_3,
      R => instruction(7)
    );
\data_path_loop[3].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_3,
      Q => spm_data_3,
      R => '0'
    );
\data_path_loop[4].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_4,
      I1 => shift_rotate_result_4,
      I2 => \DataOut_reg[7]\(4),
      I3 => spm_data_4,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_4
    );
\data_path_loop[4].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_4,
      Q => arith_logical_result_4,
      R => '0'
    );
\data_path_loop[4].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(4),
      I1 => upper_reg_banks_n_3,
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_4,
      O6 => half_arith_logical_4
    );
\data_path_loop[4].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_4,
      Q => shift_rotate_result_4,
      R => instruction(7)
    );
\data_path_loop[4].mid_shift_rotate.shift_rotate_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(11),
      I1 => upper_reg_banks_n_2,
      I2 => upper_reg_banks_n_3,
      I3 => upper_reg_banks_n_7,
      I4 => instruction(3),
      I5 => '1',
      O5 => shift_rotate_value_4,
      O6 => shift_rotate_value_5
    );
\data_path_loop[4].output_data.sy_kk_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(4),
      I1 => instruction(4),
      I2 => register_vector(5),
      I3 => instruction(5),
      I4 => instruction(12),
      I5 => '1',
      O5 => port_id(4),
      O6 => port_id(5)
    );
\data_path_loop[4].second_operand.out_port_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => upper_reg_banks_n_3,
      I1 => instruction(8),
      I2 => upper_reg_banks_n_2,
      I3 => instruction(9),
      I4 => instruction(13),
      I5 => '1',
      O5 => out_port(4),
      O6 => out_port(5)
    );
\data_path_loop[4].small_spm.small_spm_ram.spm_ram\: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(5 downto 2) => port_id(5 downto 2),
      ADDRA(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRB(5 downto 2) => port_id(5 downto 2),
      ADDRB(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRC(5 downto 2) => port_id(5 downto 2),
      ADDRC(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      ADDRD(5 downto 2) => port_id(5 downto 2),
      ADDRD(1 downto 0) => \^data_path_loop[4].small_spm.spm_flop_0\(1 downto 0),
      DIA => upper_reg_banks_n_3,
      DIB => upper_reg_banks_n_2,
      DIC => upper_reg_banks_n_7,
      DID => p_7_in,
      DOA => spm_ram_data_4,
      DOB => spm_ram_data_5,
      DOC => spm_ram_data_6,
      DOD => spm_ram_data_7,
      WCLK => clk_in,
      WE => spm_enable
    );
\data_path_loop[4].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_4,
      Q => spm_data_4,
      R => '0'
    );
\data_path_loop[4].upper_arith_logical.arith_logical_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => carry_arith_logical_3,
      CO(3) => carry_arith_logical_7,
      CO(2) => carry_arith_logical_6,
      CO(1) => carry_arith_logical_5,
      CO(0) => carry_arith_logical_4,
      CYINIT => '0',
      DI(3) => logical_carry_mask_7,
      DI(2) => logical_carry_mask_6,
      DI(1) => logical_carry_mask_5,
      DI(0) => logical_carry_mask_4,
      O(3) => arith_logical_value_7,
      O(2) => arith_logical_value_6,
      O(1) => arith_logical_value_5,
      O(0) => arith_logical_value_4,
      S(3) => half_arith_logical_7,
      S(2) => half_arith_logical_6,
      S(1) => half_arith_logical_5,
      S(0) => half_arith_logical_4
    );
\data_path_loop[5].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_5,
      I1 => shift_rotate_result_5,
      I2 => \DataOut_reg[7]\(5),
      I3 => spm_data_5,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_5
    );
\data_path_loop[5].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_5,
      Q => arith_logical_result_5,
      R => '0'
    );
\data_path_loop[5].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(5),
      I1 => upper_reg_banks_n_2,
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_5,
      O6 => half_arith_logical_5
    );
\data_path_loop[5].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_5,
      Q => shift_rotate_result_5,
      R => instruction(7)
    );
\data_path_loop[5].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_5,
      Q => spm_data_5,
      R => '0'
    );
\data_path_loop[6].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_6,
      I1 => shift_rotate_result_6,
      I2 => \DataOut_reg[7]\(6),
      I3 => spm_data_6,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_6
    );
\data_path_loop[6].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_6,
      Q => arith_logical_result_6,
      R => '0'
    );
\data_path_loop[6].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(6),
      I1 => upper_reg_banks_n_7,
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_6,
      O6 => half_arith_logical_6
    );
\data_path_loop[6].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_6,
      Q => shift_rotate_result_6,
      R => instruction(7)
    );
\data_path_loop[6].msb_shift_rotate.shift_rotate_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => upper_reg_banks_n_2,
      I1 => p_7_in,
      I2 => upper_reg_banks_n_7,
      I3 => shift_in_bit,
      I4 => instruction(3),
      I5 => '1',
      O5 => shift_rotate_value_6,
      O6 => shift_rotate_value_7
    );
\data_path_loop[6].output_data.sy_kk_mux_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => register_vector(6),
      I1 => instruction(6),
      I2 => register_vector(7),
      I3 => instruction(7),
      I4 => instruction(12),
      I5 => '1',
      O5 => port_id(6),
      O6 => port_id(7)
    );
\data_path_loop[6].second_operand.out_port_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => upper_reg_banks_n_7,
      I1 => instruction(10),
      I2 => p_7_in,
      I3 => instruction(11),
      I4 => instruction(13),
      I5 => '1',
      O5 => out_port(6),
      O6 => out_port(7)
    );
\data_path_loop[6].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_6,
      Q => spm_data_6,
      R => '0'
    );
\data_path_loop[7].alu_mux_lut\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F0F0CCCCAAAA"
    )
        port map (
      I0 => arith_logical_result_7,
      I1 => shift_rotate_result_7,
      I2 => \DataOut_reg[7]\(7),
      I3 => spm_data_7,
      I4 => alu_mux_sel_0,
      I5 => alu_mux_sel_1,
      O => alu_result_7
    );
\data_path_loop[7].arith_logical_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => arith_logical_value_7,
      Q => arith_logical_result_7,
      R => '0'
    );
\data_path_loop[7].arith_logical_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"69696E8ACCCC0000"
    )
        port map (
      I0 => port_id(7),
      I1 => p_7_in,
      I2 => arith_logical_sel_0,
      I3 => p_3_in,
      I4 => p_4_in,
      I5 => '1',
      O5 => logical_carry_mask_7,
      O6 => half_arith_logical_7
    );
\data_path_loop[7].low_hwbuild.shift_rotate_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_rotate_value_7,
      Q => shift_rotate_result_7,
      R => instruction(7)
    );
\data_path_loop[7].small_spm.spm_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_ram_data_7,
      Q => spm_data_7,
      R => '0'
    );
flag_enable_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => flag_enable_value,
      Q => flag_enable,
      R => active_interrupt
    );
init_zero_muxcy_CARRY4: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_flag_value,
      CO(2) => carry_middle_zero,
      CO(1) => carry_lower_zero,
      CO(0) => carry_in_zero,
      CYINIT => '0',
      DI(3) => shadow_zero_flag,
      DI(2) => middle_zero,
      DI(1) => lower_zero,
      DI(0) => drive_carry_in_zero,
      O(3 downto 0) => NLW_init_zero_muxcy_CARRY4_O_UNCONNECTED(3 downto 0),
      S(3) => upper_zero_sel,
      S(2) => middle_zero_sel,
      S(1) => lower_zero_sel,
      S(0) => carry_flag_value
    );
int_enable_type_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0010000000000800"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(15),
      I3 => instruction(16),
      I4 => instruction(17),
      I5 => '1',
      O5 => loadstar_type,
      O6 => int_enable_type
    );
internal_reset_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => internal_reset_value,
      Q => internal_reset,
      R => '0'
    );
interrupt_enable_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => interrupt_enable_value,
      Q => interrupt_enable,
      R => '0'
    );
interrupt_enable_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000CAAA"
    )
        port map (
      I0 => interrupt_enable,
      I1 => instruction(0),
      I2 => int_enable_type,
      I3 => t_state_0,
      I4 => active_interrupt,
      I5 => internal_reset,
      O => interrupt_enable_value
    );
load_sys_regs_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF10000000"
    )
        port map (
      I0 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I2 => port_id(3),
      I3 => port_id(2),
      I4 => write_strobe,
      I5 => load_sys_regs_reg_0(0),
      O => load_sys_regs_reg
    );
lower_parity_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0000000087780000"
    )
        port map (
      I0 => instruction(13),
      I1 => carry_flag,
      I2 => arith_logical_result_0,
      I3 => arith_logical_result_1,
      I4 => '1',
      I5 => '1',
      O5 => lower_parity,
      O6 => lower_parity_sel
    );
lower_reg_banks: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4) => bank,
      ADDRA(3 downto 0) => instruction(7 downto 4),
      ADDRB(4) => sx_addr(4),
      ADDRB(3 downto 0) => instruction(11 downto 8),
      ADDRC(4) => bank,
      ADDRC(3 downto 0) => instruction(7 downto 4),
      ADDRD(4) => sx_addr(4),
      ADDRD(3 downto 0) => instruction(11 downto 8),
      DIA(1) => alu_result_1,
      DIA(0) => alu_result_0,
      DIB(1) => alu_result_1,
      DIB(0) => alu_result_0,
      DIC(1) => alu_result_3,
      DIC(0) => alu_result_2,
      DID(1) => alu_result_3,
      DID(0) => alu_result_2,
      DOA(1 downto 0) => register_vector(1 downto 0),
      DOB(1 downto 0) => register_vector(9 downto 8),
      DOC(1 downto 0) => register_vector(3 downto 2),
      DOD(1 downto 0) => register_vector(11 downto 10),
      WCLK => clk_in,
      WE => register_enable
    );
lower_zero_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => alu_result_0,
      I1 => alu_result_1,
      I2 => alu_result_2,
      I3 => alu_result_3,
      I4 => alu_result_4,
      I5 => '1',
      O5 => lower_zero,
      O6 => lower_zero_sel
    );
middle_zero_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0000000D00000000"
    )
        port map (
      I0 => use_zero_flag,
      I1 => zero_flag,
      I2 => alu_result_5,
      I3 => alu_result_6,
      I4 => alu_result_7,
      I5 => '1',
      O5 => middle_zero,
      O6 => middle_zero_sel
    );
move_type_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"7777027700000200"
    )
        port map (
      I0 => instruction(12),
      I1 => instruction(13),
      I2 => instruction(14),
      I3 => instruction(15),
      I4 => instruction(16),
      I5 => '1',
      O5 => returni_type,
      O6 => move_type
    );
parity_muxcy_CARRY4: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 1) => NLW_parity_muxcy_CARRY4_CO_UNCONNECTED(3 downto 1),
      CO(0) => carry_lower_parity,
      CYINIT => '0',
      DI(3 downto 1) => NLW_parity_muxcy_CARRY4_DI_UNCONNECTED(3 downto 1),
      DI(0) => lower_parity,
      O(3 downto 2) => NLW_parity_muxcy_CARRY4_O_UNCONNECTED(3 downto 2),
      O(1) => parity,
      O(0) => NLW_parity_muxcy_CARRY4_O_UNCONNECTED(0),
      S(3 downto 2) => NLW_parity_muxcy_CARRY4_S_UNCONNECTED(3 downto 2),
      S(1) => upper_parity,
      S(0) => lower_parity_sel
    );
pc_mode1_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0000F000000023FF"
    )
        port map (
      I0 => instruction(12),
      I1 => returni_type,
      I2 => move_type,
      I3 => pc_move_is_valid,
      I4 => active_interrupt,
      I5 => '1',
      O5 => p_0_in,
      O6 => p_1_in
    );
pc_mode2_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00040000"
    )
        port map (
      I0 => instruction(12),
      I1 => instruction(14),
      I2 => instruction(15),
      I3 => instruction(16),
      I4 => instruction(17),
      I5 => active_interrupt,
      O => p_2_in
    );
pc_move_is_valid_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A3CFFFF00000000"
    )
        port map (
      I0 => carry_flag,
      I1 => zero_flag,
      I2 => instruction(14),
      I3 => instruction(15),
      I4 => instruction(16),
      I5 => instruction(17),
      O => pc_move_is_valid
    );
push_pop_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FFFF100000002000"
    )
        port map (
      I0 => instruction(12),
      I1 => instruction(13),
      I2 => move_type,
      I3 => pc_move_is_valid,
      I4 => active_interrupt,
      I5 => '1',
      O5 => pop_stack,
      O6 => push_stack
    );
read_strobe_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"4000000001000000"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(17),
      I3 => strobe_type,
      I4 => t_state_0,
      I5 => '1',
      O5 => read_strobe_value,
      O6 => write_strobe_value
    );
regbank_type_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080020000000000"
    )
        port map (
      I0 => instruction(12),
      I1 => instruction(13),
      I2 => instruction(14),
      I3 => instruction(15),
      I4 => instruction(16),
      I5 => instruction(17),
      O => regbank_type
    );
register_enable_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => register_enable_value,
      Q => register_enable,
      R => active_interrupt
    );
register_enable_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"C0CC0000A0AA0000"
    )
        port map (
      I0 => flag_enable_type,
      I1 => register_enable_type,
      I2 => instruction(12),
      I3 => instruction(17),
      I4 => t_state_0,
      I5 => '1',
      O5 => flag_enable_value,
      O6 => register_enable_value
    );
register_enable_type_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"00013F3F0010F7CE"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(15),
      I3 => instruction(16),
      I4 => instruction(17),
      I5 => '1',
      O5 => flag_enable_type,
      O6 => register_enable_type
    );
reset_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"FFFFF55500000EEE"
    )
        port map (
      I0 => run,
      I1 => internal_reset,
      I2 => stack_pointer_carry_4,
      I3 => \^bram_enable\,
      I4 => reset,
      I5 => '1',
      O5 => run_value,
      O6 => internal_reset_value
    );
run_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => run_value,
      Q => run,
      R => '0'
    );
shadow_bank_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_bank,
      Q => shadow_bank,
      R => '0'
    );
shadow_carry_flag_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_carry_flag,
      Q => shadow_carry_flag,
      R => '0'
    );
shadow_zero_flag_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shadow_zero_value,
      Q => shadow_zero_flag,
      R => '0'
    );
shift_carry_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => shift_carry_value,
      Q => shift_carry,
      R => '0'
    );
shift_carry_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAACCF0F0F0F0"
    )
        port map (
      I0 => register_vector(8),
      I1 => p_7_in,
      I2 => shadow_carry_flag,
      I3 => instruction(3),
      I4 => instruction(7),
      I5 => instruction(16),
      O => shift_carry_value
    );
spm_enable_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => spm_enable_value,
      Q => spm_enable,
      R => active_interrupt
    );
spm_enable_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"8000000020000000"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(17),
      I3 => strobe_type,
      I4 => t_state_0,
      I5 => '1',
      O5 => k_write_strobe_value,
      O6 => spm_enable_value
    );
stack_bit_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_bit,
      Q => special_bit,
      R => '0'
    );
\stack_loop[0].lsb_stack.pointer_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_pointer_value_0,
      Q => stack_pointer(0),
      R => internal_reset
    );
\stack_loop[0].lsb_stack.stack_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => stack_pointer_carry_3,
      CO(2) => stack_pointer_carry_2,
      CO(1) => stack_pointer_carry_1,
      CO(0) => stack_pointer_carry_0,
      CYINIT => '0',
      DI(3) => feed_pointer_value_3,
      DI(2) => feed_pointer_value_2,
      DI(1) => feed_pointer_value_1,
      DI(0) => feed_pointer_value_0,
      O(3) => stack_pointer_value_3,
      O(2) => stack_pointer_value_2,
      O(1) => stack_pointer_value_1,
      O(0) => stack_pointer_value_0,
      S(3) => half_pointer_value_3,
      S(2) => half_pointer_value_2,
      S(1) => half_pointer_value_1,
      S(0) => half_pointer_value_0
    );
\stack_loop[0].lsb_stack.stack_pointer_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"001529AAAAAAAAAA"
    )
        port map (
      I0 => stack_pointer(0),
      I1 => pop_stack,
      I2 => push_stack,
      I3 => t_state_0,
      I4 => \^bram_enable\,
      I5 => '1',
      O5 => feed_pointer_value_0,
      O6 => half_pointer_value_0
    );
\stack_loop[1].upper_stack.pointer_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_pointer_value_1,
      Q => stack_pointer(1),
      R => internal_reset
    );
\stack_loop[1].upper_stack.stack_pointer_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"002A252AAAAAAAAA"
    )
        port map (
      I0 => stack_pointer(1),
      I1 => pop_stack,
      I2 => push_stack,
      I3 => t_state_0,
      I4 => \^bram_enable\,
      I5 => '1',
      O5 => feed_pointer_value_1,
      O6 => half_pointer_value_1
    );
\stack_loop[2].upper_stack.pointer_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_pointer_value_2,
      Q => stack_pointer(2),
      R => internal_reset
    );
\stack_loop[2].upper_stack.stack_pointer_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"002A252AAAAAAAAA"
    )
        port map (
      I0 => stack_pointer(2),
      I1 => pop_stack,
      I2 => push_stack,
      I3 => t_state_0,
      I4 => \^bram_enable\,
      I5 => '1',
      O5 => feed_pointer_value_2,
      O6 => half_pointer_value_2
    );
\stack_loop[3].upper_stack.pointer_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_pointer_value_3,
      Q => stack_pointer(3),
      R => internal_reset
    );
\stack_loop[3].upper_stack.stack_pointer_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"002A252AAAAAAAAA"
    )
        port map (
      I0 => stack_pointer(3),
      I1 => pop_stack,
      I2 => push_stack,
      I3 => t_state_0,
      I4 => \^bram_enable\,
      I5 => '1',
      O5 => feed_pointer_value_3,
      O6 => half_pointer_value_3
    );
\stack_loop[4].upper_stack.pointer_flop\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_pointer_value_4,
      Q => stack_pointer(4),
      R => internal_reset
    );
\stack_loop[4].upper_stack.stack_muxcy_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => stack_pointer_carry_3,
      CO(3 downto 1) => \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => stack_pointer_carry_4,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => feed_pointer_value_4,
      O(3 downto 1) => \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => stack_pointer_value_4,
      S(3 downto 1) => \NLW_stack_loop[4].upper_stack.stack_muxcy_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => half_pointer_value_4
    );
\stack_loop[4].upper_stack.stack_pointer_lut\: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"002A252AAAAAAAAA"
    )
        port map (
      I0 => stack_pointer(4),
      I1 => pop_stack,
      I2 => push_stack,
      I3 => t_state_0,
      I4 => \^bram_enable\,
      I5 => '1',
      O5 => feed_pointer_value_4,
      O6 => half_pointer_value_4
    );
stack_ram_high: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4 downto 0) => stack_pointer(4 downto 0),
      ADDRB(4 downto 0) => stack_pointer(4 downto 0),
      ADDRC(4 downto 0) => stack_pointer(4 downto 0),
      ADDRD(4 downto 0) => stack_pointer(4 downto 0),
      DIA(1 downto 0) => \^address\(5 downto 4),
      DIB(1 downto 0) => \^address\(7 downto 6),
      DIC(1 downto 0) => \^address\(9 downto 8),
      DID(1 downto 0) => \^address\(11 downto 10),
      DOA(1 downto 0) => stack_memory(5 downto 4),
      DOB(1 downto 0) => stack_memory(7 downto 6),
      DOC(1 downto 0) => stack_memory(9 downto 8),
      DOD(1 downto 0) => stack_memory(11 downto 10),
      WCLK => clk_in,
      WE => t_state_0
    );
stack_ram_low: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4 downto 0) => stack_pointer(4 downto 0),
      ADDRB(4 downto 0) => stack_pointer(4 downto 0),
      ADDRC(4 downto 0) => stack_pointer(4 downto 0),
      ADDRD(4 downto 0) => stack_pointer(4 downto 0),
      DIA(1) => zero_flag,
      DIA(0) => carry_flag,
      DIB(1) => run,
      DIB(0) => bank,
      DIC(1 downto 0) => \^address\(1 downto 0),
      DID(1 downto 0) => \^address\(3 downto 2),
      DOA(1) => stack_zero_flag,
      DOA(0) => stack_carry_flag,
      DOB(1) => stack_bit,
      DOB(0) => stack_bank,
      DOC(1 downto 0) => stack_memory(1 downto 0),
      DOD(1 downto 0) => stack_memory(3 downto 2),
      WCLK => clk_in,
      WE => t_state_0
    );
stack_zero_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => stack_zero_flag,
      Q => shadow_zero_value,
      R => '0'
    );
sx_addr4_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => sx_addr4_value,
      Q => sx_addr(4),
      R => '0'
    );
t_state1_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => t_state_value_0,
      Q => t_state_0,
      R => '0'
    );
t_state2_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => t_state_value_1,
      Q => \^bram_enable\,
      R => '0'
    );
t_state_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"0083000B00C4004C"
    )
        port map (
      I0 => t_state_0,
      I1 => \^bram_enable\,
      I2 => '0',
      I3 => internal_reset,
      I4 => special_bit,
      I5 => '1',
      O5 => t_state_value_0,
      O6 => t_state_value_1
    );
upd_sysregs_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFF20000000"
    )
        port map (
      I0 => port_id(2),
      I1 => \^data_path_loop[4].small_spm.spm_flop_0\(0),
      I2 => port_id(3),
      I3 => \^data_path_loop[4].small_spm.spm_flop_0\(1),
      I4 => write_strobe,
      I5 => upd_sysregs,
      O => upd_sysregs_reg
    );
upper_parity_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => arith_logical_result_2,
      I1 => arith_logical_result_3,
      I2 => arith_logical_result_4,
      I3 => arith_logical_result_5,
      I4 => arith_logical_result_6,
      I5 => arith_logical_result_7,
      O => upper_parity
    );
upper_reg_banks: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      IS_WCLK_INVERTED => '0'
    )
        port map (
      ADDRA(4) => bank,
      ADDRA(3 downto 0) => instruction(7 downto 4),
      ADDRB(4) => sx_addr(4),
      ADDRB(3 downto 0) => instruction(11 downto 8),
      ADDRC(4) => bank,
      ADDRC(3 downto 0) => instruction(7 downto 4),
      ADDRD(4) => sx_addr(4),
      ADDRD(3 downto 0) => instruction(11 downto 8),
      DIA(1) => alu_result_5,
      DIA(0) => alu_result_4,
      DIB(1) => alu_result_5,
      DIB(0) => alu_result_4,
      DIC(1) => alu_result_7,
      DIC(0) => alu_result_6,
      DID(1) => alu_result_7,
      DID(0) => alu_result_6,
      DOA(1 downto 0) => register_vector(5 downto 4),
      DOB(1) => upper_reg_banks_n_2,
      DOB(0) => upper_reg_banks_n_3,
      DOC(1 downto 0) => register_vector(7 downto 6),
      DOD(1) => p_7_in,
      DOD(0) => upper_reg_banks_n_7,
      WCLK => clk_in,
      WE => register_enable
    );
upper_zero_lut: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFF000000000000"
    )
        port map (
      I0 => instruction(14),
      I1 => instruction(15),
      I2 => instruction(16),
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => upper_zero_sel
    );
use_zero_flag_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => use_zero_flag_value,
      Q => use_zero_flag,
      R => '0'
    );
use_zero_flag_lut: unisim.vcomponents.LUT6_2
    generic map(
      INIT => X"A280000000F000F0"
    )
        port map (
      I0 => instruction(13),
      I1 => instruction(14),
      I2 => instruction(15),
      I3 => instruction(16),
      I4 => '1',
      I5 => '1',
      O5 => strobe_type,
      O6 => use_zero_flag_value
    );
write_strobe_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in,
      CE => '1',
      D => write_strobe_value,
      Q => write_strobe,
      R => active_interrupt
    );
zero_flag_flop: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => clk_in,
      CE => flag_enable,
      D => zero_flag_value,
      Q => zero_flag,
      R => internal_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rojobot31_0_rojobot31 is
  port (
    LocX_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LocY_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BotInfo_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Sensors_reg : out STD_LOGIC_VECTOR ( 7 downto 0 );
    worldmap_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    upd_sysregs : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk_in : in STD_LOGIC;
    MotCtl_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Bot_Config_reg : in STD_LOGIC_VECTOR ( 7 downto 0 );
    worldmap_data : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of rojobot31_0_rojobot31 : entity is "rojobot31";
end rojobot31_0_rojobot31;

architecture STRUCTURE of rojobot31_0_rojobot31 is
  signal BOTCPU_n_1 : STD_LOGIC;
  signal BOTCPU_n_14 : STD_LOGIC;
  signal BOTCPU_n_15 : STD_LOGIC;
  signal BOTCPU_n_16 : STD_LOGIC;
  signal BOTCPU_n_17 : STD_LOGIC;
  signal BOTCPU_n_5 : STD_LOGIC;
  signal BOTREGIF_n_2 : STD_LOGIC;
  signal BOTREGIF_n_3 : STD_LOGIC;
  signal BOTREGIF_n_4 : STD_LOGIC;
  signal BOTREGIF_n_5 : STD_LOGIC;
  signal BOTREGIF_n_6 : STD_LOGIC;
  signal BOTREGIF_n_7 : STD_LOGIC;
  signal BOTREGIF_n_8 : STD_LOGIC;
  signal BOTREGIF_n_9 : STD_LOGIC;
  signal BotInfo_int : STD_LOGIC;
  signal DataOut : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal LocX_int : STD_LOGIC;
  signal LocY_int : STD_LOGIC;
  signal Sensors_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Sensors_int_0 : STD_LOGIC;
  signal address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal bram_enable : STD_LOGIC;
  signal in_port : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal instruction : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal load_sys_regs : STD_LOGIC;
  signal out_port : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal port_id : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^upd_sysregs\ : STD_LOGIC;
begin
  upd_sysregs <= \^upd_sysregs\;
BOTCPU: entity work.rojobot31_0_kcpsm6
     port map (
      \BotInfo_int_reg[0]\ => BOTREGIF_n_2,
      \BotInfo_int_reg[1]\ => BOTREGIF_n_3,
      \BotInfo_int_reg[2]\ => BOTREGIF_n_4,
      \BotInfo_int_reg[3]\ => BOTREGIF_n_5,
      \BotInfo_int_reg[4]\ => BOTREGIF_n_6,
      \BotInfo_int_reg[5]\ => BOTREGIF_n_7,
      \BotInfo_int_reg[6]\ => BOTREGIF_n_8,
      \BotInfo_int_reg[7]\(0) => BotInfo_int,
      \BotInfo_int_reg[7]_0\ => BOTREGIF_n_9,
      Bot_Config_reg(7 downto 0) => Bot_Config_reg(7 downto 0),
      D(7) => DataOut(7),
      D(6) => BOTCPU_n_1,
      D(5 downto 3) => DataOut(5 downto 3),
      D(2) => BOTCPU_n_5,
      D(1 downto 0) => DataOut(1 downto 0),
      \DataOut_reg[7]\(7 downto 0) => in_port(7 downto 0),
      E(0) => LocX_int,
      \LocY_int_reg[7]\(0) => LocY_int,
      \MapX_reg[6]\(0) => BOTCPU_n_14,
      \MapY_reg[6]\(0) => BOTCPU_n_15,
      Q(7 downto 0) => Sensors_int(7 downto 0),
      \Sensors_int_reg[7]\(0) => Sensors_int_0,
      address(11 downto 0) => address(11 downto 0),
      bram_enable => bram_enable,
      clk_in => clk_in,
      \data_path_loop[4].small_spm.spm_flop_0\(1 downto 0) => port_id(1 downto 0),
      instruction(17 downto 0) => instruction(17 downto 0),
      load_sys_regs_reg => BOTCPU_n_16,
      load_sys_regs_reg_0(0) => load_sys_regs,
      out_port(7 downto 0) => out_port(7 downto 0),
      reset => reset,
      upd_sysregs => \^upd_sysregs\,
      upd_sysregs_reg => BOTCPU_n_17,
      worldmap_data(1 downto 0) => worldmap_data(1 downto 0)
    );
BOTREGIF: entity work.rojobot31_0_bot31_if
     port map (
      BotInfo_reg(7 downto 0) => BotInfo_reg(7 downto 0),
      D(7 downto 0) => out_port(7 downto 0),
      \DataOut_reg[0]_0\ => BOTREGIF_n_2,
      \DataOut_reg[1]_0\ => BOTREGIF_n_3,
      \DataOut_reg[2]_0\ => BOTREGIF_n_4,
      \DataOut_reg[3]_0\ => BOTREGIF_n_5,
      \DataOut_reg[4]_0\ => BOTREGIF_n_6,
      \DataOut_reg[5]_0\ => BOTREGIF_n_7,
      \DataOut_reg[6]_0\ => BOTREGIF_n_8,
      \DataOut_reg[7]_0\ => BOTREGIF_n_9,
      E(0) => load_sys_regs,
      LocX_reg(7 downto 0) => LocX_reg(7 downto 0),
      LocY_reg(7 downto 0) => LocY_reg(7 downto 0),
      MotCtl_in(7 downto 0) => MotCtl_in(7 downto 0),
      Q(7 downto 0) => Sensors_int(7 downto 0),
      Sensors_reg(7 downto 0) => Sensors_reg(7 downto 0),
      clk_in => clk_in,
      \data_path_loop[6].low_hwbuild.shift_rotate_flop\(7 downto 0) => in_port(7 downto 0),
      kcpsm6_rom(1 downto 0) => port_id(1 downto 0),
      kcpsm6_rom_0(7) => DataOut(7),
      kcpsm6_rom_0(6) => BOTCPU_n_1,
      kcpsm6_rom_0(5 downto 3) => DataOut(5 downto 3),
      kcpsm6_rom_0(2) => BOTCPU_n_5,
      kcpsm6_rom_0(1 downto 0) => DataOut(1 downto 0),
      reset => reset,
      upd_sysregs => \^upd_sysregs\,
      worldmap_addr(13 downto 0) => worldmap_addr(13 downto 0),
      write_strobe_flop => BOTCPU_n_16,
      write_strobe_flop_0 => BOTCPU_n_17,
      write_strobe_flop_1(0) => LocX_int,
      write_strobe_flop_2(0) => LocY_int,
      write_strobe_flop_3(0) => BotInfo_int,
      write_strobe_flop_4(0) => Sensors_int_0,
      write_strobe_flop_5(0) => BOTCPU_n_14,
      write_strobe_flop_6(0) => BOTCPU_n_15
    );
BOTSIMPGM: entity work.rojobot31_0_bot31_pgm
     port map (
      address(11 downto 0) => address(11 downto 0),
      bram_enable => bram_enable,
      clk_in => clk_in,
      instruction(17 downto 0) => instruction(17 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rojobot31_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of rojobot31_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of rojobot31_0 : entity is "rojobot31_0,rojobot31,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of rojobot31_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of rojobot31_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of rojobot31_0 : entity is "rojobot31,Vivado 2018.2";
end rojobot31_0;

architecture STRUCTURE of rojobot31_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW";
begin
inst: entity work.rojobot31_0_rojobot31
     port map (
      BotInfo_reg(7 downto 0) => BotInfo_reg(7 downto 0),
      Bot_Config_reg(7 downto 0) => Bot_Config_reg(7 downto 0),
      LocX_reg(7 downto 0) => LocX_reg(7 downto 0),
      LocY_reg(7 downto 0) => LocY_reg(7 downto 0),
      MotCtl_in(7 downto 0) => MotCtl_in(7 downto 0),
      Sensors_reg(7 downto 0) => Sensors_reg(7 downto 0),
      clk_in => clk_in,
      reset => reset,
      upd_sysregs => upd_sysregs,
      worldmap_addr(13 downto 0) => worldmap_addr(13 downto 0),
      worldmap_data(1 downto 0) => worldmap_data(1 downto 0)
    );
end STRUCTURE;
