;/**************************************************************************//**
; * @file     startup_ARMCM3.s
; * @brief    CMSIS Core Device Startup File for
; *           ARMCM3 Device Series
; * @version  V1.08
; * @date     03. February 2012
; *
; * @note
; * Copyright (C) 2012 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M 
; * processor based microcontrollers.  This file can be freely distributed 
; * within development tools that are supporting such ARM based processors. 
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/

Stack_Size      EQU     0x00000004

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
__heap_base				
Stack_Mem       SPACE   Stack_Size
__heap_limit
__initial_sp
                EXPORT __heap_base
				EXPORT __heap_limit
                EXPORT  __initial_sp

                PRESERVE8
                THUMB

; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     0                         ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors


                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler
                IMPORT  __scatterload

                ; this push is consumed by main
                PUSH    {R0, LR}
                
                ; __scatterload will not return
                LDR     R0, =__scatterload
                BX      R0
                
                ENDP

                ALIGN

main            PROC
                EXPORT  main
                IMPORT  app_main

                LDR     R0, = app_main
                BLX     R0
                
                POP     {R0, PC}

                ENDP
                
                ALIGN

                END
