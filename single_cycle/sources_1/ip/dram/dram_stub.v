// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Jul  2 18:51:27 2021
// Host        : HP-ENVY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/jason/Desktop/single_cycle/single_cycle.srcs/sources_1/ip/dram/dram_stub.v
// Design      : dram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.1" *)
module dram(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[13:0],d[31:0],clk,we,spo[31:0]" */;
  input [13:0]a;
  input [31:0]d;
  input clk;
  input we;
  output [31:0]spo;
endmodule
