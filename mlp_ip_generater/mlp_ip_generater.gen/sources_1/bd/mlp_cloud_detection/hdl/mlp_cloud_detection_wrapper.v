//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Wed Feb 11 14:20:53 2026
//Host        : Legion running 64-bit major release  (build 9200)
//Command     : generate_target mlp_cloud_detection_wrapper.bd
//Design      : mlp_cloud_detection_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mlp_cloud_detection_wrapper
   (ddr4_sdram_062_act_n,
    ddr4_sdram_062_adr,
    ddr4_sdram_062_ba,
    ddr4_sdram_062_bg,
    ddr4_sdram_062_ck_c,
    ddr4_sdram_062_ck_t,
    ddr4_sdram_062_cke,
    ddr4_sdram_062_cs_n,
    ddr4_sdram_062_dm_n,
    ddr4_sdram_062_dq,
    ddr4_sdram_062_dqs_c,
    ddr4_sdram_062_dqs_t,
    ddr4_sdram_062_odt,
    ddr4_sdram_062_reset_n,
    reset_rtl,
    user_si570_sysclk_clk_n,
    user_si570_sysclk_clk_p);
  output ddr4_sdram_062_act_n;
  output [16:0]ddr4_sdram_062_adr;
  output [1:0]ddr4_sdram_062_ba;
  output ddr4_sdram_062_bg;
  output ddr4_sdram_062_ck_c;
  output ddr4_sdram_062_ck_t;
  output ddr4_sdram_062_cke;
  output ddr4_sdram_062_cs_n;
  inout [1:0]ddr4_sdram_062_dm_n;
  inout [15:0]ddr4_sdram_062_dq;
  inout [1:0]ddr4_sdram_062_dqs_c;
  inout [1:0]ddr4_sdram_062_dqs_t;
  output ddr4_sdram_062_odt;
  output ddr4_sdram_062_reset_n;
  input reset_rtl;
  input user_si570_sysclk_clk_n;
  input user_si570_sysclk_clk_p;

  wire ddr4_sdram_062_act_n;
  wire [16:0]ddr4_sdram_062_adr;
  wire [1:0]ddr4_sdram_062_ba;
  wire ddr4_sdram_062_bg;
  wire ddr4_sdram_062_ck_c;
  wire ddr4_sdram_062_ck_t;
  wire ddr4_sdram_062_cke;
  wire ddr4_sdram_062_cs_n;
  wire [1:0]ddr4_sdram_062_dm_n;
  wire [15:0]ddr4_sdram_062_dq;
  wire [1:0]ddr4_sdram_062_dqs_c;
  wire [1:0]ddr4_sdram_062_dqs_t;
  wire ddr4_sdram_062_odt;
  wire ddr4_sdram_062_reset_n;
  wire reset_rtl;
  wire user_si570_sysclk_clk_n;
  wire user_si570_sysclk_clk_p;

  mlp_cloud_detection mlp_cloud_detection_i
       (.ddr4_sdram_062_act_n(ddr4_sdram_062_act_n),
        .ddr4_sdram_062_adr(ddr4_sdram_062_adr),
        .ddr4_sdram_062_ba(ddr4_sdram_062_ba),
        .ddr4_sdram_062_bg(ddr4_sdram_062_bg),
        .ddr4_sdram_062_ck_c(ddr4_sdram_062_ck_c),
        .ddr4_sdram_062_ck_t(ddr4_sdram_062_ck_t),
        .ddr4_sdram_062_cke(ddr4_sdram_062_cke),
        .ddr4_sdram_062_cs_n(ddr4_sdram_062_cs_n),
        .ddr4_sdram_062_dm_n(ddr4_sdram_062_dm_n),
        .ddr4_sdram_062_dq(ddr4_sdram_062_dq),
        .ddr4_sdram_062_dqs_c(ddr4_sdram_062_dqs_c),
        .ddr4_sdram_062_dqs_t(ddr4_sdram_062_dqs_t),
        .ddr4_sdram_062_odt(ddr4_sdram_062_odt),
        .ddr4_sdram_062_reset_n(ddr4_sdram_062_reset_n),
        .reset_rtl(reset_rtl),
        .user_si570_sysclk_clk_n(user_si570_sysclk_clk_n),
        .user_si570_sysclk_clk_p(user_si570_sysclk_clk_p));
endmodule
