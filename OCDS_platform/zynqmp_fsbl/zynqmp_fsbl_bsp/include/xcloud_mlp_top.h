// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XCLOUD_MLP_TOP_H
#define XCLOUD_MLP_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcloud_mlp_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XCloud_mlp_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCloud_mlp_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCloud_mlp_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCloud_mlp_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCloud_mlp_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCloud_mlp_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XCloud_mlp_top_Initialize(XCloud_mlp_top *InstancePtr, UINTPTR BaseAddress);
XCloud_mlp_top_Config* XCloud_mlp_top_LookupConfig(UINTPTR BaseAddress);
#else
int XCloud_mlp_top_Initialize(XCloud_mlp_top *InstancePtr, u16 DeviceId);
XCloud_mlp_top_Config* XCloud_mlp_top_LookupConfig(u16 DeviceId);
#endif
int XCloud_mlp_top_CfgInitialize(XCloud_mlp_top *InstancePtr, XCloud_mlp_top_Config *ConfigPtr);
#else
int XCloud_mlp_top_Initialize(XCloud_mlp_top *InstancePtr, const char* InstanceName);
int XCloud_mlp_top_Release(XCloud_mlp_top *InstancePtr);
#endif

void XCloud_mlp_top_Start(XCloud_mlp_top *InstancePtr);
u32 XCloud_mlp_top_IsDone(XCloud_mlp_top *InstancePtr);
u32 XCloud_mlp_top_IsIdle(XCloud_mlp_top *InstancePtr);
u32 XCloud_mlp_top_IsReady(XCloud_mlp_top *InstancePtr);
void XCloud_mlp_top_EnableAutoRestart(XCloud_mlp_top *InstancePtr);
void XCloud_mlp_top_DisableAutoRestart(XCloud_mlp_top *InstancePtr);


void XCloud_mlp_top_InterruptGlobalEnable(XCloud_mlp_top *InstancePtr);
void XCloud_mlp_top_InterruptGlobalDisable(XCloud_mlp_top *InstancePtr);
void XCloud_mlp_top_InterruptEnable(XCloud_mlp_top *InstancePtr, u32 Mask);
void XCloud_mlp_top_InterruptDisable(XCloud_mlp_top *InstancePtr, u32 Mask);
void XCloud_mlp_top_InterruptClear(XCloud_mlp_top *InstancePtr, u32 Mask);
u32 XCloud_mlp_top_InterruptGetEnabled(XCloud_mlp_top *InstancePtr);
u32 XCloud_mlp_top_InterruptGetStatus(XCloud_mlp_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
