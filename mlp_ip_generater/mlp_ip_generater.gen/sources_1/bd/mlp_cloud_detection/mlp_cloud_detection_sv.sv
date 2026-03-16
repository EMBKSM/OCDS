// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:mlp_cloud_detection:1.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module mlp_cloud_detection_sv (
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_act_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [16:0] ddr4_sdram_062_adr,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [1:0] ddr4_sdram_062_ba,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_bg,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_ck_c,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_ck_t,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_cke,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_cs_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ddr4_sdram_062_dm_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ddr4_sdram_062_dq,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ddr4_sdram_062_dqs_c,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ddr4_sdram_062_dqs_t,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_odt,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_062_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire user_si570_sysclk_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire user_si570_sysclk_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire reset_rtl
);

  mlp_cloud_detection inst (
    .ddr4_sdram_062_act_n(ddr4_sdram_062_act_n),
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
    .user_si570_sysclk_clk_n(user_si570_sysclk_clk_n),
    .user_si570_sysclk_clk_p(user_si570_sysclk_clk_p),
    .reset_rtl(reset_rtl)
  );

endmodule
