# 2026-02-11T09:11:59.810021600
import vitis

client = vitis.create_client()
client.set_workspace(path="OCDS_4K_Streams")

comp = client.get_component(name="OCDS_4K_Stream")
comp.run(operation="SYNTHESIS")

cfg = client.get_config_file(path="/c:/OCDS/OCDS_4K_Streams/OCDS_4K_Stream/hls_config.cfg")

cfg.set_value(section="hls", key="syn.schedule.enable_dsp_full_reg", value="0")

cfg.set_value(section="hls", key="syn.schedule.enable_dsp_full_reg", value="1")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

vitis.dispose()

