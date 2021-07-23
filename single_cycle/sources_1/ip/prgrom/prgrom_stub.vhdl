-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Jul 22 22:16:58 2021
-- Host        : HP-ENVY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/jason/Desktop/single_cycle/single_cycle.srcs/sources_1/ip/prgrom/prgrom_stub.vhdl
-- Design      : prgrom
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prgrom is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end prgrom;

architecture stub of prgrom is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[13:0],spo[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_13,Vivado 2020.1";
begin
end;
