#include "cloud_mlp.hpp"
#include "weights.h"
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <hls_stream.h>

typedef ap_fixed<16, 6> data_t; 

struct PacketMeta {
    ap_uint<4> keep;
    ap_uint<4> strb;
    ap_uint<1> last;
    uint8_t nir_raw;
};

data_t relu(data_t x) {
    #pragma HLS INLINE
    return (x > 0) ? x : (data_t)0;
}

data_t hard_sigmoid(data_t x) {
    #pragma HLS INLINE
    data_t res = (data_t)0.2 * x + (data_t)0.5;
    if (res > 1) return 1;
    if (res < 0) return 0;
    return res;
}

void read_input(hls::stream<axis_t>& in_stream, data_t input[4], hls::stream<PacketMeta>& meta_stream) {
    #pragma HLS INLINE off
    if (in_stream.empty()) return;

    axis_t packet = in_stream.read();
    PacketMeta meta;
    meta.keep = packet.keep;
    meta.strb = packet.strb;
    meta.last = packet.last;
    meta.nir_raw = (uint8_t)packet.data.range(31, 24);
    meta_stream.write(meta);

    const data_t INV_255 = (data_t)(1.0 / 255.0);
    #pragma HLS ARRAY_PARTITION variable=input complete

    input[0] = (data_t)packet.data.range(7, 0) * INV_255;
    input[1] = (data_t)packet.data.range(15, 8) * INV_255;
    input[2] = (data_t)packet.data.range(23, 16) * INV_255;
    input[3] = (data_t)packet.data.range(31, 24) * INV_255;
}

void compute_l1(data_t input[4], data_t output[64]) {
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input complete
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=2
    
    #pragma HLS BIND_STORAGE variable=W1 type=ram_1p impl=bram
    #pragma HLS ARRAY_PARTITION variable=W1 dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=W1 dim=1 cyclic factor=2

    L1_Loop: for (int i = 0; i < 32; i++) {
        #pragma HLS PIPELINE II=1
        
        data_t sum0 = (data_t)B1[2*i];
        data_t sum1 = (data_t)B1[2*i+1];
        
        L1_Inner: for (int j = 0; j < 4; j++) {
            #pragma HLS UNROLL
            data_t in_val = input[j];
            
            data_t p0 = in_val * (data_t)W1[2*i][j];
            data_t p1 = in_val * (data_t)W1[2*i+1][j];
            
            #pragma HLS BIND_OP variable=p0 op=mul impl=dsp latency=3
            #pragma HLS BIND_OP variable=p1 op=mul impl=dsp latency=3
            
            sum0 += p0;
            sum1 += p1;
        }
        output[2*i]   = relu(sum0);
        output[2*i+1] = relu(sum1);
    }
}

void compute_l2(data_t input[64], data_t output[128]) {
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input complete
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4
    
    #pragma HLS BIND_STORAGE variable=W2 type=ram_2p impl=bram
    #pragma HLS ARRAY_PARTITION variable=W2 dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=W2 dim=1 cyclic factor=4

    L2_Loop: for (int i = 0; i < 32; i++) {
        #pragma HLS PIPELINE II=1
        
        data_t sum0 = (data_t)B2[4*i];
        data_t sum1 = (data_t)B2[4*i+1];
        data_t sum2 = (data_t)B2[4*i+2];
        data_t sum3 = (data_t)B2[4*i+3];

        L2_Inner_Unroll: for (int j = 0; j < 64; j++) {
            #pragma HLS UNROLL
            data_t in_val = input[j];

            data_t p0 = in_val * (data_t)W2[4*i][j];
            data_t p1 = in_val * (data_t)W2[4*i+1][j];
            data_t p2 = in_val * (data_t)W2[4*i+2][j];
            data_t p3 = in_val * (data_t)W2[4*i+3][j];

            #pragma HLS BIND_OP variable=p0 op=mul impl=dsp latency=3
            #pragma HLS BIND_OP variable=p1 op=mul impl=dsp latency=3
            #pragma HLS BIND_OP variable=p2 op=mul impl=dsp latency=3
            #pragma HLS BIND_OP variable=p3 op=mul impl=dsp latency=3
            
            sum0 += p0;
            sum1 += p1;
            sum2 += p2;
            sum3 += p3;
        }
        
        output[4*i]   = relu(sum0);
        output[4*i+1] = relu(sum1);
        output[4*i+2] = relu(sum2);
        output[4*i+3] = relu(sum3);
    }
}

void compute_l3(data_t input[128], data_t output[64]) {
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input complete
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=2
    
    #pragma HLS BIND_STORAGE variable=W3 type=ram_2p impl=bram
    #pragma HLS ARRAY_PARTITION variable=W3 dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=W3 dim=1 cyclic factor=2
    
    L3_Loop: for (int i = 0; i < 32; i++) {
        #pragma HLS PIPELINE II=1
        
        data_t sum0 = (data_t)B3[2*i];
        data_t sum1 = (data_t)B3[2*i+1];

        L3_Inner_Unroll: for (int j = 0; j < 128; j++) {
            #pragma HLS UNROLL
            data_t in_val = input[j];

            data_t p0 = in_val * (data_t)W3[2*i][j];
            data_t p1 = in_val * (data_t)W3[2*i+1][j];
            
            #pragma HLS BIND_OP variable=p0 op=mul impl=dsp latency=3
            #pragma HLS BIND_OP variable=p1 op=mul impl=dsp latency=3
            
            sum0 += p0;
            sum1 += p1;
        }
        output[2*i]   = relu(sum0);
        output[2*i+1] = relu(sum1);
    }
}

void write_output(data_t l3_out[64], hls::stream<PacketMeta>& meta_stream, hls::stream<axis_t>& out_stream) {
    #pragma HLS INLINE off
    
    #pragma HLS ARRAY_PARTITION variable=l3_out complete
    #pragma HLS BIND_STORAGE variable=W_OUT type=ram_1p impl=bram
    #pragma HLS ARRAY_PARTITION variable=W_OUT complete

    PacketMeta meta = meta_stream.read();
    data_t out_sum = (data_t)B_OUT;

    Loop_Out: for (int j = 0; j < 64; j++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS UNROLL factor=4 
        
        data_t prod = l3_out[j] * (data_t)W_OUT[j];
        #pragma HLS BIND_OP variable=prod op=mul impl=dsp latency=3
        out_sum += prod;
    }

    uint8_t result_pixel = (hard_sigmoid(out_sum) > (data_t)0.5) ? 255 : 0;
    if (meta.nir_raw < 80) result_pixel = 0;

    axis_t packet_out;
    packet_out.data = (result_pixel == 255) ? (ap_uint<32>)0xFFFFFFFF : (ap_uint<32>)0x00000000;
    packet_out.keep = meta.keep;
    packet_out.strb = meta.strb;
    packet_out.last = meta.last;

    out_stream.write(packet_out);
}

void cloud_mlp_top(hls::stream<axis_t>& in_stream, hls::stream<axis_t>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    #pragma HLS DATAFLOW

    static hls::stream<PacketMeta> meta_stream;
    #pragma HLS STREAM variable=meta_stream depth=64

    data_t input_arr[4];
    #pragma HLS ARRAY_PARTITION variable=input_arr complete
    
    data_t l1_out[64];
    #pragma HLS ARRAY_PARTITION variable=l1_out complete
    
    data_t l2_out[128];
    #pragma HLS ARRAY_PARTITION variable=l2_out complete
    
    data_t l3_out[64];
    #pragma HLS ARRAY_PARTITION variable=l3_out complete

    read_input(in_stream, input_arr, meta_stream);
    compute_l1(input_arr, l1_out);
    compute_l2(l1_out, l2_out);
    compute_l3(l2_out, l3_out);
    write_output(l3_out, meta_stream, out_stream);
}