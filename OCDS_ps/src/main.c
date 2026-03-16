#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "xil_cache.h"
#include "xuartps.h"
#include "xcloud_mlp_top.h"

#define DMA_DEV_ID          0
#define HLS_MLP_DEV_ID      0
#define UART_DEVICE_ID      0

#define INPUT_LENGTH        (1024)
#define OUTPUT_LENGTH       (2)

#define INPUT_SIZE_BYTES    (INPUT_LENGTH * sizeof(float))
#define OUTPUT_SIZE_BYTES   (OUTPUT_LENGTH * sizeof(float))

float InputBuffer[INPUT_LENGTH]   __attribute__ ((aligned (64)));
float OutputBuffer[OUTPUT_LENGTH] __attribute__ ((aligned (64)));

XAxiDma DmaInstance;
XCloud_mlp_top HlsInstance;
XUartPs Uart_Ps;

void Uart_Receive_Blocking(u8* BufferPtr, int ByteCount) {
    int ReceivedCount = 0;
    while (ReceivedCount < ByteCount) {
        ReceivedCount += XUartPs_Recv(&Uart_Ps, 
                                      BufferPtr + ReceivedCount, 
                                      ByteCount - ReceivedCount);
    }
}

void Uart_Send_Blocking(u8* BufferPtr, int ByteCount) {
    int SentCount = 0;
    while (SentCount < ByteCount) {
        SentCount += XUartPs_Send(&Uart_Ps, 
                                  BufferPtr + SentCount, 
                                  ByteCount - SentCount);
    }
}

int main()
{
    int Status;

    XUartPs_Config *UartConfig = XUartPs_LookupConfig(UART_DEVICE_ID);
    Status = XUartPs_CfgInitialize(&Uart_Ps, UartConfig, UartConfig->BaseAddress);
    if (Status != XST_SUCCESS) return XST_FAILURE;
    
    XUartPs_SetBaudRate(&Uart_Ps, 115200);

    XCloud_mlp_top_Config *HlsConfig = XCloud_mlp_top_LookupConfig(HLS_MLP_DEV_ID);
    Status = XCloud_mlp_top_CfgInitialize(&HlsInstance, HlsConfig);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    XAxiDma_Config *DmaConfig = XAxiDma_LookupConfig(DMA_DEV_ID);
    Status = XAxiDma_CfgInitialize(&DmaInstance, DmaConfig);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    XAxiDma_IntrDisable(&DmaInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&DmaInstance, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

    xil_printf("\r\n--- FPGA Accelerator Ready ---\r\n");

    while(1) {
        xil_printf("READY\r\n"); 

        Uart_Receive_Blocking((u8*)InputBuffer, INPUT_SIZE_BYTES);

        Xil_DCacheFlushRange((UINTPTR)InputBuffer, INPUT_SIZE_BYTES);
        Xil_DCacheFlushRange((UINTPTR)OutputBuffer, OUTPUT_SIZE_BYTES);

        XCloud_mlp_top_Start(&HlsInstance);

        Status = XAxiDma_SimpleTransfer(&DmaInstance, (UINTPTR)OutputBuffer,
                                        OUTPUT_SIZE_BYTES, XAXIDMA_DEVICE_TO_DMA);
        
        Status = XAxiDma_SimpleTransfer(&DmaInstance, (UINTPTR)InputBuffer,
                                        INPUT_SIZE_BYTES, XAXIDMA_DMA_TO_DEVICE);

        while (XAxiDma_Busy(&DmaInstance, XAXIDMA_DMA_TO_DEVICE)) {}
        while (XAxiDma_Busy(&DmaInstance, XAXIDMA_DEVICE_TO_DMA)) {}

        Xil_DCacheInvalidateRange((UINTPTR)OutputBuffer, OUTPUT_SIZE_BYTES);

        Uart_Send_Blocking((u8*)OutputBuffer, OUTPUT_SIZE_BYTES);
    }

    return 0;
}