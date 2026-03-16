
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [0:0] proc_0_data_FIFO_blk;
    wire [0:0] proc_0_data_PIPO_blk;
    wire [0:0] proc_0_start_FIFO_blk;
    wire [0:0] proc_0_TLF_FIFO_blk;
    wire [0:0] proc_0_input_sync_blk;
    wire [0:0] proc_0_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_0;
    reg [0:0] proc_dep_vld_vec_0_reg;
    wire [1:0] in_chan_dep_vld_vec_0;
    wire [9:0] in_chan_dep_data_vec_0;
    wire [1:0] token_in_vec_0;
    wire [0:0] out_chan_dep_vld_vec_0;
    wire [4:0] out_chan_dep_data_0;
    wire [0:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [4:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_4_0;
    wire [4:0] dep_chan_data_4_0;
    wire token_4_0;
    wire [0:0] proc_1_data_FIFO_blk;
    wire [0:0] proc_1_data_PIPO_blk;
    wire [0:0] proc_1_start_FIFO_blk;
    wire [0:0] proc_1_TLF_FIFO_blk;
    wire [0:0] proc_1_input_sync_blk;
    wire [0:0] proc_1_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_1;
    reg [0:0] proc_dep_vld_vec_1_reg;
    wire [0:0] in_chan_dep_vld_vec_1;
    wire [4:0] in_chan_dep_data_vec_1;
    wire [0:0] token_in_vec_1;
    wire [0:0] out_chan_dep_vld_vec_1;
    wire [4:0] out_chan_dep_data_1;
    wire [0:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_2_1;
    wire [4:0] dep_chan_data_2_1;
    wire token_2_1;
    wire [0:0] proc_2_data_FIFO_blk;
    wire [0:0] proc_2_data_PIPO_blk;
    wire [0:0] proc_2_start_FIFO_blk;
    wire [0:0] proc_2_TLF_FIFO_blk;
    wire [0:0] proc_2_input_sync_blk;
    wire [0:0] proc_2_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_2;
    reg [0:0] proc_dep_vld_vec_2_reg;
    wire [0:0] in_chan_dep_vld_vec_2;
    wire [4:0] in_chan_dep_data_vec_2;
    wire [0:0] token_in_vec_2;
    wire [0:0] out_chan_dep_vld_vec_2;
    wire [4:0] out_chan_dep_data_2;
    wire [0:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_3_2;
    wire [4:0] dep_chan_data_3_2;
    wire token_3_2;
    wire [0:0] proc_3_data_FIFO_blk;
    wire [0:0] proc_3_data_PIPO_blk;
    wire [0:0] proc_3_start_FIFO_blk;
    wire [0:0] proc_3_TLF_FIFO_blk;
    wire [0:0] proc_3_input_sync_blk;
    wire [0:0] proc_3_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_3;
    reg [0:0] proc_dep_vld_vec_3_reg;
    wire [0:0] in_chan_dep_vld_vec_3;
    wire [4:0] in_chan_dep_data_vec_3;
    wire [0:0] token_in_vec_3;
    wire [0:0] out_chan_dep_vld_vec_3;
    wire [4:0] out_chan_dep_data_3;
    wire [0:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_4_3;
    wire [4:0] dep_chan_data_4_3;
    wire token_4_3;
    wire [1:0] proc_4_data_FIFO_blk;
    wire [1:0] proc_4_data_PIPO_blk;
    wire [1:0] proc_4_start_FIFO_blk;
    wire [1:0] proc_4_TLF_FIFO_blk;
    wire [1:0] proc_4_input_sync_blk;
    wire [1:0] proc_4_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_4;
    reg [1:0] proc_dep_vld_vec_4_reg;
    wire [0:0] in_chan_dep_vld_vec_4;
    wire [4:0] in_chan_dep_data_vec_4;
    wire [0:0] token_in_vec_4;
    wire [1:0] out_chan_dep_vld_vec_4;
    wire [4:0] out_chan_dep_data_4;
    wire [1:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_0_4;
    wire [4:0] dep_chan_data_0_4;
    wire token_0_4;
    wire [4:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [4:0] origin;

    reg ap_done_reg_0;// for module compute_l1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= compute_l1_U0.ap_done & ~compute_l1_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module compute_l2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= compute_l2_U0.ap_done & ~compute_l2_U0.ap_continue;
        end
    end

    reg ap_done_reg_2;// for module compute_l3_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_2 <= 'b0;
        end
        else begin
            ap_done_reg_2 <= compute_l3_U0.ap_done & ~compute_l3_U0.ap_continue;
        end
    end

    reg ap_done_reg_3;// for module write_output_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_3 <= 'b0;
        end
        else begin
            ap_done_reg_3 <= write_output_U0.ap_done & ~write_output_U0.ap_continue;
        end
    end

    // Process: read_input_U0
    cloud_mlp_top_hls_deadlock_detect_unit #(5, 0, 2, 1) cloud_mlp_top_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~read_input_U0.meta_stream_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[4 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_4_0;
    assign in_chan_dep_data_vec_0[9 : 5] = dep_chan_data_4_0;
    assign token_in_vec_0[1] = token_4_0;
    assign dep_chan_vld_0_4 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_4 = out_chan_dep_data_0;
    assign token_0_4 = token_out_vec_0[0];

    // Process: compute_l1_U0
    cloud_mlp_top_hls_deadlock_detect_unit #(5, 1, 1, 1) cloud_mlp_top_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0;
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0 | (~input_arr_U.if_empty_n & compute_l1_U0.ap_idle & ~input_arr_U.if_write) | (~input_arr_1_U.if_empty_n & compute_l1_U0.ap_idle & ~input_arr_1_U.if_write) | (~input_arr_2_U.if_empty_n & compute_l1_U0.ap_idle & ~input_arr_2_U.if_write) | (~input_arr_3_U.if_empty_n & compute_l1_U0.ap_idle & ~input_arr_3_U.if_write);
    assign proc_1_input_sync_blk[0] = 1'b0;
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[4 : 0] = dep_chan_data_2_1;
    assign token_in_vec_1[0] = token_2_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];

    // Process: compute_l2_U0
    cloud_mlp_top_hls_deadlock_detect_unit #(5, 2, 1, 1) cloud_mlp_top_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0;
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0 | (~l1_out_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_U.if_write) | (~l1_out_1_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_1_U.if_write) | (~l1_out_2_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_2_U.if_write) | (~l1_out_3_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_3_U.if_write) | (~l1_out_4_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_4_U.if_write) | (~l1_out_5_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_5_U.if_write) | (~l1_out_6_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_6_U.if_write) | (~l1_out_7_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_7_U.if_write) | (~l1_out_8_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_8_U.if_write) | (~l1_out_9_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_9_U.if_write) | (~l1_out_10_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_10_U.if_write) | (~l1_out_11_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_11_U.if_write) | (~l1_out_12_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_12_U.if_write) | (~l1_out_13_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_13_U.if_write) | (~l1_out_14_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_14_U.if_write) | (~l1_out_15_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_15_U.if_write) | (~l1_out_16_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_16_U.if_write) | (~l1_out_17_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_17_U.if_write) | (~l1_out_18_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_18_U.if_write) | (~l1_out_19_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_19_U.if_write) | (~l1_out_20_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_20_U.if_write) | (~l1_out_21_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_21_U.if_write) | (~l1_out_22_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_22_U.if_write) | (~l1_out_23_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_23_U.if_write) | (~l1_out_24_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_24_U.if_write) | (~l1_out_25_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_25_U.if_write) | (~l1_out_26_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_26_U.if_write) | (~l1_out_27_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_27_U.if_write) | (~l1_out_28_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_28_U.if_write) | (~l1_out_29_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_29_U.if_write) | (~l1_out_30_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_30_U.if_write) | (~l1_out_31_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_31_U.if_write) | (~l1_out_32_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_32_U.if_write) | (~l1_out_33_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_33_U.if_write) | (~l1_out_34_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_34_U.if_write) | (~l1_out_35_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_35_U.if_write) | (~l1_out_36_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_36_U.if_write) | (~l1_out_37_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_37_U.if_write) | (~l1_out_38_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_38_U.if_write) | (~l1_out_39_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_39_U.if_write) | (~l1_out_40_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_40_U.if_write) | (~l1_out_41_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_41_U.if_write) | (~l1_out_42_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_42_U.if_write) | (~l1_out_43_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_43_U.if_write) | (~l1_out_44_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_44_U.if_write) | (~l1_out_45_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_45_U.if_write) | (~l1_out_46_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_46_U.if_write) | (~l1_out_47_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_47_U.if_write) | (~l1_out_48_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_48_U.if_write) | (~l1_out_49_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_49_U.if_write) | (~l1_out_50_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_50_U.if_write) | (~l1_out_51_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_51_U.if_write) | (~l1_out_52_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_52_U.if_write) | (~l1_out_53_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_53_U.if_write) | (~l1_out_54_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_54_U.if_write) | (~l1_out_55_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_55_U.if_write) | (~l1_out_56_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_56_U.if_write) | (~l1_out_57_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_57_U.if_write) | (~l1_out_58_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_58_U.if_write) | (~l1_out_59_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_59_U.if_write) | (~l1_out_60_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_60_U.if_write) | (~l1_out_61_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_61_U.if_write) | (~l1_out_62_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_62_U.if_write) | (~l1_out_63_U.if_empty_n & compute_l2_U0.ap_idle & ~l1_out_63_U.if_write);
    assign proc_2_input_sync_blk[0] = 1'b0;
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_3_2;
    assign in_chan_dep_data_vec_2[4 : 0] = dep_chan_data_3_2;
    assign token_in_vec_2[0] = token_3_2;
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[0];

    // Process: compute_l3_U0
    cloud_mlp_top_hls_deadlock_detect_unit #(5, 3, 1, 1) cloud_mlp_top_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0;
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0;
    assign proc_3_TLF_FIFO_blk[0] = 1'b0 | (~l2_out_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_U.if_write) | (~l2_out_1_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_1_U.if_write) | (~l2_out_2_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_2_U.if_write) | (~l2_out_3_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_3_U.if_write) | (~l2_out_4_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_4_U.if_write) | (~l2_out_5_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_5_U.if_write) | (~l2_out_6_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_6_U.if_write) | (~l2_out_7_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_7_U.if_write) | (~l2_out_8_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_8_U.if_write) | (~l2_out_9_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_9_U.if_write) | (~l2_out_10_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_10_U.if_write) | (~l2_out_11_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_11_U.if_write) | (~l2_out_12_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_12_U.if_write) | (~l2_out_13_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_13_U.if_write) | (~l2_out_14_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_14_U.if_write) | (~l2_out_15_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_15_U.if_write) | (~l2_out_16_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_16_U.if_write) | (~l2_out_17_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_17_U.if_write) | (~l2_out_18_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_18_U.if_write) | (~l2_out_19_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_19_U.if_write) | (~l2_out_20_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_20_U.if_write) | (~l2_out_21_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_21_U.if_write) | (~l2_out_22_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_22_U.if_write) | (~l2_out_23_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_23_U.if_write) | (~l2_out_24_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_24_U.if_write) | (~l2_out_25_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_25_U.if_write) | (~l2_out_26_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_26_U.if_write) | (~l2_out_27_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_27_U.if_write) | (~l2_out_28_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_28_U.if_write) | (~l2_out_29_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_29_U.if_write) | (~l2_out_30_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_30_U.if_write) | (~l2_out_31_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_31_U.if_write) | (~l2_out_32_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_32_U.if_write) | (~l2_out_33_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_33_U.if_write) | (~l2_out_34_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_34_U.if_write) | (~l2_out_35_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_35_U.if_write) | (~l2_out_36_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_36_U.if_write) | (~l2_out_37_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_37_U.if_write) | (~l2_out_38_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_38_U.if_write) | (~l2_out_39_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_39_U.if_write) | (~l2_out_40_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_40_U.if_write) | (~l2_out_41_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_41_U.if_write) | (~l2_out_42_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_42_U.if_write) | (~l2_out_43_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_43_U.if_write) | (~l2_out_44_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_44_U.if_write) | (~l2_out_45_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_45_U.if_write) | (~l2_out_46_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_46_U.if_write) | (~l2_out_47_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_47_U.if_write) | (~l2_out_48_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_48_U.if_write) | (~l2_out_49_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_49_U.if_write) | (~l2_out_50_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_50_U.if_write) | (~l2_out_51_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_51_U.if_write) | (~l2_out_52_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_52_U.if_write) | (~l2_out_53_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_53_U.if_write) | (~l2_out_54_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_54_U.if_write) | (~l2_out_55_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_55_U.if_write) | (~l2_out_56_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_56_U.if_write) | (~l2_out_57_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_57_U.if_write) | (~l2_out_58_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_58_U.if_write) | (~l2_out_59_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_59_U.if_write) | (~l2_out_60_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_60_U.if_write) | (~l2_out_61_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_61_U.if_write) | (~l2_out_62_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_62_U.if_write) | (~l2_out_63_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_63_U.if_write) | (~l2_out_64_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_64_U.if_write) | (~l2_out_65_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_65_U.if_write) | (~l2_out_66_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_66_U.if_write) | (~l2_out_67_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_67_U.if_write) | (~l2_out_68_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_68_U.if_write) | (~l2_out_69_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_69_U.if_write) | (~l2_out_70_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_70_U.if_write) | (~l2_out_71_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_71_U.if_write) | (~l2_out_72_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_72_U.if_write) | (~l2_out_73_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_73_U.if_write) | (~l2_out_74_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_74_U.if_write) | (~l2_out_75_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_75_U.if_write) | (~l2_out_76_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_76_U.if_write) | (~l2_out_77_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_77_U.if_write) | (~l2_out_78_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_78_U.if_write) | (~l2_out_79_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_79_U.if_write) | (~l2_out_80_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_80_U.if_write) | (~l2_out_81_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_81_U.if_write) | (~l2_out_82_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_82_U.if_write) | (~l2_out_83_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_83_U.if_write) | (~l2_out_84_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_84_U.if_write) | (~l2_out_85_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_85_U.if_write) | (~l2_out_86_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_86_U.if_write) | (~l2_out_87_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_87_U.if_write) | (~l2_out_88_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_88_U.if_write) | (~l2_out_89_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_89_U.if_write) | (~l2_out_90_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_90_U.if_write) | (~l2_out_91_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_91_U.if_write) | (~l2_out_92_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_92_U.if_write) | (~l2_out_93_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_93_U.if_write) | (~l2_out_94_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_94_U.if_write) | (~l2_out_95_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_95_U.if_write) | (~l2_out_96_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_96_U.if_write) | (~l2_out_97_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_97_U.if_write) | (~l2_out_98_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_98_U.if_write) | (~l2_out_99_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_99_U.if_write) | (~l2_out_100_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_100_U.if_write) | (~l2_out_101_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_101_U.if_write) | (~l2_out_102_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_102_U.if_write) | (~l2_out_103_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_103_U.if_write) | (~l2_out_104_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_104_U.if_write) | (~l2_out_105_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_105_U.if_write) | (~l2_out_106_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_106_U.if_write) | (~l2_out_107_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_107_U.if_write) | (~l2_out_108_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_108_U.if_write) | (~l2_out_109_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_109_U.if_write) | (~l2_out_110_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_110_U.if_write) | (~l2_out_111_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_111_U.if_write) | (~l2_out_112_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_112_U.if_write) | (~l2_out_113_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_113_U.if_write) | (~l2_out_114_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_114_U.if_write) | (~l2_out_115_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_115_U.if_write) | (~l2_out_116_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_116_U.if_write) | (~l2_out_117_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_117_U.if_write) | (~l2_out_118_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_118_U.if_write) | (~l2_out_119_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_119_U.if_write) | (~l2_out_120_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_120_U.if_write) | (~l2_out_121_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_121_U.if_write) | (~l2_out_122_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_122_U.if_write) | (~l2_out_123_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_123_U.if_write) | (~l2_out_124_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_124_U.if_write) | (~l2_out_125_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_125_U.if_write) | (~l2_out_126_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_126_U.if_write) | (~l2_out_127_U.if_empty_n & compute_l3_U0.ap_idle & ~l2_out_127_U.if_write);
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[4 : 0] = dep_chan_data_4_3;
    assign token_in_vec_3[0] = token_4_3;
    assign dep_chan_vld_3_2 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_2 = out_chan_dep_data_3;
    assign token_3_2 = token_out_vec_3[0];

    // Process: write_output_U0
    cloud_mlp_top_hls_deadlock_detect_unit #(5, 4, 1, 2) cloud_mlp_top_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0;
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0;
    assign proc_4_TLF_FIFO_blk[0] = 1'b0 | (~l3_out_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_U.if_write) | (~l3_out_1_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_1_U.if_write) | (~l3_out_2_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_2_U.if_write) | (~l3_out_3_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_3_U.if_write) | (~l3_out_4_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_4_U.if_write) | (~l3_out_5_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_5_U.if_write) | (~l3_out_6_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_6_U.if_write) | (~l3_out_7_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_7_U.if_write) | (~l3_out_8_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_8_U.if_write) | (~l3_out_9_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_9_U.if_write) | (~l3_out_10_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_10_U.if_write) | (~l3_out_11_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_11_U.if_write) | (~l3_out_12_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_12_U.if_write) | (~l3_out_13_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_13_U.if_write) | (~l3_out_14_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_14_U.if_write) | (~l3_out_15_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_15_U.if_write) | (~l3_out_16_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_16_U.if_write) | (~l3_out_17_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_17_U.if_write) | (~l3_out_18_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_18_U.if_write) | (~l3_out_19_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_19_U.if_write) | (~l3_out_20_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_20_U.if_write) | (~l3_out_21_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_21_U.if_write) | (~l3_out_22_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_22_U.if_write) | (~l3_out_23_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_23_U.if_write) | (~l3_out_24_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_24_U.if_write) | (~l3_out_25_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_25_U.if_write) | (~l3_out_26_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_26_U.if_write) | (~l3_out_27_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_27_U.if_write) | (~l3_out_28_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_28_U.if_write) | (~l3_out_29_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_29_U.if_write) | (~l3_out_30_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_30_U.if_write) | (~l3_out_31_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_31_U.if_write) | (~l3_out_32_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_32_U.if_write) | (~l3_out_33_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_33_U.if_write) | (~l3_out_34_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_34_U.if_write) | (~l3_out_35_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_35_U.if_write) | (~l3_out_36_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_36_U.if_write) | (~l3_out_37_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_37_U.if_write) | (~l3_out_38_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_38_U.if_write) | (~l3_out_39_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_39_U.if_write) | (~l3_out_40_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_40_U.if_write) | (~l3_out_41_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_41_U.if_write) | (~l3_out_42_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_42_U.if_write) | (~l3_out_43_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_43_U.if_write) | (~l3_out_44_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_44_U.if_write) | (~l3_out_45_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_45_U.if_write) | (~l3_out_46_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_46_U.if_write) | (~l3_out_47_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_47_U.if_write) | (~l3_out_48_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_48_U.if_write) | (~l3_out_49_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_49_U.if_write) | (~l3_out_50_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_50_U.if_write) | (~l3_out_51_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_51_U.if_write) | (~l3_out_52_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_52_U.if_write) | (~l3_out_53_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_53_U.if_write) | (~l3_out_54_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_54_U.if_write) | (~l3_out_55_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_55_U.if_write) | (~l3_out_56_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_56_U.if_write) | (~l3_out_57_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_57_U.if_write) | (~l3_out_58_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_58_U.if_write) | (~l3_out_59_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_59_U.if_write) | (~l3_out_60_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_60_U.if_write) | (~l3_out_61_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_61_U.if_write) | (~l3_out_62_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_62_U.if_write) | (~l3_out_63_U.if_empty_n & write_output_U0.ap_idle & ~l3_out_63_U.if_write);
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~write_output_U0.meta_stream_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_0_4;
    assign in_chan_dep_data_vec_4[4 : 0] = dep_chan_data_0_4;
    assign token_in_vec_4[0] = token_0_4;
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[0];
    assign dep_chan_vld_4_0 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_0 = out_chan_dep_data_4;
    assign token_4_0 = token_out_vec_4[1];


`include "cloud_mlp_top_hls_deadlock_report_unit.vh"
