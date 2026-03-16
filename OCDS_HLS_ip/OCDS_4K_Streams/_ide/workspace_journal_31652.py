# 2026-02-10T12:39:04.851494500
import vitis

client = vitis.create_client()
client.set_workspace(path="OCDS_4K_Streams")

vitis.dispose()

