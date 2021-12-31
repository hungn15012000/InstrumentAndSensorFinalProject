
;CodeVisionAVR C Compiler V3.14 Advanced
;(C) Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Build configuration    : Debug
;Chip type              : ATmega8
;Program type           : Application
;Clock frequency        : 11.059200 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : float, width, precision
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 256 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: Yes
;Enhanced function parameter passing: Yes
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATmega8
	#pragma AVRPART MEMORY PROG_FLASH 8192
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1024
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	RCALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	RCALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	RCALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _ext_cnt2x=R4
	.DEF _ext_cnt2x_msb=R5
	.DEF _ext_cnt4x=R6
	.DEF _ext_cnt4x_msb=R7
	.DEF _mode=R8
	.DEF _mode_msb=R9
	.DEF _Kp=R10
	.DEF _Kp_msb=R11
	.DEF _Ki=R12
	.DEF _Ki_msb=R13

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	RJMP __RESET
	RJMP _ext_int0_isr
	RJMP _ext_int1_isr
	RJMP 0x00
	RJMP 0x00
	RJMP _timer1_capt_isr
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP _usart_rx_isr
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00

;REGISTER BIT VARIABLES INITIALIZATION
__REG_BIT_VARS:
	.DW  0x0000

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x1,0x0,0xF,0x0
	.DB  0xA,0x0

_0x3:
	.DB  0x1
_0x4:
	.DB  0x73,0x70,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x31,0x78,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x32,0x78,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x34,0x78
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x4B,0x70,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x4B,0x69,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x4B,0x64,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x6D,0x6F
	.DB  0x64,0x65
_0x5:
	.DB  0x64
_0x6:
	.DB  0x1
_0x0:
	.DB  0x25,0x64,0x2C,0x0,0x25,0x35,0x2E,0x32
	.DB  0x66,0x2C,0x0,0x25,0x64,0x2C,0x25,0x35
	.DB  0x2E,0x32,0x66,0x2C,0x25,0x35,0x2E,0x32
	.DB  0x66,0x20,0xA,0xD,0x0,0x25,0x64,0x2C
	.DB  0x25,0x35,0x2E,0x32,0x66,0x2C,0x25,0x35
	.DB  0x2E,0x32,0x66,0x20,0x20,0xA,0xD,0x0
_0x2040060:
	.DB  0x1
_0x2040000:
	.DB  0x2D,0x4E,0x41,0x4E,0x0,0x49,0x4E,0x46
	.DB  0x0
_0x2060000:
	.DB  0x2D,0x4E,0x41,0x4E,0x0

__GLOBAL_INI_TBL:
	.DW  0x01
	.DW  0x02
	.DW  __REG_BIT_VARS*2

	.DW  0x06
	.DW  0x08
	.DW  __REG_VARS*2

	.DW  0x01
	.DW  _Kd
	.DW  _0x3*2

	.DW  0x162
	.DW  _function
	.DW  _0x4*2

	.DW  0x01
	.DW  _Ts
	.DW  _0x5*2

	.DW  0x01
	.DW  _func_number
	.DW  _0x6*2

	.DW  0x01
	.DW  __seed_G102
	.DW  _0x2040060*2

_0xFFFFFFFF:
	.DW  0

#define __GLOBAL_INI_TBL_PRESENT 1

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	RJMP _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160

	.CSEG
;/*******************************************************
;This program was created by the
;CodeWizardAVR V3.14 Advanced
;Automatic Program Generator
;� Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 12/14/2021
;Author  :
;Company :
;Comments:
;
;
;Chip type               : ATmega8
;Program type            : Application
;AVR Core Clock frequency: 11.059200 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 256
;*******************************************************/
;
;#include <mega8.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <math.h>
;#include <delay.h>
;#include <string.h>
;#include <stdlib.h>
;#include <stdio.h>
;#define min 10
;#define max 255
;// Declare your global variables here
;unsigned ext_cnt2x, ext_cnt4x;
;unsigned int mode = 1;
;float error, pre_error, Pout, Iout, Dout, out, integral, derivative;
;int Kp = 15, Ki = 10, Kd = 1;

	.DSEG
;long ADC_val_0 = 0,ADC_val_1 = 0;
;float Volt_0 = 0, Weight_0 = 0, Volt_1 = 0, Weight_1 = 0;
;char str2[20];
;char function[8][50] ={
;            "sp",
;            "1x",
;            "2x",
;            "4x",
;            "Kp",
;            "Ki",
;            "Kd",
;            "mode"
;            };
;int number;
;int i,j,k,l,m;
;float spd1, spd2, spd3, spd4;
;long Ts = 100;
;int cmd ;
;float output;
;int func_prevnumber, func_number =1;
;long timer_cnt, capture_pulse;
;// External Interrupt 0 service routine
;interrupt [EXT_INT0] void ext_int0_isr(void)
; 0000 003C {

	.CSEG
_ext_int0_isr:
; .FSTART _ext_int0_isr
	RCALL SUBOPT_0x0
; 0000 003D // Place your code here
; 0000 003E ext_cnt2x++;
	MOVW R30,R4
	ADIW R30,1
	MOVW R4,R30
; 0000 003F ext_cnt4x++;
	RJMP _0x3E
; 0000 0040 }
; .FEND
;
;// External Interrupt 1 service routine
;interrupt [EXT_INT1] void ext_int1_isr(void)
; 0000 0044 {
_ext_int1_isr:
; .FSTART _ext_int1_isr
	RCALL SUBOPT_0x0
; 0000 0045 // Place your code here
; 0000 0046 ext_cnt4x++;
_0x3E:
	MOVW R30,R6
	ADIW R30,1
	MOVW R6,R30
; 0000 0047 }
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	RETI
; .FEND
;
;#define DATA_REGISTER_EMPTY (1<<UDRE)
;#define RX_COMPLETE (1<<RXC)
;#define FRAMING_ERROR (1<<FE)
;#define PARITY_ERROR (1<<UPE)
;#define DATA_OVERRUN (1<<DOR)
;
;// USART Receiver buffer
;#define RX_BUFFER_SIZE 8
;char rx_buffer[RX_BUFFER_SIZE];
;
;#if RX_BUFFER_SIZE <= 256
;unsigned char rx_wr_index=0,rx_rd_index=0;
;#else
;unsigned int rx_wr_index=0,rx_rd_index=0;
;#endif
;
;#if RX_BUFFER_SIZE < 256
;unsigned char rx_counter=0;
;#else
;unsigned int rx_counter=0;
;#endif
;
;// This flag is set on USART Receiver buffer overflow
;bit rx_buffer_overflow;
;
;// USART Receiver interrupt service routine
;interrupt [USART_RXC] void usart_rx_isr(void)
; 0000 0064 {
_usart_rx_isr:
; .FSTART _usart_rx_isr
	ST   -Y,R26
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
; 0000 0065 char status,data;
; 0000 0066 status=UCSRA;
	RCALL __SAVELOCR2
;	status -> R17
;	data -> R16
	IN   R17,11
; 0000 0067 data=UDR;
	IN   R16,12
; 0000 0068 if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
	MOV  R30,R17
	ANDI R30,LOW(0x1C)
	BRNE _0x7
; 0000 0069    {
; 0000 006A    rx_buffer[rx_wr_index++]=data;
	LDS  R30,_rx_wr_index
	SUBI R30,-LOW(1)
	STS  _rx_wr_index,R30
	SUBI R30,LOW(1)
	LDI  R31,0
	SUBI R30,LOW(-_rx_buffer)
	SBCI R31,HIGH(-_rx_buffer)
	ST   Z,R16
; 0000 006B #if RX_BUFFER_SIZE == 256
; 0000 006C    // special case for receiver buffer size=256
; 0000 006D    if (++rx_counter == 0) rx_buffer_overflow=1;
; 0000 006E #else
; 0000 006F    if (rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
	LDS  R26,_rx_wr_index
	CPI  R26,LOW(0x8)
	BRNE _0x8
	LDI  R30,LOW(0)
	STS  _rx_wr_index,R30
; 0000 0070    if (++rx_counter == RX_BUFFER_SIZE)
_0x8:
	LDS  R26,_rx_counter
	SUBI R26,-LOW(1)
	STS  _rx_counter,R26
	CPI  R26,LOW(0x8)
	BRNE _0x9
; 0000 0071       {
; 0000 0072       rx_counter=0;
	LDI  R30,LOW(0)
	STS  _rx_counter,R30
; 0000 0073       rx_buffer_overflow=1;
	SET
	BLD  R2,0
; 0000 0074       }
; 0000 0075 #endif
; 0000 0076    }
_0x9:
; 0000 0077 }
_0x7:
	LD   R16,Y+
	LD   R17,Y+
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R26,Y+
	RETI
; .FEND
;
;#ifndef _DEBUG_TERMINAL_IO_
;// Get a character from the USART Receiver buffer
;#define _ALTERNATE_GETCHAR_
;#pragma used+
;char getchar(void)
; 0000 007E {
; 0000 007F char data;
; 0000 0080 while (rx_counter==0);
;	data -> R17
; 0000 0081 data=rx_buffer[rx_rd_index++];
; 0000 0082 #if RX_BUFFER_SIZE != 256
; 0000 0083 if (rx_rd_index == RX_BUFFER_SIZE) rx_rd_index=0;
; 0000 0084 #endif
; 0000 0085 #asm("cli")
; 0000 0086 --rx_counter;
; 0000 0087 #asm("sei")
; 0000 0088 return data;
; 0000 0089 }
;#pragma used-
;#endif
;
;// Standard Input/Output functions
;#include <stdio.h>
;float PID_controller(float setpoint, float input);
;int compare ();
;void substring(const char *str1, int pos1, int pos2);
;int startwith(const char *pre, const char *str);
;void Function1x();
;void Function2x();
;void Function4x();
;void Kp_function(int Kp_new);
;void Ki_function(int Ki_new);
;void Kd_function(int Kd_new);
;void SetPoint(int Ref);
;void mode_function(int mode_number);
;// Timer1 input capture interrupt service routine.
;interrupt [TIM1_CAPT] void timer1_capt_isr(void)
; 0000 009D {
_timer1_capt_isr:
; .FSTART _timer1_capt_isr
	ST   -Y,R22
	ST   -Y,R23
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
; 0000 009E // Place your code here
; 0000 009F    timer_cnt = TCNT1;
	IN   R30,0x2C
	IN   R31,0x2C+1
	RCALL SUBOPT_0x1
	STS  _timer_cnt,R30
	STS  _timer_cnt+1,R31
	STS  _timer_cnt+2,R22
	STS  _timer_cnt+3,R23
; 0000 00A0    TCNT1 = 0;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	OUT  0x2C+1,R31
	OUT  0x2C,R30
; 0000 00A1    capture_pulse++;
	LDI  R26,LOW(_capture_pulse)
	LDI  R27,HIGH(_capture_pulse)
	RCALL __GETD1P_INC
	__SUBD1N -1
	RCALL __PUTDP1_DEC
; 0000 00A2 }
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R23,Y+
	LD   R22,Y+
	RETI
; .FEND
;
;// Voltage Reference: AREF pin
;#define ADC_VREF_TYPE ((0<<REFS1) | (0<<REFS0) | (0<<ADLAR))
;
;// Read the AD conversion result
;unsigned int read_adc(unsigned char adc_input)
; 0000 00A9 {
_read_adc:
; .FSTART _read_adc
; 0000 00AA ADMUX=adc_input | ADC_VREF_TYPE;
	ST   -Y,R26
;	adc_input -> Y+0
	LD   R30,Y
	OUT  0x7,R30
; 0000 00AB // Delay needed for the stabilization of the ADC input voltage
; 0000 00AC delay_us(10);
	__DELAY_USB 37
; 0000 00AD // Start the AD conversion
; 0000 00AE ADCSRA|=(1<<ADSC);
	SBI  0x6,6
; 0000 00AF // Wait for the AD conversion to complete
; 0000 00B0 while ((ADCSRA & (1<<ADIF))==0);
_0xE:
	SBIS 0x6,4
	RJMP _0xE
; 0000 00B1 ADCSRA|=(1<<ADIF);
	SBI  0x6,4
; 0000 00B2 return ADCW;
	IN   R30,0x4
	IN   R31,0x4+1
	RJMP _0x20A0002
; 0000 00B3 }
; .FEND
;
;void main(void)
; 0000 00B6 {
_main:
; .FSTART _main
; 0000 00B7 // Declare your local variables here
; 0000 00B8 
; 0000 00B9 
; 0000 00BA // Input/Output Ports initialization
; 0000 00BB // Port B initialization
; 0000 00BC // Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=Out Bit2=In Bit1=In Bit0=In
; 0000 00BD DDRB=(0<<DDB7) | (0<<DDB6) | (0<<DDB5) | (0<<DDB4) | (1<<DDB3) | (0<<DDB2) | (0<<DDB1) | (0<<DDB0);
	LDI  R30,LOW(8)
	OUT  0x17,R30
; 0000 00BE // State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=0 Bit2=T Bit1=T Bit0=T
; 0000 00BF PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<<PORTB2) | (0<<PORTB1) | (0<<PORTB0);
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 00C0 
; 0000 00C1 // Port C initialization
; 0000 00C2 // Function: Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In
; 0000 00C3 DDRC=(0<<DDC6) | (0<<DDC5) | (0<<DDC4) | (0<<DDC3) | (0<<DDC2) | (0<<DDC1) | (0<<DDC0);
	OUT  0x14,R30
; 0000 00C4 // State: Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T
; 0000 00C5 PORTC=(0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<<PORTC2) | (0<<PORTC1) | (0<<PORTC0);
	OUT  0x15,R30
; 0000 00C6 
; 0000 00C7 // Port D initialization
; 0000 00C8 // Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In
; 0000 00C9 DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
	OUT  0x11,R30
; 0000 00CA // State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T
; 0000 00CB PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);
	OUT  0x12,R30
; 0000 00CC 
; 0000 00CD // Timer/Counter 0 initialization
; 0000 00CE // Clock source: System Clock
; 0000 00CF // Clock value: Timer 0 Stopped
; 0000 00D0 TCCR0=(0<<CS02) | (0<<CS01) | (0<<CS00);
	OUT  0x33,R30
; 0000 00D1 TCNT0=0x00;
	OUT  0x32,R30
; 0000 00D2 
; 0000 00D3 // Timer/Counter 1 initialization
; 0000 00D4 // Clock source: System Clock
; 0000 00D5 // Clock value: 1382.400 kHz
; 0000 00D6 // Mode: Normal top=0xFFFF
; 0000 00D7 // OC1A output: Disconnected
; 0000 00D8 // OC1B output: Disconnected
; 0000 00D9 // Noise Canceler: On
; 0000 00DA // Input Capture on Rising Edge
; 0000 00DB // Timer Period: 47.407 ms
; 0000 00DC // Timer1 Overflow Interrupt: Off
; 0000 00DD // Input Capture Interrupt: On
; 0000 00DE // Compare A Match Interrupt: Off
; 0000 00DF // Compare B Match Interrupt: Off
; 0000 00E0 TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<<WGM10);
	OUT  0x2F,R30
; 0000 00E1 TCCR1B=(1<<ICNC1) | (1<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (1<<CS11) | (0<<CS10);
	LDI  R30,LOW(194)
	OUT  0x2E,R30
; 0000 00E2 TCNT1H=0x00;
	LDI  R30,LOW(0)
	OUT  0x2D,R30
; 0000 00E3 TCNT1L=0x00;
	OUT  0x2C,R30
; 0000 00E4 ICR1H=0x00;
	OUT  0x27,R30
; 0000 00E5 ICR1L=0x00;
	OUT  0x26,R30
; 0000 00E6 OCR1AH=0x00;
	OUT  0x2B,R30
; 0000 00E7 OCR1AL=0x00;
	OUT  0x2A,R30
; 0000 00E8 OCR1BH=0x00;
	OUT  0x29,R30
; 0000 00E9 OCR1BL=0x00;
	OUT  0x28,R30
; 0000 00EA 
; 0000 00EB // Timer/Counter 2 initialization
; 0000 00EC // Clock source: System Clock
; 0000 00ED // Clock value: 345.600 kHz
; 0000 00EE // Mode: Fast PWM top=0xFF
; 0000 00EF // OC2 output: Non-Inverted PWM
; 0000 00F0 // Timer Period: 0.74074 ms
; 0000 00F1 // Output Pulse(s):
; 0000 00F2 // OC2 Period: 0.74074 ms Width: 0.14815 ms
; 0000 00F3 ASSR=0<<AS2;
	OUT  0x22,R30
; 0000 00F4 TCCR2=(1<<PWM2) | (1<<COM21) | (0<<COM20) | (1<<CTC2) | (0<<CS22) | (1<<CS21) | (1<<CS20);
	LDI  R30,LOW(107)
	OUT  0x25,R30
; 0000 00F5 TCNT2=0x00;
	LDI  R30,LOW(0)
	OUT  0x24,R30
; 0000 00F6 OCR2=0x33;
	LDI  R30,LOW(51)
	OUT  0x23,R30
; 0000 00F7 
; 0000 00F8 // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 00F9 TIMSK=(0<<OCIE2) | (0<<TOIE2) | (1<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TOIE1) | (0<<TOIE0);
	LDI  R30,LOW(32)
	OUT  0x39,R30
; 0000 00FA 
; 0000 00FB // External Interrupt(s) initialization
; 0000 00FC // INT0: On
; 0000 00FD // INT0 Mode: Any change
; 0000 00FE // INT1: On
; 0000 00FF // INT1 Mode: Any change
; 0000 0100 GICR|=(1<<INT1) | (1<<INT0);
	IN   R30,0x3B
	ORI  R30,LOW(0xC0)
	OUT  0x3B,R30
; 0000 0101 MCUCR=(0<<ISC11) | (1<<ISC10) | (0<<ISC01) | (1<<ISC00);
	LDI  R30,LOW(5)
	OUT  0x35,R30
; 0000 0102 GIFR=(1<<INTF1) | (1<<INTF0);
	LDI  R30,LOW(192)
	OUT  0x3A,R30
; 0000 0103 
; 0000 0104 // USART initialization
; 0000 0105 // Communication Parameters: 8 Data, 1 Stop, No Parity
; 0000 0106 // USART Receiver: On
; 0000 0107 // USART Transmitter: On
; 0000 0108 // USART Mode: Asynchronous
; 0000 0109 // USART Baud Rate: 9600
; 0000 010A UCSRA=(0<<RXC) | (0<<TXC) | (0<<UDRE) | (0<<FE) | (0<<DOR) | (0<<UPE) | (0<<U2X) | (0<<MPCM);
	LDI  R30,LOW(0)
	OUT  0xB,R30
; 0000 010B UCSRB=(1<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (1<<RXEN) | (1<<TXEN) | (0<<UCSZ2) | (0<<RXB8) | (0<<TXB8);
	LDI  R30,LOW(152)
	OUT  0xA,R30
; 0000 010C UCSRC=(1<<URSEL) | (0<<UMSEL) | (0<<UPM1) | (0<<UPM0) | (0<<USBS) | (1<<UCSZ1) | (1<<UCSZ0) | (0<<UCPOL);
	LDI  R30,LOW(134)
	OUT  0x20,R30
; 0000 010D UBRRH=0x00;
	LDI  R30,LOW(0)
	OUT  0x20,R30
; 0000 010E UBRRL=0x47;
	LDI  R30,LOW(71)
	OUT  0x9,R30
; 0000 010F 
; 0000 0110 // Analog Comparator initialization
; 0000 0111 // Analog Comparator: Off
; 0000 0112 // The Analog Comparator's positive input is
; 0000 0113 // connected to the AIN0 pin
; 0000 0114 // The Analog Comparator's negative input is
; 0000 0115 // connected to the AIN1 pin
; 0000 0116 ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<ACIS1) | (0<<ACIS0);
	LDI  R30,LOW(128)
	OUT  0x8,R30
; 0000 0117 
; 0000 0118 // ADC initialization
; 0000 0119 // ADC Clock frequency: 691.200 kHz
; 0000 011A // ADC Voltage Reference: AREF pin
; 0000 011B ADMUX=ADC_VREF_TYPE;
	LDI  R30,LOW(0)
	OUT  0x7,R30
; 0000 011C ADCSRA=(1<<ADEN) | (0<<ADSC) | (0<<ADFR) | (0<<ADIF) | (0<<ADIE) | (1<<ADPS2) | (0<<ADPS1) | (0<<ADPS0);
	LDI  R30,LOW(132)
	OUT  0x6,R30
; 0000 011D SFIOR=(0<<ACME);
	LDI  R30,LOW(0)
	OUT  0x30,R30
; 0000 011E 
; 0000 011F // SPI initialization
; 0000 0120 // SPI disabled
; 0000 0121 SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<<SPR1) | (0<<SPR0);
	OUT  0xD,R30
; 0000 0122 
; 0000 0123 // TWI initialization
; 0000 0124 // TWI disabled
; 0000 0125 TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);
	OUT  0x36,R30
; 0000 0126 
; 0000 0127 // Global enable interrupts
; 0000 0128 #asm("sei")
	sei
; 0000 0129 
; 0000 012A while (1)
_0x11:
; 0000 012B       {
; 0000 012C       // Place your code here
; 0000 012D          delay_ms(100);
	LDI  R26,LOW(100)
	LDI  R27,0
	RCALL _delay_ms
; 0000 012E          // ADC_val_0 = read_adc(0);
; 0000 012F          // Volt_0 = ADC_val_0*5/1023.0;
; 0000 0130          // Weight = (Volt_0/0.05);
; 0000 0131          // printf("%d,%5.2f,%7.4f  \n\r", ADC_val_0, Volt_0, Weight);
; 0000 0132          if(rx_buffer_overflow)
	SBRS R2,0
	RJMP _0x14
; 0000 0133          {
; 0000 0134              rx_buffer_overflow = 0;
	CLT
	BLD  R2,0
; 0000 0135             func_prevnumber = compare();
	RCALL _compare
	STS  _func_prevnumber,R30
	STS  _func_prevnumber+1,R31
; 0000 0136             if( func_prevnumber > 0 && func_number < 4 )
	LDS  R26,_func_prevnumber
	LDS  R27,_func_prevnumber+1
	RCALL __CPW02
	BRGE _0x16
	LDS  R26,_func_number
	LDS  R27,_func_number+1
	SBIW R26,4
	BRLT _0x17
_0x16:
	RJMP _0x15
_0x17:
; 0000 0137             {
; 0000 0138              func_number = func_prevnumber;
	LDS  R30,_func_prevnumber
	LDS  R31,_func_prevnumber+1
	STS  _func_number,R30
	STS  _func_number+1,R31
; 0000 0139             }
; 0000 013A          }
_0x15:
; 0000 013B          switch(func_number)
_0x14:
	LDS  R30,_func_number
	LDS  R31,_func_number+1
; 0000 013C          {
; 0000 013D             case  1: Function1x();
	CPI  R30,LOW(0x1)
	LDI  R26,HIGH(0x1)
	CPC  R31,R26
	BRNE _0x1B
	RCALL _Function1x
; 0000 013E                break;
	RJMP _0x1A
; 0000 013F             case  2: Function2x();
_0x1B:
	CPI  R30,LOW(0x2)
	LDI  R26,HIGH(0x2)
	CPC  R31,R26
	BRNE _0x1C
	RCALL _Function2x
; 0000 0140                break;
	RJMP _0x1A
; 0000 0141             case  3: Function4x();
_0x1C:
	CPI  R30,LOW(0x3)
	LDI  R26,HIGH(0x3)
	CPC  R31,R26
	BRNE _0x1A
	RCALL _Function4x
; 0000 0142          }
_0x1A:
; 0000 0143       }
	RJMP _0x11
; 0000 0144 }
_0x1E:
	RJMP _0x1E
; .FEND
;
;float PID_controller(float setpoint, float input)
; 0000 0147 {
_PID_controller:
; .FSTART _PID_controller
; 0000 0148    error = setpoint - input;
	RCALL SUBOPT_0x2
;	setpoint -> Y+4
;	input -> Y+0
	RCALL SUBOPT_0x3
	RCALL __SUBF12
	STS  _error,R30
	STS  _error+1,R31
	STS  _error+2,R22
	STS  _error+3,R23
; 0000 0149    Pout = Kp * error;
	RCALL SUBOPT_0x4
	MOVW R26,R10
	RCALL SUBOPT_0x5
	STS  _Pout,R30
	STS  _Pout+1,R31
	STS  _Pout+2,R22
	STS  _Pout+3,R23
; 0000 014A    integral = Kp * 0.1;
	MOVW R30,R10
	RCALL SUBOPT_0x6
	__GETD2N 0x3DCCCCCD
	RCALL __MULF12
	STS  _integral,R30
	STS  _integral+1,R31
	STS  _integral+2,R22
	STS  _integral+3,R23
; 0000 014B    Iout = Ki * integral;
	MOVW R26,R12
	RCALL SUBOPT_0x5
	STS  _Iout,R30
	STS  _Iout+1,R31
	STS  _Iout+2,R22
	STS  _Iout+3,R23
; 0000 014C    derivative = (error - pre_error) / 0.1;
	LDS  R26,_pre_error
	LDS  R27,_pre_error+1
	LDS  R24,_pre_error+2
	LDS  R25,_pre_error+3
	RCALL SUBOPT_0x4
	RCALL __SUBF12
	RCALL SUBOPT_0x7
	RCALL SUBOPT_0x8
	RCALL __DIVF21
	STS  _derivative,R30
	STS  _derivative+1,R31
	STS  _derivative+2,R22
	STS  _derivative+3,R23
; 0000 014D    Dout = Kd * derivative;
	LDS  R26,_Kd
	LDS  R27,_Kd+1
	RCALL SUBOPT_0x5
	STS  _Dout,R30
	STS  _Dout+1,R31
	STS  _Dout+2,R22
	STS  _Dout+3,R23
; 0000 014E     // Calculate total output
; 0000 014F    out = Pout + Iout + Dout;
	LDS  R30,_Iout
	LDS  R31,_Iout+1
	LDS  R22,_Iout+2
	LDS  R23,_Iout+3
	LDS  R26,_Pout
	LDS  R27,_Pout+1
	LDS  R24,_Pout+2
	LDS  R25,_Pout+3
	RCALL __ADDF12
	LDS  R26,_Dout
	LDS  R27,_Dout+1
	LDS  R24,_Dout+2
	LDS  R25,_Dout+3
	RCALL __ADDF12
	STS  _out,R30
	STS  _out+1,R31
	STS  _out+2,R22
	STS  _out+3,R23
; 0000 0150     // Restrict to max/min
; 0000 0151     if(out >= max)
	RCALL SUBOPT_0x9
	RCALL SUBOPT_0xA
	RCALL __CMPF12
	BRLO _0x1F
; 0000 0152        out = max;
	RCALL SUBOPT_0xA
	RJMP _0x3A
; 0000 0153     else if(out <= min)
_0x1F:
	RCALL SUBOPT_0x9
	RCALL SUBOPT_0xB
	RCALL __CMPF12
	BREQ PC+3
	BRCS PC+2
	RJMP _0x21
; 0000 0154        out = min;
	RCALL SUBOPT_0xB
_0x3A:
	STS  _out,R30
	STS  _out+1,R31
	STS  _out+2,R22
	STS  _out+3,R23
; 0000 0155     // Save error to previous error
; 0000 0156     pre_error = error;
_0x21:
	RCALL SUBOPT_0x4
	STS  _pre_error,R30
	STS  _pre_error+1,R31
	STS  _pre_error+2,R22
	STS  _pre_error+3,R23
; 0000 0157    return out;
	LDS  R30,_out
	LDS  R31,_out+1
	LDS  R22,_out+2
	LDS  R23,_out+3
	ADIW R28,8
	RET
; 0000 0158 }
; .FEND
;
;int compare ()
; 0000 015B {
_compare:
; .FSTART _compare
; 0000 015C    i = 0;
	RCALL SUBOPT_0xC
; 0000 015D   for (i = 0;i<8;i++ )
	RCALL SUBOPT_0xC
_0x23:
	RCALL SUBOPT_0xD
	SBIW R26,8
	BRLT PC+2
	RJMP _0x24
; 0000 015E   {
; 0000 015F     if(startwith(function[i],rx_buffer))
	RCALL SUBOPT_0xE
	RCALL SUBOPT_0xF
	LDI  R26,LOW(_rx_buffer)
	LDI  R27,HIGH(_rx_buffer)
	RCALL _startwith
	SBIW R30,0
	BRNE PC+2
	RJMP _0x25
; 0000 0160     {
; 0000 0161     substring(rx_buffer,strlen(function[i]),strlen(rx_buffer));
	LDI  R30,LOW(_rx_buffer)
	LDI  R31,HIGH(_rx_buffer)
	RCALL SUBOPT_0xF
	RCALL SUBOPT_0xE
	MOVW R26,R30
	RCALL _strlen
	RCALL SUBOPT_0xF
	LDI  R26,LOW(_rx_buffer)
	LDI  R27,HIGH(_rx_buffer)
	RCALL _strlen
	MOVW R26,R30
	RCALL _substring
; 0000 0162     number = atoi(str2);
	LDI  R26,LOW(_str2)
	LDI  R27,HIGH(_str2)
	RCALL _atoi
	STS  _number,R30
	STS  _number+1,R31
; 0000 0163    if(number != 0)
	RCALL SUBOPT_0x10
	BREQ _0x26
; 0000 0164    {
; 0000 0165       // printf("data is received\n");
; 0000 0166       switch(i)
	RCALL SUBOPT_0x11
; 0000 0167      {
; 0000 0168      case  0: SetPoint(number);
	SBIW R30,0
	BRNE _0x2A
	RCALL SUBOPT_0x12
	RCALL _SetPoint
; 0000 0169          break;
	RJMP _0x29
; 0000 016A      case  4: Kp_function(number);
_0x2A:
	CPI  R30,LOW(0x4)
	LDI  R26,HIGH(0x4)
	CPC  R31,R26
	BRNE _0x2B
	RCALL SUBOPT_0x12
	RCALL _Kp_function
; 0000 016B          break;
	RJMP _0x29
; 0000 016C      case  5: Ki_function(number);
_0x2B:
	CPI  R30,LOW(0x5)
	LDI  R26,HIGH(0x5)
	CPC  R31,R26
	BRNE _0x2C
	RCALL SUBOPT_0x12
	RCALL _Ki_function
; 0000 016D          break;
	RJMP _0x29
; 0000 016E      case  6: Kd_function(number);
_0x2C:
	CPI  R30,LOW(0x6)
	LDI  R26,HIGH(0x6)
	CPC  R31,R26
	BRNE _0x2D
	RCALL SUBOPT_0x12
	RCALL _Kd_function
; 0000 016F          break;
	RJMP _0x29
; 0000 0170      case  7: mode_function(number);
_0x2D:
	CPI  R30,LOW(0x7)
	LDI  R26,HIGH(0x7)
	CPC  R31,R26
	BRNE _0x29
	RCALL SUBOPT_0x12
	RCALL _mode_function
; 0000 0171      }
_0x29:
; 0000 0172      i = 0;
	RCALL SUBOPT_0xC
; 0000 0173    }
; 0000 0174    else if( number == 0)
	RJMP _0x2F
_0x26:
	RCALL SUBOPT_0x10
	BREQ _0x24
; 0000 0175    {
; 0000 0176       // printf("no data is received\n");
; 0000 0177       break;
; 0000 0178    }
; 0000 0179       number = 0;
_0x2F:
	LDI  R30,LOW(0)
	STS  _number,R30
	STS  _number+1,R30
; 0000 017A 
; 0000 017B       break;
	RJMP _0x24
; 0000 017C    }
; 0000 017D   }
_0x25:
	LDI  R26,LOW(_i)
	LDI  R27,HIGH(_i)
	RCALL SUBOPT_0x13
	RJMP _0x23
_0x24:
; 0000 017E   return i;
	RCALL SUBOPT_0x11
	RET
; 0000 017F }
; .FEND
;void substring(const char *str1, int pos1, int pos2)
; 0000 0181 {
_substring:
; .FSTART _substring
; 0000 0182   j = 0;
	RCALL SUBOPT_0x14
;	*str1 -> Y+4
;	pos1 -> Y+2
;	pos2 -> Y+0
	LDI  R30,LOW(0)
	STS  _j,R30
	STS  _j+1,R30
; 0000 0183   l = pos1;
	RCALL SUBOPT_0x15
; 0000 0184    for(l = pos1 ; l <= pos2 ; l++)
	RCALL SUBOPT_0x15
_0x32:
	LD   R30,Y
	LDD  R31,Y+1
	LDS  R26,_l
	LDS  R27,_l+1
	CP   R30,R26
	CPC  R31,R27
	BRLT _0x33
; 0000 0185   {
; 0000 0186     str2[j++] = str1[l];
	LDI  R26,LOW(_j)
	LDI  R27,HIGH(_j)
	RCALL SUBOPT_0x13
	SBIW R30,1
	SUBI R30,LOW(-_str2)
	SBCI R31,HIGH(-_str2)
	MOVW R0,R30
	LDS  R30,_l
	LDS  R31,_l+1
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	ADD  R26,R30
	ADC  R27,R31
	LD   R30,X
	MOVW R26,R0
	ST   X,R30
; 0000 0187   }
	LDI  R26,LOW(_l)
	LDI  R27,HIGH(_l)
	RCALL SUBOPT_0x13
	RJMP _0x32
_0x33:
; 0000 0188 }
	ADIW R28,6
	RET
; .FEND
;int startwith(const char *pre, const char *str)
; 0000 018A {
_startwith:
; .FSTART _startwith
; 0000 018B   return strncmp(pre, str, strlen(pre))==0 ;
	RCALL SUBOPT_0x14
;	*pre -> Y+2
;	*str -> Y+0
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	RCALL SUBOPT_0xF
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	RCALL SUBOPT_0xF
	RCALL SUBOPT_0x16
	RCALL _strlen
	MOV  R26,R30
	RCALL _strncmp
	LDI  R26,LOW(0)
	RCALL __EQB12
	LDI  R31,0
	RJMP _0x20A0005
; 0000 018C }
; .FEND
;void Function1x()
; 0000 018E {
_Function1x:
; .FSTART _Function1x
; 0000 018F    spd1 = 230400.0/timer_cnt;
	LDS  R30,_timer_cnt
	LDS  R31,_timer_cnt+1
	LDS  R22,_timer_cnt+2
	LDS  R23,_timer_cnt+3
	RCALL __CDF1
	__GETD2N 0x48610000
	RCALL __DIVF21
	STS  _spd1,R30
	STS  _spd1+1,R31
	STS  _spd1+2,R22
	STS  _spd1+3,R23
; 0000 0190    output = PID_controller(cmd,spd1);
	RCALL SUBOPT_0x17
	RCALL SUBOPT_0x6
	RCALL __PUTPARD1
	LDS  R26,_spd1
	LDS  R27,_spd1+1
	LDS  R24,_spd1+2
	LDS  R25,_spd1+3
	RCALL SUBOPT_0x18
; 0000 0191    OCR2 = output;
; 0000 0192    ext_cnt2x = 0;
; 0000 0193    ext_cnt4x = 0;
; 0000 0194    capture_pulse = 0;
; 0000 0195    printf("%d,",cmd);
; 0000 0196    printf("%5.2f,", spd1);
	LDS  R30,_spd1
	LDS  R31,_spd1+1
	LDS  R22,_spd1+2
	LDS  R23,_spd1+3
	RCALL SUBOPT_0x19
; 0000 0197    if(mode == 1)
	BRNE _0x34
; 0000 0198    {
; 0000 0199       ADC_val_0 = read_adc(0);
	RCALL SUBOPT_0x1A
; 0000 019A       Volt_0 = ADC_val_0*5/1023.0;
; 0000 019B       Weight_0 = (Volt_0/0.05);
; 0000 019C       printf("%d,%5.2f,%5.2f \n\r", ADC_val_0, Volt_0, Weight_0);
	__POINTW1FN _0x0,11
	RCALL SUBOPT_0x1B
	RJMP _0x3B
; 0000 019D    }
; 0000 019E    else{
_0x34:
; 0000 019F       ADC_val_1 = read_adc(1);
	RCALL SUBOPT_0x1C
; 0000 01A0       Volt_1 = ADC_val_1*5/1023.0;
; 0000 01A1       Weight_1 = (Volt_1/0.05);
; 0000 01A2       printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
_0x3B:
	RCALL __PUTPARD1
	RCALL SUBOPT_0x1D
; 0000 01A3    }
; 0000 01A4 
; 0000 01A5 }
	RET
; .FEND
;void Function2x()
; 0000 01A7 {
_Function2x:
; .FSTART _Function2x
; 0000 01A8    //  printf("2x function is executed!\n");
; 0000 01A9    spd3 = 83.3333*ext_cnt2x/Ts;
	MOVW R30,R4
	CLR  R22
	CLR  R23
	RCALL __CDF1
	__GETD2N 0x42A6AAA6
	RCALL SUBOPT_0x1E
	STS  _spd3,R30
	STS  _spd3+1,R31
	STS  _spd3+2,R22
	STS  _spd3+3,R23
; 0000 01AA    output = PID_controller(cmd,spd3);
	RCALL SUBOPT_0x17
	RCALL SUBOPT_0x6
	RCALL __PUTPARD1
	LDS  R26,_spd3
	LDS  R27,_spd3+1
	LDS  R24,_spd3+2
	LDS  R25,_spd3+3
	RCALL SUBOPT_0x18
; 0000 01AB    OCR2 = output;
; 0000 01AC    ext_cnt2x = 0;
; 0000 01AD    ext_cnt4x = 0;
; 0000 01AE    capture_pulse = 0;
; 0000 01AF    printf("%d,",cmd);
; 0000 01B0    printf("%5.2f,", spd3);
	LDS  R30,_spd3
	LDS  R31,_spd3+1
	LDS  R22,_spd3+2
	LDS  R23,_spd3+3
	RCALL SUBOPT_0x19
; 0000 01B1    if(mode == 1)
	BRNE _0x36
; 0000 01B2    {
; 0000 01B3       ADC_val_0 = read_adc(0);
	RCALL SUBOPT_0x1A
; 0000 01B4       Volt_0 = ADC_val_0*5/1023.0;
; 0000 01B5       Weight_0 = (Volt_0/0.05);
; 0000 01B6       printf("%d,%5.2f,%5.2f  \n\r", ADC_val_0, Volt_0, Weight_0);
	__POINTW1FN _0x0,29
	RCALL SUBOPT_0x1B
	RJMP _0x3C
; 0000 01B7    }
; 0000 01B8    else{
_0x36:
; 0000 01B9       ADC_val_1 = read_adc(1);
	RCALL SUBOPT_0x1C
; 0000 01BA       Volt_1 = ADC_val_1*5/1023.0;
; 0000 01BB       Weight_1 = (Volt_1/0.05);
; 0000 01BC       printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
_0x3C:
	RCALL __PUTPARD1
	RCALL SUBOPT_0x1D
; 0000 01BD    }
; 0000 01BE }
	RET
; .FEND
;void Function4x()
; 0000 01C0 {
_Function4x:
; .FSTART _Function4x
; 0000 01C1    //  printf("4x function is executed!\n");
; 0000 01C2    spd4 = 41.6667*ext_cnt4x/Ts;
	MOVW R30,R6
	CLR  R22
	CLR  R23
	RCALL __CDF1
	__GETD2N 0x4226AAB3
	RCALL SUBOPT_0x1E
	STS  _spd4,R30
	STS  _spd4+1,R31
	STS  _spd4+2,R22
	STS  _spd4+3,R23
; 0000 01C3    output = PID_controller(cmd,spd4);
	RCALL SUBOPT_0x17
	RCALL SUBOPT_0x6
	RCALL __PUTPARD1
	LDS  R26,_spd4
	LDS  R27,_spd4+1
	LDS  R24,_spd4+2
	LDS  R25,_spd4+3
	RCALL SUBOPT_0x18
; 0000 01C4    OCR2 = output;
; 0000 01C5    ext_cnt2x = 0;
; 0000 01C6    ext_cnt4x = 0;
; 0000 01C7    capture_pulse = 0;
; 0000 01C8    printf("%d,",cmd);
; 0000 01C9    printf("%5.2f,", spd4);
	LDS  R30,_spd4
	LDS  R31,_spd4+1
	LDS  R22,_spd4+2
	LDS  R23,_spd4+3
	RCALL SUBOPT_0x19
; 0000 01CA    if(mode == 1)
	BRNE _0x38
; 0000 01CB    {
; 0000 01CC       ADC_val_0 = read_adc(0);
	RCALL SUBOPT_0x1A
; 0000 01CD       Volt_0 = ADC_val_0*5/1023.0;
; 0000 01CE       Weight_0 = (Volt_0/0.05);
; 0000 01CF       printf("%d,%5.2f,%5.2f  \n\r", ADC_val_0, Volt_0, Weight_0);
	__POINTW1FN _0x0,29
	RCALL SUBOPT_0x1B
	RJMP _0x3D
; 0000 01D0    }
; 0000 01D1    else{
_0x38:
; 0000 01D2       ADC_val_1 = read_adc(1);
	RCALL SUBOPT_0x1C
; 0000 01D3       Volt_1 = ADC_val_1*5/1023.0;
; 0000 01D4       Weight_1 = (Volt_1/0.05);
; 0000 01D5       printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
_0x3D:
	RCALL __PUTPARD1
	RCALL SUBOPT_0x1D
; 0000 01D6    }
; 0000 01D7 }
	RET
; .FEND
;void Kp_function(int Kp_new)
; 0000 01D9 {
_Kp_function:
; .FSTART _Kp_function
; 0000 01DA     Kp = Kp_new;
	RCALL SUBOPT_0x14
;	Kp_new -> Y+0
	__GETWRS 10,11,0
; 0000 01DB    //  printf("Kp = %d\n", Kp);
; 0000 01DC }
	RJMP _0x20A0006
; .FEND
;void Ki_function(int Ki_new)
; 0000 01DE {
_Ki_function:
; .FSTART _Ki_function
; 0000 01DF     Ki = Ki_new;
	RCALL SUBOPT_0x14
;	Ki_new -> Y+0
	__GETWRS 12,13,0
; 0000 01E0    //  printf("Ki = %d\n", Ki);
; 0000 01E1 }
	RJMP _0x20A0006
; .FEND
;void Kd_function(int Kd_new)
; 0000 01E3 {
_Kd_function:
; .FSTART _Kd_function
; 0000 01E4     Kd = Kd_new;
	RCALL SUBOPT_0x14
;	Kd_new -> Y+0
	LD   R30,Y
	LDD  R31,Y+1
	STS  _Kd,R30
	STS  _Kd+1,R31
; 0000 01E5    //  printf("Kd = %d\n", Kd);
; 0000 01E6 }
	RJMP _0x20A0006
; .FEND
;void SetPoint(int Ref)
; 0000 01E8 {
_SetPoint:
; .FSTART _SetPoint
; 0000 01E9     cmd = Ref;
	RCALL SUBOPT_0x14
;	Ref -> Y+0
	LD   R30,Y
	LDD  R31,Y+1
	STS  _cmd,R30
	STS  _cmd+1,R31
; 0000 01EA    //  printf("Ref is = %d\n", cmd);
; 0000 01EB }
	RJMP _0x20A0006
; .FEND
;void mode_function(int mode_number)
; 0000 01ED {
_mode_function:
; .FSTART _mode_function
; 0000 01EE    mode = mode_number;
	RCALL SUBOPT_0x14
;	mode_number -> Y+0
	__GETWRS 8,9,0
; 0000 01EF }
_0x20A0006:
	ADIW R28,2
	RET
; .FEND

	.CSEG
_ftrunc:
; .FSTART _ftrunc
	RCALL __PUTPARD2
   ldd  r23,y+3
   ldd  r22,y+2
   ldd  r31,y+1
   ld   r30,y
   bst  r23,7
   lsl  r23
   sbrc r22,7
   sbr  r23,1
   mov  r25,r23
   subi r25,0x7e
   breq __ftrunc0
   brcs __ftrunc0
   cpi  r25,24
   brsh __ftrunc1
   clr  r26
   clr  r27
   clr  r24
__ftrunc2:
   sec
   ror  r24
   ror  r27
   ror  r26
   dec  r25
   brne __ftrunc2
   and  r30,r26
   and  r31,r27
   and  r22,r24
   rjmp __ftrunc1
__ftrunc0:
   clt
   clr  r23
   clr  r30
   clr  r31
   clr  r22
__ftrunc1:
   cbr  r22,0x80
   lsr  r23
   brcc __ftrunc3
   sbr  r22,0x80
__ftrunc3:
   bld  r23,7
   ld   r26,y+
   ld   r27,y+
   ld   r24,y+
   ld   r25,y+
   cp   r30,r26
   cpc  r31,r27
   cpc  r22,r24
   cpc  r23,r25
   bst  r25,7
   ret
; .FEND
_floor:
; .FSTART _floor
	RCALL SUBOPT_0x2
	RCALL _ftrunc
	RCALL __PUTD1S0
    brne __floor1
__floor0:
	RCALL SUBOPT_0x1F
	RJMP _0x20A0005
__floor1:
    brtc __floor0
	RCALL SUBOPT_0x1F
	__GETD2N 0x3F800000
	RCALL __SUBF12
_0x20A0005:
	ADIW R28,4
	RET
; .FEND

	.CSEG
_strcpyf:
; .FSTART _strcpyf
	RCALL SUBOPT_0x14
    ld   r30,y+
    ld   r31,y+
    ld   r26,y+
    ld   r27,y+
    movw r24,r26
strcpyf0:
	lpm  r0,z+
    st   x+,r0
    tst  r0
    brne strcpyf0
    movw r30,r24
    ret
; .FEND
_strlen:
; .FSTART _strlen
	RCALL SUBOPT_0x14
    ld   r26,y+
    ld   r27,y+
    clr  r30
    clr  r31
strlen0:
    ld   r22,x+
    tst  r22
    breq strlen1
    adiw r30,1
    rjmp strlen0
strlen1:
    ret
; .FEND
_strlenf:
; .FSTART _strlenf
	RCALL SUBOPT_0x14
    clr  r26
    clr  r27
    ld   r30,y+
    ld   r31,y+
strlenf0:
	lpm  r0,z+
    tst  r0
    breq strlenf1
    adiw r26,1
    rjmp strlenf0
strlenf1:
    movw r30,r26
    ret
; .FEND
_strncmp:
; .FSTART _strncmp
	ST   -Y,R26
    clr  r22
    clr  r23
    ld   r24,y+
    ld   r30,y+
    ld   r31,y+
    ld   r26,y+
    ld   r27,y+
strncmp0:
    tst  r24
    breq strncmp1
    dec  r24
    ld   r22,x+
    ld   r23,z+
    cp   r22,r23
    brne strncmp1
    tst  r22
    brne strncmp0
strncmp3:
    clr  r30
    ret
strncmp1:
    sub  r22,r23
    breq strncmp3
    ldi  r30,1
    brcc strncmp2
    subi r30,2
strncmp2:
    ret
; .FEND

	.CSEG
_atoi:
; .FSTART _atoi
	RCALL SUBOPT_0x14
   	ldd  r27,y+1
   	ld   r26,y
__atoi0:
   	ld   r30,x
        mov  r24,r26
	MOV  R26,R30
	RCALL _isspace
        mov  r26,r24
   	tst  r30
   	breq __atoi1
   	adiw r26,1
   	rjmp __atoi0
__atoi1:
   	clt
   	ld   r30,x
   	cpi  r30,'-'
   	brne __atoi2
   	set
   	rjmp __atoi3
__atoi2:
   	cpi  r30,'+'
   	brne __atoi4
__atoi3:
   	adiw r26,1
__atoi4:
   	clr  r22
   	clr  r23
__atoi5:
   	ld   r30,x
        mov  r24,r26
	MOV  R26,R30
	RCALL _isdigit
        mov  r26,r24
   	tst  r30
   	breq __atoi6
   	movw r30,r22
   	lsl  r22
   	rol  r23
   	lsl  r22
   	rol  r23
   	add  r22,r30
   	adc  r23,r31
   	lsl  r22
   	rol  r23
   	ld   r30,x+
   	clr  r31
   	subi r30,'0'
   	add  r22,r30
   	adc  r23,r31
   	rjmp __atoi5
__atoi6:
   	movw r30,r22
   	brtc __atoi7
   	com  r30
   	com  r31
   	adiw r30,1
__atoi7:
   	adiw r28,2
   	ret
; .FEND
_ftoa:
; .FSTART _ftoa
	RCALL SUBOPT_0x20
	LDI  R30,LOW(0)
	STD  Y+2,R30
	LDI  R30,LOW(63)
	STD  Y+3,R30
	RCALL __SAVELOCR2
	LDD  R30,Y+11
	LDD  R31,Y+11+1
	CPI  R30,LOW(0xFFFF)
	LDI  R26,HIGH(0xFFFF)
	CPC  R31,R26
	BRNE _0x204000D
	RCALL SUBOPT_0x21
	__POINTW2FN _0x2040000,0
	RCALL _strcpyf
	RJMP _0x20A0004
_0x204000D:
	CPI  R30,LOW(0x7FFF)
	LDI  R26,HIGH(0x7FFF)
	CPC  R31,R26
	BRNE _0x204000C
	RCALL SUBOPT_0x21
	__POINTW2FN _0x2040000,1
	RCALL _strcpyf
	RJMP _0x20A0004
_0x204000C:
	LDD  R26,Y+12
	TST  R26
	BRPL _0x204000F
	RCALL SUBOPT_0x22
	RCALL __ANEGF1
	RCALL SUBOPT_0x23
	RCALL SUBOPT_0x24
	LDI  R30,LOW(45)
	ST   X,R30
_0x204000F:
	LDD  R26,Y+8
	CPI  R26,LOW(0x7)
	BRLO _0x2040010
	LDI  R30,LOW(6)
	STD  Y+8,R30
_0x2040010:
	LDD  R17,Y+8
_0x2040011:
	RCALL SUBOPT_0x25
	BREQ _0x2040013
	RCALL SUBOPT_0x26
	RCALL SUBOPT_0x27
	RCALL SUBOPT_0x28
	RJMP _0x2040011
_0x2040013:
	RCALL SUBOPT_0x29
	RCALL __ADDF12
	RCALL SUBOPT_0x23
	LDI  R17,LOW(0)
	__GETD1N 0x3F800000
	RCALL SUBOPT_0x28
_0x2040014:
	RCALL SUBOPT_0x29
	RCALL __CMPF12
	BRLO _0x2040016
	RCALL SUBOPT_0x26
	RCALL SUBOPT_0x2A
	RCALL SUBOPT_0x28
	SUBI R17,-LOW(1)
	CPI  R17,39
	BRLO _0x2040017
	RCALL SUBOPT_0x21
	__POINTW2FN _0x2040000,5
	RCALL _strcpyf
	RJMP _0x20A0004
_0x2040017:
	RJMP _0x2040014
_0x2040016:
	CPI  R17,0
	BRNE _0x2040018
	RCALL SUBOPT_0x24
	LDI  R30,LOW(48)
	ST   X,R30
	RJMP _0x2040019
_0x2040018:
_0x204001A:
	RCALL SUBOPT_0x25
	BREQ _0x204001C
	RCALL SUBOPT_0x26
	RCALL SUBOPT_0x27
	RCALL SUBOPT_0x2B
	RCALL SUBOPT_0x7
	RCALL _floor
	RCALL SUBOPT_0x28
	RCALL SUBOPT_0x29
	RCALL __DIVF21
	RCALL __CFD1U
	MOV  R16,R30
	RCALL SUBOPT_0x24
	RCALL SUBOPT_0x2C
	RCALL SUBOPT_0x26
	RCALL SUBOPT_0x6
	RCALL __MULF12
	RCALL SUBOPT_0x2D
	RCALL __SWAPD12
	RCALL __SUBF12
	RCALL SUBOPT_0x23
	RJMP _0x204001A
_0x204001C:
_0x2040019:
	LDD  R30,Y+8
	CPI  R30,0
	BREQ _0x20A0003
	RCALL SUBOPT_0x24
	LDI  R30,LOW(46)
	ST   X,R30
_0x204001E:
	LDD  R30,Y+8
	SUBI R30,LOW(1)
	STD  Y+8,R30
	SUBI R30,-LOW(1)
	BREQ _0x2040020
	RCALL SUBOPT_0x2D
	RCALL SUBOPT_0x2A
	RCALL SUBOPT_0x23
	RCALL SUBOPT_0x22
	RCALL __CFD1U
	MOV  R16,R30
	RCALL SUBOPT_0x24
	RCALL SUBOPT_0x2C
	RCALL SUBOPT_0x2D
	RCALL SUBOPT_0x6
	RCALL __SWAPD12
	RCALL __SUBF12
	RCALL SUBOPT_0x23
	RJMP _0x204001E
_0x2040020:
_0x20A0003:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R30,LOW(0)
	ST   X,R30
_0x20A0004:
	RCALL __LOADLOCR2
	ADIW R28,13
	RET
; .FEND

	.DSEG

	.CSEG
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG
_putchar:
; .FSTART _putchar
	ST   -Y,R26
putchar0:
     sbis usr,udre
     rjmp putchar0
     ld   r30,y
     out  udr,r30
_0x20A0002:
	ADIW R28,1
	RET
; .FEND
_put_usart_G103:
; .FSTART _put_usart_G103
	RCALL SUBOPT_0x14
	LDD  R26,Y+2
	RCALL _putchar
	LD   R26,Y
	LDD  R27,Y+1
	RCALL SUBOPT_0x13
	ADIW R28,3
	RET
; .FEND
__ftoe_G103:
; .FSTART __ftoe_G103
	RCALL SUBOPT_0x20
	LDI  R30,LOW(128)
	STD  Y+2,R30
	LDI  R30,LOW(63)
	STD  Y+3,R30
	RCALL __SAVELOCR4
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	CPI  R30,LOW(0xFFFF)
	LDI  R26,HIGH(0xFFFF)
	CPC  R31,R26
	BRNE _0x2060019
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	RCALL SUBOPT_0xF
	__POINTW2FN _0x2060000,0
	RCALL _strcpyf
	RJMP _0x20A0001
_0x2060019:
	CPI  R30,LOW(0x7FFF)
	LDI  R26,HIGH(0x7FFF)
	CPC  R31,R26
	BRNE _0x2060018
	RCALL SUBOPT_0x2E
	RCALL SUBOPT_0xF
	__POINTW2FN _0x2060000,1
	RCALL _strcpyf
	RJMP _0x20A0001
_0x2060018:
	LDD  R26,Y+11
	CPI  R26,LOW(0x7)
	BRLO _0x206001B
	LDI  R30,LOW(6)
	STD  Y+11,R30
_0x206001B:
	LDD  R17,Y+11
_0x206001C:
	RCALL SUBOPT_0x25
	BREQ _0x206001E
	RCALL SUBOPT_0x2F
	RCALL SUBOPT_0x30
	RJMP _0x206001C
_0x206001E:
	RCALL SUBOPT_0x31
	RCALL __CPD10
	BRNE _0x206001F
	LDI  R19,LOW(0)
	RCALL SUBOPT_0x2F
	RCALL SUBOPT_0x30
	RJMP _0x2060020
_0x206001F:
	LDD  R19,Y+11
	RCALL SUBOPT_0x32
	BREQ PC+2
	BRCC PC+2
	RJMP _0x2060021
	RCALL SUBOPT_0x2F
	RCALL SUBOPT_0x30
_0x2060022:
	RCALL SUBOPT_0x32
	BRLO _0x2060024
	RCALL SUBOPT_0x33
	RCALL SUBOPT_0x27
	RCALL SUBOPT_0x34
	SUBI R19,-LOW(1)
	RJMP _0x2060022
_0x2060024:
	RJMP _0x2060025
_0x2060021:
_0x2060026:
	RCALL SUBOPT_0x32
	BRSH _0x2060028
	RCALL SUBOPT_0x33
	RCALL SUBOPT_0x2A
	RCALL SUBOPT_0x34
	SUBI R19,LOW(1)
	RJMP _0x2060026
_0x2060028:
	RCALL SUBOPT_0x2F
	RCALL SUBOPT_0x30
_0x2060025:
	RCALL SUBOPT_0x31
	RCALL SUBOPT_0x2B
	RCALL SUBOPT_0x34
	RCALL SUBOPT_0x32
	BRLO _0x2060029
	RCALL SUBOPT_0x33
	RCALL SUBOPT_0x27
	RCALL SUBOPT_0x34
	SUBI R19,-LOW(1)
_0x2060029:
_0x2060020:
	LDI  R17,LOW(0)
_0x206002A:
	LDD  R30,Y+11
	CP   R30,R17
	BRLO _0x206002C
	RCALL SUBOPT_0x35
	RCALL SUBOPT_0x27
	RCALL SUBOPT_0x2B
	RCALL SUBOPT_0x7
	RCALL _floor
	RCALL SUBOPT_0x30
	RCALL SUBOPT_0x3
	RCALL SUBOPT_0x33
	RCALL __DIVF21
	RCALL __CFD1U
	MOV  R16,R30
	RCALL SUBOPT_0x36
	MOV  R30,R16
	SUBI R30,-LOW(48)
	ST   X,R30
	MOV  R30,R16
	CLR  R31
	CLR  R22
	CLR  R23
	RCALL __CDF1
	RCALL SUBOPT_0x35
	RCALL __MULF12
	RCALL SUBOPT_0x33
	RCALL __SWAPD12
	RCALL __SUBF12
	RCALL SUBOPT_0x34
	MOV  R30,R17
	SUBI R17,-1
	CPI  R30,0
	BRNE _0x206002A
	RCALL SUBOPT_0x36
	LDI  R30,LOW(46)
	ST   X,R30
	RJMP _0x206002A
_0x206002C:
	RCALL SUBOPT_0x37
	SBIW R30,1
	LDD  R26,Y+10
	STD  Z+0,R26
	CPI  R19,0
	BRGE _0x206002E
	NEG  R19
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(45)
	RJMP _0x2060113
_0x206002E:
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(43)
_0x2060113:
	ST   X,R30
	RCALL SUBOPT_0x37
	RCALL SUBOPT_0x37
	RCALL SUBOPT_0x38
	RCALL __DIVB21
	SUBI R30,-LOW(48)
	MOVW R26,R22
	ST   X,R30
	RCALL SUBOPT_0x37
	RCALL SUBOPT_0x38
	RCALL __MODB21
	SUBI R30,-LOW(48)
	MOVW R26,R22
	ST   X,R30
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(0)
	ST   X,R30
_0x20A0001:
	RCALL __LOADLOCR4
	ADIW R28,16
	RET
; .FEND
__print_G103:
; .FSTART __print_G103
	RCALL SUBOPT_0x14
	SBIW R28,63
	SBIW R28,17
	RCALL __SAVELOCR6
	LDI  R17,0
	__GETW1SX 88
	STD  Y+8,R30
	STD  Y+8+1,R31
	__GETW1SX 86
	STD  Y+6,R30
	STD  Y+6+1,R31
	RCALL SUBOPT_0x16
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	ST   X+,R30
	ST   X,R31
_0x2060030:
	MOVW R26,R28
	SUBI R26,LOW(-(92))
	SBCI R27,HIGH(-(92))
	RCALL SUBOPT_0x13
	SBIW R30,1
	LPM  R30,Z
	MOV  R18,R30
	CPI  R30,0
	BRNE PC+2
	RJMP _0x2060032
	MOV  R30,R17
	CPI  R30,0
	BRNE _0x2060036
	CPI  R18,37
	BRNE _0x2060037
	LDI  R17,LOW(1)
	RJMP _0x2060038
_0x2060037:
	RCALL SUBOPT_0x39
_0x2060038:
	RJMP _0x2060035
_0x2060036:
	CPI  R30,LOW(0x1)
	BRNE _0x2060039
	CPI  R18,37
	BRNE _0x206003A
	RCALL SUBOPT_0x39
	RJMP _0x2060114
_0x206003A:
	LDI  R17,LOW(2)
	LDI  R30,LOW(0)
	STD  Y+21,R30
	LDI  R16,LOW(0)
	CPI  R18,45
	BRNE _0x206003B
	LDI  R16,LOW(1)
	RJMP _0x2060035
_0x206003B:
	CPI  R18,43
	BRNE _0x206003C
	LDI  R30,LOW(43)
	STD  Y+21,R30
	RJMP _0x2060035
_0x206003C:
	CPI  R18,32
	BRNE _0x206003D
	LDI  R30,LOW(32)
	STD  Y+21,R30
	RJMP _0x2060035
_0x206003D:
	RJMP _0x206003E
_0x2060039:
	CPI  R30,LOW(0x2)
	BRNE _0x206003F
_0x206003E:
	LDI  R21,LOW(0)
	LDI  R17,LOW(3)
	CPI  R18,48
	BRNE _0x2060040
	ORI  R16,LOW(128)
	RJMP _0x2060035
_0x2060040:
	RJMP _0x2060041
_0x206003F:
	CPI  R30,LOW(0x3)
	BRNE _0x2060042
_0x2060041:
	CPI  R18,48
	BRLO _0x2060044
	CPI  R18,58
	BRLO _0x2060045
_0x2060044:
	RJMP _0x2060043
_0x2060045:
	LDI  R26,LOW(10)
	MUL  R21,R26
	MOV  R21,R0
	MOV  R30,R18
	SUBI R30,LOW(48)
	ADD  R21,R30
	RJMP _0x2060035
_0x2060043:
	LDI  R20,LOW(0)
	CPI  R18,46
	BRNE _0x2060046
	LDI  R17,LOW(4)
	RJMP _0x2060035
_0x2060046:
	RJMP _0x2060047
_0x2060042:
	CPI  R30,LOW(0x4)
	BRNE _0x2060049
	CPI  R18,48
	BRLO _0x206004B
	CPI  R18,58
	BRLO _0x206004C
_0x206004B:
	RJMP _0x206004A
_0x206004C:
	ORI  R16,LOW(32)
	LDI  R26,LOW(10)
	MUL  R20,R26
	MOV  R20,R0
	MOV  R30,R18
	SUBI R30,LOW(48)
	ADD  R20,R30
	RJMP _0x2060035
_0x206004A:
_0x2060047:
	CPI  R18,108
	BRNE _0x206004D
	ORI  R16,LOW(2)
	LDI  R17,LOW(5)
	RJMP _0x2060035
_0x206004D:
	RJMP _0x206004E
_0x2060049:
	CPI  R30,LOW(0x5)
	BREQ PC+2
	RJMP _0x2060035
_0x206004E:
	MOV  R30,R18
	CPI  R30,LOW(0x63)
	BRNE _0x2060053
	RCALL SUBOPT_0x3A
	RCALL SUBOPT_0x3B
	RCALL SUBOPT_0x3A
	LDD  R26,Z+4
	ST   -Y,R26
	RCALL SUBOPT_0x3C
	RJMP _0x2060054
_0x2060053:
	CPI  R30,LOW(0x45)
	BREQ _0x2060057
	CPI  R30,LOW(0x65)
	BRNE _0x2060058
_0x2060057:
	RJMP _0x2060059
_0x2060058:
	CPI  R30,LOW(0x66)
	BRNE _0x206005A
_0x2060059:
	RCALL SUBOPT_0x3D
	RCALL SUBOPT_0x3E
	RCALL __GETD1P
	RCALL SUBOPT_0x3F
	RCALL SUBOPT_0x40
	LDD  R26,Y+13
	TST  R26
	BRMI _0x206005B
	LDD  R26,Y+21
	CPI  R26,LOW(0x2B)
	BREQ _0x206005D
	CPI  R26,LOW(0x20)
	BREQ _0x206005F
	RJMP _0x2060060
_0x206005B:
	RCALL SUBOPT_0x41
	RCALL __ANEGF1
	RCALL SUBOPT_0x3F
	LDI  R30,LOW(45)
	STD  Y+21,R30
_0x206005D:
	SBRS R16,7
	RJMP _0x2060061
	LDD  R30,Y+21
	ST   -Y,R30
	RCALL SUBOPT_0x3C
	RJMP _0x2060062
_0x2060061:
_0x206005F:
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	ADIW R30,1
	RCALL SUBOPT_0x42
	SBIW R30,1
	LDD  R26,Y+21
	STD  Z+0,R26
_0x2060062:
_0x2060060:
	SBRS R16,5
	LDI  R20,LOW(6)
	CPI  R18,102
	BRNE _0x2060064
	RCALL SUBOPT_0x41
	RCALL __PUTPARD1
	ST   -Y,R20
	LDD  R26,Y+19
	LDD  R27,Y+19+1
	RCALL _ftoa
	RJMP _0x2060065
_0x2060064:
	RCALL SUBOPT_0x41
	RCALL __PUTPARD1
	ST   -Y,R20
	ST   -Y,R18
	LDD  R26,Y+20
	LDD  R27,Y+20+1
	RCALL __ftoe_G103
_0x2060065:
	RCALL SUBOPT_0x3D
	RCALL SUBOPT_0x43
	RJMP _0x2060066
_0x206005A:
	CPI  R30,LOW(0x73)
	BRNE _0x2060068
	RCALL SUBOPT_0x40
	RCALL SUBOPT_0x44
	RCALL SUBOPT_0x43
	RJMP _0x2060069
_0x2060068:
	CPI  R30,LOW(0x70)
	BRNE _0x206006B
	RCALL SUBOPT_0x40
	RCALL SUBOPT_0x44
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	RCALL _strlenf
	MOV  R17,R30
	ORI  R16,LOW(8)
_0x2060069:
	ANDI R16,LOW(127)
	CPI  R20,0
	BREQ _0x206006D
	CP   R20,R17
	BRLO _0x206006E
_0x206006D:
	RJMP _0x206006C
_0x206006E:
	MOV  R17,R20
_0x206006C:
_0x2060066:
	LDI  R20,LOW(0)
	LDI  R30,LOW(0)
	STD  Y+20,R30
	LDI  R19,LOW(0)
	RJMP _0x206006F
_0x206006B:
	CPI  R30,LOW(0x64)
	BREQ _0x2060072
	CPI  R30,LOW(0x69)
	BRNE _0x2060073
_0x2060072:
	ORI  R16,LOW(4)
	RJMP _0x2060074
_0x2060073:
	CPI  R30,LOW(0x75)
	BRNE _0x2060075
_0x2060074:
	LDI  R30,LOW(10)
	STD  Y+20,R30
	SBRS R16,1
	RJMP _0x2060076
	__GETD1N 0x3B9ACA00
	RCALL SUBOPT_0x45
	LDI  R17,LOW(10)
	RJMP _0x2060077
_0x2060076:
	__GETD1N 0x2710
	RCALL SUBOPT_0x45
	LDI  R17,LOW(5)
	RJMP _0x2060077
_0x2060075:
	CPI  R30,LOW(0x58)
	BRNE _0x2060079
	ORI  R16,LOW(8)
	RJMP _0x206007A
_0x2060079:
	CPI  R30,LOW(0x78)
	BREQ PC+2
	RJMP _0x20600B8
_0x206007A:
	LDI  R30,LOW(16)
	STD  Y+20,R30
	SBRS R16,1
	RJMP _0x206007C
	__GETD1N 0x10000000
	RCALL SUBOPT_0x45
	LDI  R17,LOW(8)
	RJMP _0x2060077
_0x206007C:
	__GETD1N 0x1000
	RCALL SUBOPT_0x45
	LDI  R17,LOW(4)
_0x2060077:
	CPI  R20,0
	BREQ _0x206007D
	ANDI R16,LOW(127)
	RJMP _0x206007E
_0x206007D:
	LDI  R20,LOW(1)
_0x206007E:
	SBRS R16,1
	RJMP _0x206007F
	RCALL SUBOPT_0x40
	RCALL SUBOPT_0x3E
	ADIW R26,4
	RCALL __GETD1P
	RJMP _0x2060115
_0x206007F:
	SBRS R16,2
	RJMP _0x2060081
	RCALL SUBOPT_0x40
	RCALL SUBOPT_0x3E
	ADIW R26,4
	RCALL __GETW1P
	RCALL __CWD1
	RJMP _0x2060115
_0x2060081:
	RCALL SUBOPT_0x40
	RCALL SUBOPT_0x3E
	ADIW R26,4
	RCALL __GETW1P
	RCALL SUBOPT_0x1
_0x2060115:
	__PUTD1S 10
	SBRS R16,2
	RJMP _0x2060083
	LDD  R26,Y+13
	TST  R26
	BRPL _0x2060084
	RCALL SUBOPT_0x41
	RCALL __ANEGD1
	RCALL SUBOPT_0x3F
	LDI  R30,LOW(45)
	STD  Y+21,R30
_0x2060084:
	LDD  R30,Y+21
	CPI  R30,0
	BREQ _0x2060085
	SUBI R17,-LOW(1)
	SUBI R20,-LOW(1)
	RJMP _0x2060086
_0x2060085:
	ANDI R16,LOW(251)
_0x2060086:
_0x2060083:
	MOV  R19,R20
_0x206006F:
	SBRC R16,0
	RJMP _0x2060087
_0x2060088:
	CP   R17,R21
	BRSH _0x206008B
	CP   R19,R21
	BRLO _0x206008C
_0x206008B:
	RJMP _0x206008A
_0x206008C:
	SBRS R16,7
	RJMP _0x206008D
	SBRS R16,2
	RJMP _0x206008E
	ANDI R16,LOW(251)
	LDD  R18,Y+21
	SUBI R17,LOW(1)
	RJMP _0x206008F
_0x206008E:
	LDI  R18,LOW(48)
_0x206008F:
	RJMP _0x2060090
_0x206008D:
	LDI  R18,LOW(32)
_0x2060090:
	RCALL SUBOPT_0x39
	SUBI R21,LOW(1)
	RJMP _0x2060088
_0x206008A:
_0x2060087:
_0x2060091:
	CP   R17,R20
	BRSH _0x2060093
	ORI  R16,LOW(16)
	SBRS R16,2
	RJMP _0x2060094
	RCALL SUBOPT_0x46
	BREQ _0x2060095
	SUBI R21,LOW(1)
_0x2060095:
	SUBI R17,LOW(1)
	SUBI R20,LOW(1)
_0x2060094:
	LDI  R30,LOW(48)
	ST   -Y,R30
	RCALL SUBOPT_0x3C
	CPI  R21,0
	BREQ _0x2060096
	SUBI R21,LOW(1)
_0x2060096:
	SUBI R20,LOW(1)
	RJMP _0x2060091
_0x2060093:
	MOV  R19,R17
	LDD  R30,Y+20
	CPI  R30,0
	BRNE _0x2060097
_0x2060098:
	CPI  R19,0
	BREQ _0x206009A
	SBRS R16,3
	RJMP _0x206009B
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	LPM  R18,Z+
	RCALL SUBOPT_0x42
	RJMP _0x206009C
_0x206009B:
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	LD   R18,X+
	STD  Y+14,R26
	STD  Y+14+1,R27
_0x206009C:
	RCALL SUBOPT_0x39
	CPI  R21,0
	BREQ _0x206009D
	SUBI R21,LOW(1)
_0x206009D:
	SUBI R19,LOW(1)
	RJMP _0x2060098
_0x206009A:
	RJMP _0x206009E
_0x2060097:
_0x20600A0:
	RCALL SUBOPT_0x47
	RCALL __DIVD21U
	MOV  R18,R30
	CPI  R18,10
	BRLO _0x20600A2
	SBRS R16,3
	RJMP _0x20600A3
	SUBI R18,-LOW(55)
	RJMP _0x20600A4
_0x20600A3:
	SUBI R18,-LOW(87)
_0x20600A4:
	RJMP _0x20600A5
_0x20600A2:
	SUBI R18,-LOW(48)
_0x20600A5:
	SBRC R16,4
	RJMP _0x20600A7
	CPI  R18,49
	BRSH _0x20600A9
	RCALL SUBOPT_0x48
	__CPD2N 0x1
	BRNE _0x20600A8
_0x20600A9:
	RJMP _0x20600AB
_0x20600A8:
	CP   R20,R19
	BRSH _0x2060116
	CP   R21,R19
	BRLO _0x20600AE
	SBRS R16,0
	RJMP _0x20600AF
_0x20600AE:
	RJMP _0x20600AD
_0x20600AF:
	LDI  R18,LOW(32)
	SBRS R16,7
	RJMP _0x20600B0
_0x2060116:
	LDI  R18,LOW(48)
_0x20600AB:
	ORI  R16,LOW(16)
	SBRS R16,2
	RJMP _0x20600B1
	RCALL SUBOPT_0x46
	BREQ _0x20600B2
	SUBI R21,LOW(1)
_0x20600B2:
_0x20600B1:
_0x20600B0:
_0x20600A7:
	RCALL SUBOPT_0x39
	CPI  R21,0
	BREQ _0x20600B3
	SUBI R21,LOW(1)
_0x20600B3:
_0x20600AD:
	SUBI R19,LOW(1)
	RCALL SUBOPT_0x47
	RCALL __MODD21U
	RCALL SUBOPT_0x3F
	LDD  R30,Y+20
	RCALL SUBOPT_0x48
	CLR  R31
	CLR  R22
	CLR  R23
	RCALL __DIVD21U
	RCALL SUBOPT_0x45
	__GETD1S 16
	RCALL __CPD10
	BREQ _0x20600A1
	RJMP _0x20600A0
_0x20600A1:
_0x206009E:
	SBRS R16,0
	RJMP _0x20600B4
_0x20600B5:
	CPI  R21,0
	BREQ _0x20600B7
	SUBI R21,LOW(1)
	LDI  R30,LOW(32)
	ST   -Y,R30
	RCALL SUBOPT_0x3C
	RJMP _0x20600B5
_0x20600B7:
_0x20600B4:
_0x20600B8:
_0x2060054:
_0x2060114:
	LDI  R17,LOW(0)
_0x2060035:
	RJMP _0x2060030
_0x2060032:
	RCALL SUBOPT_0x16
	RCALL __GETW1P
	RCALL __LOADLOCR6
	ADIW R28,63
	ADIW R28,31
	RET
; .FEND
_printf:
; .FSTART _printf
	PUSH R15
	MOV  R15,R24
	SBIW R28,6
	RCALL __SAVELOCR2
	MOVW R26,R28
	ADIW R26,4
	RCALL __ADDW2R15
	MOVW R16,R26
	LDI  R30,LOW(0)
	STD  Y+4,R30
	STD  Y+4+1,R30
	STD  Y+6,R30
	STD  Y+6+1,R30
	MOVW R26,R28
	ADIW R26,8
	RCALL __ADDW2R15
	RCALL __GETW1P
	RCALL SUBOPT_0xF
	ST   -Y,R17
	ST   -Y,R16
	LDI  R30,LOW(_put_usart_G103)
	LDI  R31,HIGH(_put_usart_G103)
	RCALL SUBOPT_0xF
	MOVW R26,R28
	ADIW R26,8
	RCALL __print_G103
	RCALL __LOADLOCR2
	ADIW R28,8
	POP  R15
	RET
; .FEND

	.CSEG
_isdigit:
; .FSTART _isdigit
	ST   -Y,R26
    ldi  r30,1
    ld   r31,y+
    cpi  r31,'0'
    brlo isdigit0
    cpi  r31,'9'+1
    brlo isdigit1
isdigit0:
    clr  r30
isdigit1:
    ret
; .FEND
_isspace:
; .FSTART _isspace
	ST   -Y,R26
    ldi  r30,1
    ld   r31,y+
    cpi  r31,' '
    breq isspace1
    cpi  r31,9
    brlo isspace0
    cpi  r31,13+1
    brlo isspace1
isspace0:
    clr  r30
isspace1:
    ret
; .FEND

	.DSEG
_error:
	.BYTE 0x4
_pre_error:
	.BYTE 0x4
_Pout:
	.BYTE 0x4
_Iout:
	.BYTE 0x4
_Dout:
	.BYTE 0x4
_out:
	.BYTE 0x4
_integral:
	.BYTE 0x4
_derivative:
	.BYTE 0x4
_Kd:
	.BYTE 0x2
_ADC_val_0:
	.BYTE 0x4
_ADC_val_1:
	.BYTE 0x4
_Volt_0:
	.BYTE 0x4
_Weight_0:
	.BYTE 0x4
_Volt_1:
	.BYTE 0x4
_Weight_1:
	.BYTE 0x4
_str2:
	.BYTE 0x14
_function:
	.BYTE 0x190
_number:
	.BYTE 0x2
_i:
	.BYTE 0x2
_j:
	.BYTE 0x2
_l:
	.BYTE 0x2
_spd1:
	.BYTE 0x4
_spd3:
	.BYTE 0x4
_spd4:
	.BYTE 0x4
_Ts:
	.BYTE 0x4
_cmd:
	.BYTE 0x2
_output:
	.BYTE 0x4
_func_prevnumber:
	.BYTE 0x2
_func_number:
	.BYTE 0x2
_timer_cnt:
	.BYTE 0x4
_capture_pulse:
	.BYTE 0x4
_rx_buffer:
	.BYTE 0x8
_rx_wr_index:
	.BYTE 0x1
_rx_rd_index:
	.BYTE 0x1
_rx_counter:
	.BYTE 0x1
__seed_G102:
	.BYTE 0x4

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x0:
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x1:
	CLR  R22
	CLR  R23
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x2:
	RCALL __PUTPARD2
	RCALL __GETD2S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x3:
	__GETD1S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x4:
	LDS  R30,_error
	LDS  R31,_error+1
	LDS  R22,_error+2
	LDS  R23,_error+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x5:
	RCALL __CWD2
	RCALL __CDF2
	RCALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x6:
	RCALL __CWD1
	RCALL __CDF1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x7:
	MOVW R26,R30
	MOVW R24,R22
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x8:
	__GETD1N 0x3DCCCCCD
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x9:
	LDS  R26,_out
	LDS  R27,_out+1
	LDS  R24,_out+2
	LDS  R25,_out+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xA:
	__GETD1N 0x437F0000
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:22 WORDS
SUBOPT_0xB:
	__GETD1N 0x41200000
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0xC:
	LDI  R30,LOW(0)
	STS  _i,R30
	STS  _i+1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0xD:
	LDS  R26,_i
	LDS  R27,_i+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0xE:
	RCALL SUBOPT_0xD
	LDI  R30,LOW(50)
	RCALL __MULB1W2U
	SUBI R30,LOW(-_function)
	SBCI R31,HIGH(-_function)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 24 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0xF:
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x10:
	LDS  R30,_number
	LDS  R31,_number+1
	SBIW R30,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x11:
	LDS  R30,_i
	LDS  R31,_i+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x12:
	LDS  R26,_number
	LDS  R27,_number+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:14 WORDS
SUBOPT_0x13:
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 15 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x14:
	ST   -Y,R27
	ST   -Y,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x15:
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	STS  _l,R30
	STS  _l+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x16:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x17:
	LDS  R30,_cmd
	LDS  R31,_cmd+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:86 WORDS
SUBOPT_0x18:
	RCALL _PID_controller
	STS  _output,R30
	STS  _output+1,R31
	STS  _output+2,R22
	STS  _output+3,R23
	RCALL __CFD1U
	OUT  0x23,R30
	CLR  R4
	CLR  R5
	CLR  R6
	CLR  R7
	LDI  R30,LOW(0)
	STS  _capture_pulse,R30
	STS  _capture_pulse+1,R30
	STS  _capture_pulse+2,R30
	STS  _capture_pulse+3,R30
	__POINTW1FN _0x0,0
	RCALL SUBOPT_0xF
	RCALL SUBOPT_0x17
	RCALL __CWD1
	RCALL __PUTPARD1
	LDI  R24,4
	RCALL _printf
	ADIW R28,6
	__POINTW1FN _0x0,4
	RJMP SUBOPT_0xF

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x19:
	RCALL __PUTPARD1
	LDI  R24,4
	RCALL _printf
	ADIW R28,6
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	CP   R30,R8
	CPC  R31,R9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:116 WORDS
SUBOPT_0x1A:
	LDI  R26,LOW(0)
	RCALL _read_adc
	RCALL SUBOPT_0x1
	STS  _ADC_val_0,R30
	STS  _ADC_val_0+1,R31
	STS  _ADC_val_0+2,R22
	STS  _ADC_val_0+3,R23
	__GETD2N 0x5
	RCALL __MULD12
	RCALL __CDF1
	RCALL SUBOPT_0x7
	__GETD1N 0x447FC000
	RCALL __DIVF21
	STS  _Volt_0,R30
	STS  _Volt_0+1,R31
	STS  _Volt_0+2,R22
	STS  _Volt_0+3,R23
	LDS  R26,_Volt_0
	LDS  R27,_Volt_0+1
	LDS  R24,_Volt_0+2
	LDS  R25,_Volt_0+3
	__GETD1N 0x3D4CCCCD
	RCALL __DIVF21
	STS  _Weight_0,R30
	STS  _Weight_0+1,R31
	STS  _Weight_0+2,R22
	STS  _Weight_0+3,R23
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:50 WORDS
SUBOPT_0x1B:
	RCALL SUBOPT_0xF
	LDS  R30,_ADC_val_0
	LDS  R31,_ADC_val_0+1
	LDS  R22,_ADC_val_0+2
	LDS  R23,_ADC_val_0+3
	RCALL __PUTPARD1
	LDS  R30,_Volt_0
	LDS  R31,_Volt_0+1
	LDS  R22,_Volt_0+2
	LDS  R23,_Volt_0+3
	RCALL __PUTPARD1
	LDS  R30,_Weight_0
	LDS  R31,_Weight_0+1
	LDS  R22,_Weight_0+2
	LDS  R23,_Weight_0+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:174 WORDS
SUBOPT_0x1C:
	LDI  R26,LOW(1)
	RCALL _read_adc
	RCALL SUBOPT_0x1
	STS  _ADC_val_1,R30
	STS  _ADC_val_1+1,R31
	STS  _ADC_val_1+2,R22
	STS  _ADC_val_1+3,R23
	__GETD2N 0x5
	RCALL __MULD12
	RCALL __CDF1
	RCALL SUBOPT_0x7
	__GETD1N 0x447FC000
	RCALL __DIVF21
	STS  _Volt_1,R30
	STS  _Volt_1+1,R31
	STS  _Volt_1+2,R22
	STS  _Volt_1+3,R23
	LDS  R26,_Volt_1
	LDS  R27,_Volt_1+1
	LDS  R24,_Volt_1+2
	LDS  R25,_Volt_1+3
	__GETD1N 0x3D4CCCCD
	RCALL __DIVF21
	STS  _Weight_1,R30
	STS  _Weight_1+1,R31
	STS  _Weight_1+2,R22
	STS  _Weight_1+3,R23
	__POINTW1FN _0x0,29
	RCALL SUBOPT_0xF
	LDS  R30,_ADC_val_1
	LDS  R31,_ADC_val_1+1
	LDS  R22,_ADC_val_1+2
	LDS  R23,_ADC_val_1+3
	RCALL __PUTPARD1
	LDS  R30,_Volt_1
	LDS  R31,_Volt_1+1
	LDS  R22,_Volt_1+2
	LDS  R23,_Volt_1+3
	RCALL __PUTPARD1
	LDS  R30,_Weight_1
	LDS  R31,_Weight_1+1
	LDS  R22,_Weight_1+2
	LDS  R23,_Weight_1+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x1D:
	LDI  R24,12
	RCALL _printf
	ADIW R28,14
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x1E:
	RCALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	LDS  R30,_Ts
	LDS  R31,_Ts+1
	LDS  R22,_Ts+2
	LDS  R23,_Ts+3
	RCALL __CDF1
	RCALL __DIVF21
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1F:
	RCALL __GETD1S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x20:
	RCALL SUBOPT_0x14
	SBIW R28,4
	LDI  R30,LOW(0)
	ST   Y,R30
	STD  Y+1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x21:
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	RJMP SUBOPT_0xF

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x22:
	__GETD1S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x23:
	__PUTD1S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:14 WORDS
SUBOPT_0x24:
	RCALL SUBOPT_0x16
	ADIW R26,1
	STD  Y+6,R26
	STD  Y+6+1,R27
	SBIW R26,1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x25:
	MOV  R30,R17
	SUBI R17,1
	CPI  R30,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x26:
	__GETD2S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x27:
	RCALL SUBOPT_0x8
	RCALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x28:
	__PUTD1S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x29:
	__GETD1S 2
	__GETD2S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x2A:
	RCALL SUBOPT_0xB
	RCALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x2B:
	__GETD2N 0x3F000000
	RCALL __ADDF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x2C:
	MOV  R30,R16
	SUBI R30,-LOW(48)
	ST   X,R30
	MOV  R30,R16
	LDI  R31,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x2D:
	__GETD2S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x2E:
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x2F:
	__GETD2S 4
	RJMP SUBOPT_0x2A

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x30:
	__PUTD1S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x31:
	__GETD1S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x32:
	RCALL SUBOPT_0x3
	__GETD2S 12
	RCALL __CMPF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x33:
	__GETD2S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x34:
	__PUTD1S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x35:
	__GETD2S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x36:
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	ADIW R26,1
	STD  Y+8,R26
	STD  Y+8+1,R27
	SBIW R26,1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x37:
	RCALL SUBOPT_0x2E
	ADIW R30,1
	STD  Y+8,R30
	STD  Y+8+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x38:
	SBIW R30,1
	MOVW R22,R30
	MOV  R26,R19
	LDI  R30,LOW(10)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x39:
	ST   -Y,R18
	LDD  R26,Y+7
	LDD  R27,Y+7+1
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:33 WORDS
SUBOPT_0x3A:
	__GETW1SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:28 WORDS
SUBOPT_0x3B:
	SBIW R30,4
	__PUTW1SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x3C:
	LDD  R26,Y+7
	LDD  R27,Y+7+1
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x3D:
	MOVW R30,R28
	ADIW R30,22
	STD  Y+14,R30
	STD  Y+14+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:23 WORDS
SUBOPT_0x3E:
	__GETW2SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x3F:
	__PUTD1S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x40:
	RCALL SUBOPT_0x3A
	RJMP SUBOPT_0x3B

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x41:
	__GETD1S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x42:
	STD  Y+14,R30
	STD  Y+14+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x43:
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	RCALL _strlen
	MOV  R17,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x44:
	RCALL SUBOPT_0x3E
	ADIW R26,4
	RCALL __GETW1P
	RJMP SUBOPT_0x42

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0x45:
	__PUTD1S 16
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:14 WORDS
SUBOPT_0x46:
	ANDI R16,LOW(251)
	LDD  R30,Y+21
	ST   -Y,R30
	__GETW2SX 87
	__GETW1SX 89
	ICALL
	CPI  R21,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x47:
	__GETD1S 16
	__GETD2S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x48:
	__GETD2S 16
	RET


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	wdr
	__DELAY_USW 0xACD
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__ANEGF1:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __ANEGF10
	SUBI R23,0x80
__ANEGF10:
	RET

__ROUND_REPACK:
	TST  R21
	BRPL __REPACK
	CPI  R21,0x80
	BRNE __ROUND_REPACK0
	SBRS R30,0
	RJMP __REPACK
__ROUND_REPACK0:
	ADIW R30,1
	ADC  R22,R25
	ADC  R23,R25
	BRVS __REPACK1

__REPACK:
	LDI  R21,0x80
	EOR  R21,R23
	BRNE __REPACK0
	PUSH R21
	RJMP __ZERORES
__REPACK0:
	CPI  R21,0xFF
	BREQ __REPACK1
	LSL  R22
	LSL  R0
	ROR  R21
	ROR  R22
	MOV  R23,R21
	RET
__REPACK1:
	PUSH R21
	TST  R0
	BRMI __REPACK2
	RJMP __MAXRES
__REPACK2:
	RJMP __MINRES

__UNPACK:
	LDI  R21,0x80
	MOV  R1,R25
	AND  R1,R21
	LSL  R24
	ROL  R25
	EOR  R25,R21
	LSL  R21
	ROR  R24

__UNPACK1:
	LDI  R21,0x80
	MOV  R0,R23
	AND  R0,R21
	LSL  R22
	ROL  R23
	EOR  R23,R21
	LSL  R21
	ROR  R22
	RET

__CFD1U:
	SET
	RJMP __CFD1U0
__CFD1:
	CLT
__CFD1U0:
	PUSH R21
	RCALL __UNPACK1
	CPI  R23,0x80
	BRLO __CFD10
	CPI  R23,0xFF
	BRCC __CFD10
	RJMP __ZERORES
__CFD10:
	LDI  R21,22
	SUB  R21,R23
	BRPL __CFD11
	NEG  R21
	CPI  R21,8
	BRTC __CFD19
	CPI  R21,9
__CFD19:
	BRLO __CFD17
	SER  R30
	SER  R31
	SER  R22
	LDI  R23,0x7F
	BLD  R23,7
	RJMP __CFD15
__CFD17:
	CLR  R23
	TST  R21
	BREQ __CFD15
__CFD18:
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R23
	DEC  R21
	BRNE __CFD18
	RJMP __CFD15
__CFD11:
	CLR  R23
__CFD12:
	CPI  R21,8
	BRLO __CFD13
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R23
	SUBI R21,8
	RJMP __CFD12
__CFD13:
	TST  R21
	BREQ __CFD15
__CFD14:
	LSR  R23
	ROR  R22
	ROR  R31
	ROR  R30
	DEC  R21
	BRNE __CFD14
__CFD15:
	TST  R0
	BRPL __CFD16
	RCALL __ANEGD1
__CFD16:
	POP  R21
	RET

__CDF1U:
	SET
	RJMP __CDF1U0
__CDF1:
	CLT
__CDF1U0:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __CDF10
	CLR  R0
	BRTS __CDF11
	TST  R23
	BRPL __CDF11
	COM  R0
	RCALL __ANEGD1
__CDF11:
	MOV  R1,R23
	LDI  R23,30
	TST  R1
__CDF12:
	BRMI __CDF13
	DEC  R23
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R1
	RJMP __CDF12
__CDF13:
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R1
	PUSH R21
	RCALL __REPACK
	POP  R21
__CDF10:
	RET

__SWAPACC:
	PUSH R20
	MOVW R20,R30
	MOVW R30,R26
	MOVW R26,R20
	MOVW R20,R22
	MOVW R22,R24
	MOVW R24,R20
	MOV  R20,R0
	MOV  R0,R1
	MOV  R1,R20
	POP  R20
	RET

__UADD12:
	ADD  R30,R26
	ADC  R31,R27
	ADC  R22,R24
	RET

__NEGMAN1:
	COM  R30
	COM  R31
	COM  R22
	SUBI R30,-1
	SBCI R31,-1
	SBCI R22,-1
	RET

__SUBF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129
	LDI  R21,0x80
	EOR  R1,R21

	RJMP __ADDF120

__ADDF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129

__ADDF120:
	CPI  R23,0x80
	BREQ __ADDF128
__ADDF121:
	MOV  R21,R23
	SUB  R21,R25
	BRVS __ADDF1211
	BRPL __ADDF122
	RCALL __SWAPACC
	RJMP __ADDF121
__ADDF122:
	CPI  R21,24
	BRLO __ADDF123
	CLR  R26
	CLR  R27
	CLR  R24
__ADDF123:
	CPI  R21,8
	BRLO __ADDF124
	MOV  R26,R27
	MOV  R27,R24
	CLR  R24
	SUBI R21,8
	RJMP __ADDF123
__ADDF124:
	TST  R21
	BREQ __ADDF126
__ADDF125:
	LSR  R24
	ROR  R27
	ROR  R26
	DEC  R21
	BRNE __ADDF125
__ADDF126:
	MOV  R21,R0
	EOR  R21,R1
	BRMI __ADDF127
	RCALL __UADD12
	BRCC __ADDF129
	ROR  R22
	ROR  R31
	ROR  R30
	INC  R23
	BRVC __ADDF129
	RJMP __MAXRES
__ADDF128:
	RCALL __SWAPACC
__ADDF129:
	RCALL __REPACK
	POP  R21
	RET
__ADDF1211:
	BRCC __ADDF128
	RJMP __ADDF129
__ADDF127:
	SUB  R30,R26
	SBC  R31,R27
	SBC  R22,R24
	BREQ __ZERORES
	BRCC __ADDF1210
	COM  R0
	RCALL __NEGMAN1
__ADDF1210:
	TST  R22
	BRMI __ADDF129
	LSL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVC __ADDF1210

__ZERORES:
	CLR  R30
	CLR  R31
	CLR  R22
	CLR  R23
	POP  R21
	RET

__MINRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	SER  R23
	POP  R21
	RET

__MAXRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	LDI  R23,0x7F
	POP  R21
	RET

__MULF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BREQ __ZERORES
	CPI  R25,0x80
	BREQ __ZERORES
	EOR  R0,R1
	SEC
	ADC  R23,R25
	BRVC __MULF124
	BRLT __ZERORES
__MULF125:
	TST  R0
	BRMI __MINRES
	RJMP __MAXRES
__MULF124:
	PUSH R0
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R17
	CLR  R18
	CLR  R25
	MUL  R22,R24
	MOVW R20,R0
	MUL  R24,R31
	MOV  R19,R0
	ADD  R20,R1
	ADC  R21,R25
	MUL  R22,R27
	ADD  R19,R0
	ADC  R20,R1
	ADC  R21,R25
	MUL  R24,R30
	RCALL __MULF126
	MUL  R27,R31
	RCALL __MULF126
	MUL  R22,R26
	RCALL __MULF126
	MUL  R27,R30
	RCALL __MULF127
	MUL  R26,R31
	RCALL __MULF127
	MUL  R26,R30
	ADD  R17,R1
	ADC  R18,R25
	ADC  R19,R25
	ADC  R20,R25
	ADC  R21,R25
	MOV  R30,R19
	MOV  R31,R20
	MOV  R22,R21
	MOV  R21,R18
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	POP  R0
	TST  R22
	BRMI __MULF122
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	RJMP __MULF123
__MULF122:
	INC  R23
	BRVS __MULF125
__MULF123:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__MULF127:
	ADD  R17,R0
	ADC  R18,R1
	ADC  R19,R25
	RJMP __MULF128
__MULF126:
	ADD  R18,R0
	ADC  R19,R1
__MULF128:
	ADC  R20,R25
	ADC  R21,R25
	RET

__DIVF21:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BRNE __DIVF210
	TST  R1
__DIVF211:
	BRPL __DIVF219
	RJMP __MINRES
__DIVF219:
	RJMP __MAXRES
__DIVF210:
	CPI  R25,0x80
	BRNE __DIVF218
__DIVF217:
	RJMP __ZERORES
__DIVF218:
	EOR  R0,R1
	SEC
	SBC  R25,R23
	BRVC __DIVF216
	BRLT __DIVF217
	TST  R0
	RJMP __DIVF211
__DIVF216:
	MOV  R23,R25
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R1
	CLR  R17
	CLR  R18
	CLR  R19
	CLR  R20
	CLR  R21
	LDI  R25,32
__DIVF212:
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	CPC  R20,R17
	BRLO __DIVF213
	SUB  R26,R30
	SBC  R27,R31
	SBC  R24,R22
	SBC  R20,R17
	SEC
	RJMP __DIVF214
__DIVF213:
	CLC
__DIVF214:
	ROL  R21
	ROL  R18
	ROL  R19
	ROL  R1
	ROL  R26
	ROL  R27
	ROL  R24
	ROL  R20
	DEC  R25
	BRNE __DIVF212
	MOVW R30,R18
	MOV  R22,R1
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	TST  R22
	BRMI __DIVF215
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVS __DIVF217
__DIVF215:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__CMPF12:
	TST  R25
	BRMI __CMPF120
	TST  R23
	BRMI __CMPF121
	CP   R25,R23
	BRLO __CMPF122
	BRNE __CMPF121
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	BRLO __CMPF122
	BREQ __CMPF123
__CMPF121:
	CLZ
	CLC
	RET
__CMPF122:
	CLZ
	SEC
	RET
__CMPF123:
	SEZ
	CLC
	RET
__CMPF120:
	TST  R23
	BRPL __CMPF122
	CP   R25,R23
	BRLO __CMPF121
	BRNE __CMPF122
	CP   R30,R26
	CPC  R31,R27
	CPC  R22,R24
	BRLO __CMPF122
	BREQ __CMPF123
	RJMP __CMPF121

__ADDW2R15:
	CLR  R0
	ADD  R26,R15
	ADC  R27,R0
	RET

__ANEGD1:
	COM  R31
	COM  R22
	COM  R23
	NEG  R30
	SBCI R31,-1
	SBCI R22,-1
	SBCI R23,-1
	RET

__CBD1:
	MOV  R31,R30
	ADD  R31,R31
	SBC  R31,R31
	MOV  R22,R31
	MOV  R23,R31
	RET

__CWD1:
	MOV  R22,R31
	ADD  R22,R22
	SBC  R22,R22
	MOV  R23,R22
	RET

__CWD2:
	MOV  R24,R27
	ADD  R24,R24
	SBC  R24,R24
	MOV  R25,R24
	RET

__EQB12:
	CP   R30,R26
	LDI  R30,1
	BREQ __EQB12T
	CLR  R30
__EQB12T:
	RET

__MULD12U:
	MUL  R23,R26
	MOV  R23,R0
	MUL  R22,R27
	ADD  R23,R0
	MUL  R31,R24
	ADD  R23,R0
	MUL  R30,R25
	ADD  R23,R0
	MUL  R22,R26
	MOV  R22,R0
	ADD  R23,R1
	MUL  R31,R27
	ADD  R22,R0
	ADC  R23,R1
	MUL  R30,R24
	ADD  R22,R0
	ADC  R23,R1
	CLR  R24
	MUL  R31,R26
	MOV  R31,R0
	ADD  R22,R1
	ADC  R23,R24
	MUL  R30,R27
	ADD  R31,R0
	ADC  R22,R1
	ADC  R23,R24
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	ADC  R22,R24
	ADC  R23,R24
	RET

__MULB1W2U:
	MOV  R22,R30
	MUL  R22,R26
	MOVW R30,R0
	MUL  R22,R27
	ADD  R31,R0
	RET

__MULD12:
	RCALL __CHKSIGND
	RCALL __MULD12U
	BRTC __MULD121
	RCALL __ANEGD1
__MULD121:
	RET

__DIVB21U:
	CLR  R0
	LDI  R25,8
__DIVB21U1:
	LSL  R26
	ROL  R0
	SUB  R0,R30
	BRCC __DIVB21U2
	ADD  R0,R30
	RJMP __DIVB21U3
__DIVB21U2:
	SBR  R26,1
__DIVB21U3:
	DEC  R25
	BRNE __DIVB21U1
	MOV  R30,R26
	MOV  R26,R0
	RET

__DIVB21:
	RCALL __CHKSIGNB
	RCALL __DIVB21U
	BRTC __DIVB211
	NEG  R30
__DIVB211:
	RET

__DIVD21U:
	PUSH R19
	PUSH R20
	PUSH R21
	CLR  R0
	CLR  R1
	CLR  R20
	CLR  R21
	LDI  R19,32
__DIVD21U1:
	LSL  R26
	ROL  R27
	ROL  R24
	ROL  R25
	ROL  R0
	ROL  R1
	ROL  R20
	ROL  R21
	SUB  R0,R30
	SBC  R1,R31
	SBC  R20,R22
	SBC  R21,R23
	BRCC __DIVD21U2
	ADD  R0,R30
	ADC  R1,R31
	ADC  R20,R22
	ADC  R21,R23
	RJMP __DIVD21U3
__DIVD21U2:
	SBR  R26,1
__DIVD21U3:
	DEC  R19
	BRNE __DIVD21U1
	MOVW R30,R26
	MOVW R22,R24
	MOVW R26,R0
	MOVW R24,R20
	POP  R21
	POP  R20
	POP  R19
	RET

__MODB21:
	CLT
	SBRS R26,7
	RJMP __MODB211
	NEG  R26
	SET
__MODB211:
	SBRC R30,7
	NEG  R30
	RCALL __DIVB21U
	MOV  R30,R26
	BRTC __MODB212
	NEG  R30
__MODB212:
	RET

__MODD21U:
	RCALL __DIVD21U
	MOVW R30,R26
	MOVW R22,R24
	RET

__CHKSIGNB:
	CLT
	SBRS R30,7
	RJMP __CHKSB1
	NEG  R30
	SET
__CHKSB1:
	SBRS R26,7
	RJMP __CHKSB2
	NEG  R26
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSB2:
	RET

__CHKSIGND:
	CLT
	SBRS R23,7
	RJMP __CHKSD1
	RCALL __ANEGD1
	SET
__CHKSD1:
	SBRS R25,7
	RJMP __CHKSD2
	CLR  R0
	COM  R26
	COM  R27
	COM  R24
	COM  R25
	ADIW R26,1
	ADC  R24,R0
	ADC  R25,R0
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSD2:
	RET

__GETW1P:
	LD   R30,X+
	LD   R31,X
	SBIW R26,1
	RET

__GETD1P:
	LD   R30,X+
	LD   R31,X+
	LD   R22,X+
	LD   R23,X
	SBIW R26,3
	RET

__GETD1P_INC:
	LD   R30,X+
	LD   R31,X+
	LD   R22,X+
	LD   R23,X+
	RET

__PUTDP1_DEC:
	ST   -X,R23
	ST   -X,R22
	ST   -X,R31
	ST   -X,R30
	RET

__GETD1S0:
	LD   R30,Y
	LDD  R31,Y+1
	LDD  R22,Y+2
	LDD  R23,Y+3
	RET

__GETD2S0:
	LD   R26,Y
	LDD  R27,Y+1
	LDD  R24,Y+2
	LDD  R25,Y+3
	RET

__PUTD1S0:
	ST   Y,R30
	STD  Y+1,R31
	STD  Y+2,R22
	STD  Y+3,R23
	RET

__PUTPARD1:
	ST   -Y,R23
	ST   -Y,R22
	ST   -Y,R31
	ST   -Y,R30
	RET

__PUTPARD2:
	ST   -Y,R25
	ST   -Y,R24
	ST   -Y,R27
	ST   -Y,R26
	RET

__CDF2U:
	SET
	RJMP __CDF2U0
__CDF2:
	CLT
__CDF2U0:
	RCALL __SWAPD12
	RCALL __CDF1U0

__SWAPD12:
	MOV  R1,R24
	MOV  R24,R22
	MOV  R22,R1
	MOV  R1,R25
	MOV  R25,R23
	MOV  R23,R1

__SWAPW12:
	MOV  R1,R27
	MOV  R27,R31
	MOV  R31,R1

__SWAPB12:
	MOV  R1,R26
	MOV  R26,R30
	MOV  R30,R1
	RET

__CPD10:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	RET

__CPW02:
	CLR  R0
	CP   R0,R26
	CPC  R0,R27
	RET

__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

;END OF CODE MARKER
__END_OF_CODE:
