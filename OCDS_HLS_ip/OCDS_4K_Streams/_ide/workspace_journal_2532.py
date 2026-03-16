# 2026-02-09T17:25:41.308110100
import vitis

client = vitis.create_client()
client.set_workspace(path="OCDS_4K_Streams")

comp = client.get_component(name="OCDS_4K_Stream")
comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

cfg = client.get_config_file(path="/c:/OCDS/OCDS_4K_Streams/OCDS_4K_Stream/hls_config.cfg")

cfg.set_value(section="hls", key="syn.compile.unsafe_math_optimizations", value="1")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

vitis.dispose()

