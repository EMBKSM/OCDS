# 2026-02-11T13:01:37.203351400
import vitis

client = vitis.create_client()
client.set_workspace(path="cloude-detection-accelerator")

platform = client.create_platform_component(name = "OCDS_platform",hw_design = "$COMPONENT_LOCATION/../mlp_ip_generater/mlp_cloud_detection_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",is_pmufw_req = True,architecture = "64-bit",compiler = "gcc")

platform = client.get_component(name="OCDS_platform")
status = platform.build()

comp = client.create_app_component(name="OCDS_ps",platform = "$COMPONENT_LOCATION/../OCDS_platform/export/OCDS_platform/OCDS_platform.xpfm",domain = "standalone_psu_cortexa53_0")

status = platform.build()

comp = client.get_component(name="OCDS_ps")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

