# 2026-02-09T16:23:00.434386200
import vitis

client = vitis.create_client()
client.set_workspace(path="OCDS_4K_Streams")

comp = client.get_component(name="OCDS_4K_Stream")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

cfg = client.get_config_file(path="/c:/OCDS/OCDS_4K_Streams/OCDS_4K_Stream/hls_config.cfg")

cfg.set_value(section="hls", key="syn.top", value="cloud_mlp_top")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

vitis.dispose()

