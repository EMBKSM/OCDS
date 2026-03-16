# 2026-02-10T12:40:33.221862400
import vitis

client = vitis.create_client()
client.set_workspace(path="OCDS_4K_Streams")

vitis.dispose()

