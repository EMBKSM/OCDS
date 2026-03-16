// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xcloud_mlp_top.h"

extern XCloud_mlp_top_Config XCloud_mlp_top_ConfigTable[];

#ifdef SDT
XCloud_mlp_top_Config *XCloud_mlp_top_LookupConfig(UINTPTR BaseAddress) {
	XCloud_mlp_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XCloud_mlp_top_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XCloud_mlp_top_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XCloud_mlp_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCloud_mlp_top_Initialize(XCloud_mlp_top *InstancePtr, UINTPTR BaseAddress) {
	XCloud_mlp_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCloud_mlp_top_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCloud_mlp_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XCloud_mlp_top_Config *XCloud_mlp_top_LookupConfig(u16 DeviceId) {
	XCloud_mlp_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCLOUD_MLP_TOP_NUM_INSTANCES; Index++) {
		if (XCloud_mlp_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCloud_mlp_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCloud_mlp_top_Initialize(XCloud_mlp_top *InstancePtr, u16 DeviceId) {
	XCloud_mlp_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCloud_mlp_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCloud_mlp_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

