// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xcloud_mlp_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCloud_mlp_top_CfgInitialize(XCloud_mlp_top *InstancePtr, XCloud_mlp_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCloud_mlp_top_Start(XCloud_mlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCloud_mlp_top_IsDone(XCloud_mlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCloud_mlp_top_IsIdle(XCloud_mlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCloud_mlp_top_IsReady(XCloud_mlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCloud_mlp_top_EnableAutoRestart(XCloud_mlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCloud_mlp_top_DisableAutoRestart(XCloud_mlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

void XCloud_mlp_top_InterruptGlobalEnable(XCloud_mlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_GIE, 1);
}

void XCloud_mlp_top_InterruptGlobalDisable(XCloud_mlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_GIE, 0);
}

void XCloud_mlp_top_InterruptEnable(XCloud_mlp_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_IER);
    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XCloud_mlp_top_InterruptDisable(XCloud_mlp_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_IER);
    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCloud_mlp_top_InterruptClear(XCloud_mlp_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCloud_mlp_top_WriteReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XCloud_mlp_top_InterruptGetEnabled(XCloud_mlp_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_IER);
}

u32 XCloud_mlp_top_InterruptGetStatus(XCloud_mlp_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCloud_mlp_top_ReadReg(InstancePtr->Control_BaseAddress, XCLOUD_MLP_TOP_CONTROL_ADDR_ISR);
}

