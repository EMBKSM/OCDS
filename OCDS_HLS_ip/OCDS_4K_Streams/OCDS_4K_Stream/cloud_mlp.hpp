
#ifndef CLOUD_MLP_HPP
#define CLOUD_MLP_HPP
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>

typedef ap_axis<32, 0, 0, 0> axis_t;
void cloud_mlp_top(hls::stream<axis_t>& in_stream, hls::stream<axis_t>& out_stream);
#endif