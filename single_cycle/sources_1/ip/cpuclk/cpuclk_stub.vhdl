-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Jul 22 11:09:34 2021
-- Host        : HP-ENVY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/jason/Desktop/single_cycle/single_cycle.srcs/sources_1/ip/cpuclk/cpuclk_stub.vhdl
-- Design      : cpuclk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpuclk is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end cpuclk;

architecture stub of cpuclk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_in1";
begin
end;
