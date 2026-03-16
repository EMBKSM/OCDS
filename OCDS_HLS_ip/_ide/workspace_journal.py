# 2026-02-09T15:14:24.640276700
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/OCDS")

comp = client.create_hls_component(name = "OCDS_4K_Stream",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

cfg = client.get_config_file(path="/c:/OCDS/OCDS_4K_Stream/hls_config.cfg")

cfg.set_values(key="relative_roots", values=[])

cfg.set_values(key="relative_roots", values=[])

cfg.set_values(key="relative_roots", values=[])

cfg.set_values(key="syn.file_csimflags", values=[])

cfg.set_values(key="syn.file_cflags", values=[])

cfg.set_values(key="syn.file", values=["./cloud_mlp.cpp", "./cloud_mlp.hpp"])

cfg.set_value(section="hls", key="syn.csimflags", value="")

cfg.set_value(section="hls", key="syn.cflags", value="")

cfg.set_values(key="syn.file_cflags", values=[])

cfg.set_values(key="syn.file", values=["./cloud_mlp.cpp", "./cloud_mlp.hpp", "./weights.h"])

cfg.set_value(section="hls", key="syn.cflags", value="")

cfg.set_value(section="hls", key="syn.csimflags", value="")

cfg.set_values(key="syn.file_csimflags", values=[])

cfg.set_value(section="hls", key="syn.top", value="clud_mlp_top")

cfg.set_values(key="tb.file", values=["./tb_cloud_mlp.cpp"])

cfg.set_value(section="hls", key="syn.csimflags", value="")

cfg.set_values(key="tb.file_cflags", values=[])

cfg.set_value(section="hls", key="tb.cflags", value="")

vitis.dispose()

