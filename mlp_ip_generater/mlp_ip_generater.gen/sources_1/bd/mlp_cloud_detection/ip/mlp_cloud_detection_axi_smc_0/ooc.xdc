# aclk {FREQ_HZ 300000000 CLK_DOMAIN mlp_cloud_detection_ddr4_0_0_c0_ddr4_ui_clk PHASE 0.00} aclk1 {FREQ_HZ 39469738 CLK_DOMAIN mlp_cloud_detection_zynq_ultra_ps_e_0_0_pl_clk0 PHASE 0.0}
# Clock Domain: mlp_cloud_detection_ddr4_0_0_c0_ddr4_ui_clk
create_clock -name aclk -period 3.333 [get_ports aclk]
# Clock Domain: mlp_cloud_detection_zynq_ultra_ps_e_0_0_pl_clk0
create_clock -name aclk1 -period 25.336 [get_ports aclk1]
# Generated clocks
