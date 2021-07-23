-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Jul 22 22:16:58 2021
-- Host        : HP-ENVY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jason/Desktop/single_cycle/single_cycle.srcs/sources_1/ip/prgrom/prgrom_sim_netlist.vhdl
-- Design      : prgrom
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity prgrom_rom is
  port (
    spo : out STD_LOGIC_VECTOR ( 24 downto 0 );
    a : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of prgrom_rom : entity is "rom";
end prgrom_rom;

architecture STRUCTURE of prgrom_rom is
  signal \spo[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \spo[21]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spo[9]_INST_0\ : label is "soft_lutpair0";
begin
\spo[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000007000000FF"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => \spo[31]_INST_0_i_2_n_0\,
      I5 => a(3),
      O => spo(0)
    );
\spo[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000F0000006F"
    )
        port map (
      I0 => a(1),
      I1 => a(0),
      I2 => a(3),
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => \spo[31]_INST_0_i_1_n_0\,
      I5 => a(2),
      O => spo(7)
    );
\spo[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000068"
    )
        port map (
      I0 => a(1),
      I1 => a(0),
      I2 => a(2),
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => \spo[31]_INST_0_i_2_n_0\,
      I5 => a(3),
      O => spo(9)
    );
\spo[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000100000000000C"
    )
        port map (
      I0 => a(0),
      I1 => a(3),
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => a(2),
      I5 => a(1),
      O => spo(10)
    );
\spo[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200020008"
    )
        port map (
      I0 => a(1),
      I1 => a(3),
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => a(2),
      I5 => a(0),
      O => spo(11)
    );
\spo[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000040000004C"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => \spo[31]_INST_0_i_2_n_0\,
      I5 => a(3),
      O => spo(12)
    );
\spo[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000466"
    )
        port map (
      I0 => a(2),
      I1 => a(1),
      I2 => a(0),
      I3 => a(3),
      I4 => \spo[31]_INST_0_i_1_n_0\,
      I5 => \spo[31]_INST_0_i_2_n_0\,
      O => spo(13)
    );
\spo[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010101111010"
    )
        port map (
      I0 => \spo[31]_INST_0_i_2_n_0\,
      I1 => \spo[31]_INST_0_i_1_n_0\,
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => spo(14)
    );
\spo[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => a(3),
      I5 => a(1),
      O => spo(15)
    );
\spo[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000600000007"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => a(3),
      I5 => a(1),
      O => spo(16)
    );
\spo[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000102"
    )
        port map (
      I0 => a(3),
      I1 => \spo[31]_INST_0_i_1_n_0\,
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => a(0),
      O => spo(17)
    );
\spo[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000201000101"
    )
        port map (
      I0 => a(3),
      I1 => \spo[31]_INST_0_i_1_n_0\,
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => a(2),
      I4 => a(1),
      I5 => a(0),
      O => spo(18)
    );
\spo[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000030"
    )
        port map (
      I0 => a(1),
      I1 => a(0),
      I2 => a(2),
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => \spo[31]_INST_0_i_1_n_0\,
      I5 => a(3),
      O => spo(19)
    );
\spo[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000014"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(1),
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => \spo[31]_INST_0_i_2_n_0\,
      I5 => a(3),
      O => spo(20)
    );
\spo[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => a(2),
      I1 => a(3),
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => a(1),
      O => spo(21)
    );
\spo[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000030000"
    )
        port map (
      I0 => a(1),
      I1 => a(3),
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => a(2),
      I5 => a(0),
      O => spo(22)
    );
\spo[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000004"
    )
        port map (
      I0 => a(2),
      I1 => a(0),
      I2 => a(3),
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => \spo[31]_INST_0_i_1_n_0\,
      I5 => a(1),
      O => spo(1)
    );
\spo[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010101000000"
    )
        port map (
      I0 => \spo[31]_INST_0_i_1_n_0\,
      I1 => \spo[31]_INST_0_i_2_n_0\,
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => spo(23)
    );
\spo[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000030000000A"
    )
        port map (
      I0 => a(2),
      I1 => a(1),
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => a(3),
      I5 => a(0),
      O => spo(24)
    );
\spo[31]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => a(9),
      I1 => a(5),
      I2 => a(8),
      I3 => a(6),
      O => \spo[31]_INST_0_i_1_n_0\
    );
\spo[31]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => a(11),
      I1 => a(4),
      I2 => a(12),
      I3 => a(7),
      I4 => a(13),
      I5 => a(10),
      O => \spo[31]_INST_0_i_2_n_0\
    );
\spo[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000B0000002F"
    )
        port map (
      I0 => a(1),
      I1 => a(0),
      I2 => a(3),
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => \spo[31]_INST_0_i_1_n_0\,
      I5 => a(2),
      O => spo(2)
    );
\spo[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000040001000A"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => \spo[31]_INST_0_i_2_n_0\,
      I4 => a(3),
      I5 => a(1),
      O => spo(3)
    );
\spo[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => a(3),
      I1 => \spo[31]_INST_0_i_2_n_0\,
      I2 => \spo[31]_INST_0_i_1_n_0\,
      I3 => a(2),
      I4 => a(0),
      I5 => a(1),
      O => spo(8)
    );
\spo[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010001011100"
    )
        port map (
      I0 => \spo[31]_INST_0_i_1_n_0\,
      I1 => \spo[31]_INST_0_i_2_n_0\,
      I2 => a(2),
      I3 => a(0),
      I4 => a(1),
      I5 => a(3),
      O => spo(4)
    );
\spo[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000277"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(1),
      I3 => a(3),
      I4 => \spo[31]_INST_0_i_2_n_0\,
      I5 => \spo[31]_INST_0_i_1_n_0\,
      O => spo(5)
    );
\spo[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => a(0),
      I1 => a(2),
      I2 => \spo[31]_INST_0_i_2_n_0\,
      I3 => \spo[31]_INST_0_i_1_n_0\,
      I4 => a(3),
      O => spo(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity prgrom_dist_mem_gen_v8_0_13_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 24 downto 0 );
    a : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of prgrom_dist_mem_gen_v8_0_13_synth : entity is "dist_mem_gen_v8_0_13_synth";
end prgrom_dist_mem_gen_v8_0_13_synth;

architecture STRUCTURE of prgrom_dist_mem_gen_v8_0_13_synth is
begin
\gen_rom.rom_inst\: entity work.prgrom_rom
     port map (
      a(13 downto 0) => a(13 downto 0),
      spo(24 downto 0) => spo(24 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity prgrom_dist_mem_gen_v8_0_13 is
  port (
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of prgrom_dist_mem_gen_v8_0_13 : entity is 14;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of prgrom_dist_mem_gen_v8_0_13 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of prgrom_dist_mem_gen_v8_0_13 : entity is 16384;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of prgrom_dist_mem_gen_v8_0_13 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of prgrom_dist_mem_gen_v8_0_13 : entity is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of prgrom_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of prgrom_dist_mem_gen_v8_0_13 : entity is "prgrom.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of prgrom_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of prgrom_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of prgrom_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of prgrom_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of prgrom_dist_mem_gen_v8_0_13 : entity is 32;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of prgrom_dist_mem_gen_v8_0_13 : entity is "dist_mem_gen_v8_0_13";
end prgrom_dist_mem_gen_v8_0_13;

architecture STRUCTURE of prgrom_dist_mem_gen_v8_0_13 is
  signal \<const0>\ : STD_LOGIC;
  signal \^spo\ : STD_LOGIC_VECTOR ( 31 downto 1 );
begin
  dpo(31) <= \<const0>\;
  dpo(30) <= \<const0>\;
  dpo(29) <= \<const0>\;
  dpo(28) <= \<const0>\;
  dpo(27) <= \<const0>\;
  dpo(26) <= \<const0>\;
  dpo(25) <= \<const0>\;
  dpo(24) <= \<const0>\;
  dpo(23) <= \<const0>\;
  dpo(22) <= \<const0>\;
  dpo(21) <= \<const0>\;
  dpo(20) <= \<const0>\;
  dpo(19) <= \<const0>\;
  dpo(18) <= \<const0>\;
  dpo(17) <= \<const0>\;
  dpo(16) <= \<const0>\;
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(31) <= \<const0>\;
  qdpo(30) <= \<const0>\;
  qdpo(29) <= \<const0>\;
  qdpo(28) <= \<const0>\;
  qdpo(27) <= \<const0>\;
  qdpo(26) <= \<const0>\;
  qdpo(25) <= \<const0>\;
  qdpo(24) <= \<const0>\;
  qdpo(23) <= \<const0>\;
  qdpo(22) <= \<const0>\;
  qdpo(21) <= \<const0>\;
  qdpo(20) <= \<const0>\;
  qdpo(19) <= \<const0>\;
  qdpo(18) <= \<const0>\;
  qdpo(17) <= \<const0>\;
  qdpo(16) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(31) <= \<const0>\;
  qspo(30) <= \<const0>\;
  qspo(29) <= \<const0>\;
  qspo(28) <= \<const0>\;
  qspo(27) <= \<const0>\;
  qspo(26) <= \<const0>\;
  qspo(25) <= \<const0>\;
  qspo(24) <= \<const0>\;
  qspo(23) <= \<const0>\;
  qspo(22) <= \<const0>\;
  qspo(21) <= \<const0>\;
  qspo(20) <= \<const0>\;
  qspo(19) <= \<const0>\;
  qspo(18) <= \<const0>\;
  qspo(17) <= \<const0>\;
  qspo(16) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(31 downto 29) <= \^spo\(31 downto 29);
  spo(28) <= \^spo\(29);
  spo(27) <= \^spo\(29);
  spo(26) <= \^spo\(26);
  spo(25) <= \^spo\(26);
  spo(24 downto 18) <= \^spo\(24 downto 18);
  spo(17) <= \<const0>\;
  spo(16 downto 7) <= \^spo\(16 downto 7);
  spo(6) <= \^spo\(11);
  spo(5 downto 4) <= \^spo\(5 downto 4);
  spo(3) <= \<const0>\;
  spo(2 downto 1) <= \^spo\(2 downto 1);
  spo(0) <= \^spo\(1);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.prgrom_dist_mem_gen_v8_0_13_synth
     port map (
      a(13 downto 0) => a(13 downto 0),
      spo(24 downto 22) => \^spo\(31 downto 29),
      spo(21) => \^spo\(26),
      spo(20 downto 14) => \^spo\(24 downto 18),
      spo(13 downto 4) => \^spo\(16 downto 7),
      spo(3 downto 2) => \^spo\(5 downto 4),
      spo(1 downto 0) => \^spo\(2 downto 1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity prgrom is
  port (
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of prgrom : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of prgrom : entity is "prgrom,dist_mem_gen_v8_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of prgrom : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of prgrom : entity is "dist_mem_gen_v8_0_13,Vivado 2020.1";
end prgrom;

architecture STRUCTURE of prgrom is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "soft";
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 14;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 16384;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "prgrom.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 32;
begin
U0: entity work.prgrom_dist_mem_gen_v8_0_13
     port map (
      a(13 downto 0) => a(13 downto 0),
      clk => '0',
      d(31 downto 0) => B"00000000000000000000000000000000",
      dpo(31 downto 0) => NLW_U0_dpo_UNCONNECTED(31 downto 0),
      dpra(13 downto 0) => B"00000000000000",
      i_ce => '1',
      qdpo(31 downto 0) => NLW_U0_qdpo_UNCONNECTED(31 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(31 downto 0) => NLW_U0_qspo_UNCONNECTED(31 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(31 downto 0) => spo(31 downto 0),
      we => '0'
    );
end STRUCTURE;
