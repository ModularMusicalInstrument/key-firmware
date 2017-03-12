   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _User_Key_Pressed:
  18  0000 00            	dc.b	0
  19  0001               _previous_button_state:
  20  0001 aa            	dc.b	170
  21  0002               _button_state:
  22  0002 00            	dc.b	0
  23  0003               _PeriodNumber:
  24  0003 00            	dc.b	0
  25  0004               _i:
  26  0004 00            	dc.b	0
  27  0005               _NumOfBytes:
  28  0005 07            	dc.b	7
  29  0006               _next_case:
  30  0006 00            	dc.b	0
  31  0007               _velocity:
  32  0007 00            	dc.b	0
  33  0008               _received:
  34  0008 0e            	dc.b	14
  35  0009               _received2:
  36  0009 7c            	dc.b	124
  37  000a               _ping_received:
  38  000a 00            	dc.b	0
  93                     ; 155 void main(void)
  93                     ; 156 {
  95                     	switch	.text
  96  0000               _main:
 100                     ; 158 	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 102  0000 4bd0          	push	#208
 103  0002 4b04          	push	#4
 104  0004 ae5000        	ldw	x,#20480
 105  0007 cd0000        	call	_GPIO_Init
 107  000a 85            	popw	x
 108                     ; 159 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 110  000b 4b04          	push	#4
 111  000d ae5000        	ldw	x,#20480
 112  0010 cd0000        	call	_GPIO_WriteHigh
 114  0013 84            	pop	a
 115                     ; 160 	GPIO_WriteLow(TRIGGER_PORT,TRIGGER_PIN);
 117  0014 4b04          	push	#4
 118  0016 ae5000        	ldw	x,#20480
 119  0019 cd0000        	call	_GPIO_WriteLow
 121  001c 84            	pop	a
 122                     ; 161 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 124  001d 4b04          	push	#4
 125  001f ae5000        	ldw	x,#20480
 126  0022 cd0000        	call	_GPIO_WriteHigh
 128  0025 84            	pop	a
 129                     ; 164 	CLK_DeInit();  
 131  0026 cd0000        	call	_CLK_DeInit
 133                     ; 165   CLK_HSICmd(ENABLE);
 135  0029 a601          	ld	a,#1
 136  002b cd0000        	call	_CLK_HSICmd
 138                     ; 166   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 140  002e 4f            	clr	a
 141  002f cd0000        	call	_CLK_HSIPrescalerConfig
 143                     ; 167   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 145  0032 a680          	ld	a,#128
 146  0034 cd0000        	call	_CLK_SYSCLKConfig
 148                     ; 170 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 150  0037 ae0100        	ldw	x,#256
 151  003a cd0000        	call	_CLK_PeripheralClockConfig
 153                     ; 171 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 155  003d ae0300        	ldw	x,#768
 156  0040 cd0000        	call	_CLK_PeripheralClockConfig
 158                     ; 172 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 160  0043 ae0300        	ldw	x,#768
 161  0046 cd0000        	call	_CLK_PeripheralClockConfig
 163                     ; 173 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 165  0049 ae0300        	ldw	x,#768
 166  004c cd0000        	call	_CLK_PeripheralClockConfig
 168                     ; 174 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, DISABLE);
 170  004f ae0400        	ldw	x,#1024
 171  0052 cd0000        	call	_CLK_PeripheralClockConfig
 173                     ; 175 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, DISABLE);
 175  0055 ae0500        	ldw	x,#1280
 176  0058 cd0000        	call	_CLK_PeripheralClockConfig
 178                     ; 176 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 180  005b ae0600        	ldw	x,#1536
 181  005e cd0000        	call	_CLK_PeripheralClockConfig
 183                     ; 177 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 185  0061 ae0500        	ldw	x,#1280
 186  0064 cd0000        	call	_CLK_PeripheralClockConfig
 188                     ; 178 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 190  0067 ae0700        	ldw	x,#1792
 191  006a cd0000        	call	_CLK_PeripheralClockConfig
 193                     ; 179 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 195  006d ae1300        	ldw	x,#4864
 196  0070 cd0000        	call	_CLK_PeripheralClockConfig
 198                     ; 180 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 200  0073 ae1200        	ldw	x,#4608
 201  0076 cd0000        	call	_CLK_PeripheralClockConfig
 203                     ; 181 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
 205  0079 ae1700        	ldw	x,#5888
 206  007c cd0000        	call	_CLK_PeripheralClockConfig
 208                     ; 182 	CLK_FastHaltWakeUpCmd(DISABLE);
 210  007f 4f            	clr	a
 211  0080 cd0000        	call	_CLK_FastHaltWakeUpCmd
 213                     ; 188 	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
 215  0083 4b60          	push	#96
 216  0085 4b20          	push	#32
 217  0087 ae500a        	ldw	x,#20490
 218  008a cd0000        	call	_GPIO_Init
 220  008d 85            	popw	x
 221                     ; 189 	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
 223  008e 4b60          	push	#96
 224  0090 4b08          	push	#8
 225  0092 ae500a        	ldw	x,#20490
 226  0095 cd0000        	call	_GPIO_Init
 228  0098 85            	popw	x
 229                     ; 195 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 231  0099 ae0202        	ldw	x,#514
 232  009c cd0000        	call	_EXTI_SetExtIntSensitivity
 234                     ; 198   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 236  009f 4be0          	push	#224
 237  00a1 4b02          	push	#2
 238  00a3 ae5000        	ldw	x,#20480
 239  00a6 cd0000        	call	_GPIO_Init
 241  00a9 85            	popw	x
 242                     ; 200 	LED_SetColor_Int(100, 0, 0, FALSE);
 244  00aa 4b00          	push	#0
 245  00ac 4b00          	push	#0
 246  00ae ae6400        	ldw	x,#25600
 247  00b1 cd019f        	call	_LED_SetColor_Int
 249  00b4 85            	popw	x
 250                     ; 201   TIMER_Configuration();
 252  00b5 cd034f        	call	_TIMER_Configuration
 254                     ; 202 	I2C_Configuration();
 256  00b8 cd016a        	call	_I2C_Configuration
 258                     ; 203 	LED_SetColor_Int(100, 100, 0, FALSE);
 260  00bb 4b00          	push	#0
 261  00bd 4b00          	push	#0
 262  00bf ae6464        	ldw	x,#25700
 263  00c2 cd019f        	call	_LED_SetColor_Int
 265  00c5 85            	popw	x
 266                     ; 206 	I2C_GenerateSTART(ENABLE);
 268  00c6 a601          	ld	a,#1
 269  00c8 cd0000        	call	_I2C_GenerateSTART
 272  00cb               L32:
 273                     ; 207 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
 275  00cb ae0301        	ldw	x,#769
 276  00ce cd0000        	call	_I2C_CheckEvent
 278  00d1 4d            	tnz	a
 279  00d2 27f7          	jreq	L32
 280                     ; 208 	LED_SetColor_Int(80, 80, 20, FALSE);
 282  00d4 4b00          	push	#0
 283  00d6 4b14          	push	#20
 284  00d8 ae5050        	ldw	x,#20560
 285  00db cd019f        	call	_LED_SetColor_Int
 287  00de 85            	popw	x
 288                     ; 210 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
 290  00df ae1000        	ldw	x,#4096
 291  00e2 cd0000        	call	_I2C_Send7bitAddress
 294  00e5               L13:
 295                     ; 211 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
 297  00e5 ae0782        	ldw	x,#1922
 298  00e8 cd0000        	call	_I2C_CheckEvent
 300  00eb a101          	cp	a,#1
 301  00ed 26f6          	jrne	L13
 302                     ; 212 	LED_SetColor_Int(60, 60, 40, FALSE);
 304  00ef 4b00          	push	#0
 305  00f1 4b28          	push	#40
 306  00f3 ae3c3c        	ldw	x,#15420
 307  00f6 cd019f        	call	_LED_SetColor_Int
 309  00f9 85            	popw	x
 310                     ; 215 	I2C_SendData(0x01);
 312  00fa a601          	ld	a,#1
 313  00fc cd0000        	call	_I2C_SendData
 316  00ff               L73:
 317                     ; 216 	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
 319  00ff ae0784        	ldw	x,#1924
 320  0102 cd0000        	call	_I2C_CheckEvent
 322  0105 a101          	cp	a,#1
 323  0107 26f6          	jrne	L73
 324                     ; 217 	LED_SetColor_Int(40, 40, 60, FALSE);
 326  0109 4b00          	push	#0
 327  010b 4b3c          	push	#60
 328  010d ae2828        	ldw	x,#10280
 329  0110 cd019f        	call	_LED_SetColor_Int
 331  0113 85            	popw	x
 332                     ; 219 	I2C_GeneralCallCmd(ENABLE);
 334  0114 a601          	ld	a,#1
 335  0116 cd0000        	call	_I2C_GeneralCallCmd
 337                     ; 220 	I2C_GenerateSTOP(ENABLE);
 339  0119 a601          	ld	a,#1
 340  011b cd0000        	call	_I2C_GenerateSTOP
 343  011e               L54:
 344                     ; 223 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
 346  011e ae1200        	ldw	x,#4608
 347  0121 cd0000        	call	_I2C_CheckEvent
 349  0124 a101          	cp	a,#1
 350  0126 26f6          	jrne	L54
 351                     ; 224 	received = I2C_ReceiveData();
 353  0128 cd0000        	call	_I2C_ReceiveData
 355  012b b708          	ld	_received,a
 357  012d               L55:
 358                     ; 225 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
 360  012d ae0240        	ldw	x,#576
 361  0130 cd0000        	call	_I2C_CheckEvent
 363  0133 a101          	cp	a,#1
 364  0135 26f6          	jrne	L55
 365                     ; 226 	received2 = I2C_ReceiveData();
 367  0137 cd0000        	call	_I2C_ReceiveData
 369  013a b709          	ld	_received2,a
 370                     ; 227 	I2C_GeneralCallCmd(DISABLE);
 372  013c 4f            	clr	a
 373  013d cd0000        	call	_I2C_GeneralCallCmd
 375                     ; 228 	LED_SetColor_Int(20, 20, 80, FALSE);
 377  0140 4b00          	push	#0
 378  0142 4b50          	push	#80
 379  0144 ae1414        	ldw	x,#5140
 380  0147 ad56          	call	_LED_SetColor_Int
 382  0149 85            	popw	x
 383                     ; 231 	I2C_Configuration();
 385  014a ad1e          	call	_I2C_Configuration
 387                     ; 232 	LED_SetColor_Int(0, 0, 100, FALSE);
 389  014c 4b00          	push	#0
 390  014e 4b64          	push	#100
 391  0150 5f            	clrw	x
 392  0151 ad4c          	call	_LED_SetColor_Int
 394  0153 85            	popw	x
 395                     ; 234 	GPIO_Init(TRIGGER_PORT,  TRIGGER_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 397  0154 4bc0          	push	#192
 398  0156 4b04          	push	#4
 399  0158 ae5000        	ldw	x,#20480
 400  015b cd0000        	call	_GPIO_Init
 402  015e 85            	popw	x
 403                     ; 235 	LED_SetColor_Int(0, 0, 0, FALSE);
 405  015f 4b00          	push	#0
 406  0161 4b00          	push	#0
 407  0163 5f            	clrw	x
 408  0164 ad39          	call	_LED_SetColor_Int
 410  0166 85            	popw	x
 411                     ; 237   enableInterrupts();
 414  0167 9a            rim
 416                     ; 238 	wfi();
 420  0168 8f            wfi
 422                     ; 245 }
 426  0169 81            	ret
 453                     ; 247 void I2C_Configuration(void) {
 454                     	switch	.text
 455  016a               _I2C_Configuration:
 459                     ; 248 	I2C_DeInit();
 461  016a cd0000        	call	_I2C_DeInit
 463                     ; 249   I2C_Init(I2C_MAX_STANDARD_FREQ,
 463                     ; 250      (received2<<1),// Self address 
 463                     ; 251      I2C_DUTYCYCLE_2, 
 463                     ; 252      I2C_ACK_CURR,
 463                     ; 253      I2C_ADDMODE_7BIT, 
 463                     ; 254      I2C_MAX_INPUT_FREQ
 463                     ; 255   );
 465  016d 4b10          	push	#16
 466  016f 4b00          	push	#0
 467  0171 4b01          	push	#1
 468  0173 4b00          	push	#0
 469  0175 b609          	ld	a,_received2
 470  0177 5f            	clrw	x
 471  0178 97            	ld	xl,a
 472  0179 58            	sllw	x
 473  017a 89            	pushw	x
 474  017b ae86a0        	ldw	x,#34464
 475  017e 89            	pushw	x
 476  017f ae0001        	ldw	x,#1
 477  0182 89            	pushw	x
 478  0183 cd0000        	call	_I2C_Init
 480  0186 5b0a          	addw	sp,#10
 481                     ; 256 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
 481                     ; 257 	ENABLE);
 483  0188 ae0601        	ldw	x,#1537
 484  018b cd0000        	call	_I2C_ITConfig
 486                     ; 260 }
 489  018e 81            	ret
 542                     ; 271 void LED_SetColor(u8 r, u8 g, u8 b) {
 543                     	switch	.text
 544  018f               _LED_SetColor:
 546  018f 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 272 	LED_SetColor_Int(r, g, b, TRUE);
 552  0190 4b01          	push	#1
 553  0192 7b06          	ld	a,(OFST+6,sp)
 554  0194 88            	push	a
 555  0195 9f            	ld	a,xl
 556  0196 97            	ld	xl,a
 557  0197 7b03          	ld	a,(OFST+3,sp)
 558  0199 95            	ld	xh,a
 559  019a ad03          	call	_LED_SetColor_Int
 561  019c 85            	popw	x
 562                     ; 273 }
 565  019d 85            	popw	x
 566  019e 81            	ret
 866                     ; 276 void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
 867                     	switch	.text
 868  019f               _LED_SetColor_Int:
 870  019f 89            	pushw	x
 871  01a0 5206          	subw	sp,#6
 872       00000006      OFST:	set	6
 875                     ; 277 	r = r > 100 ? 100 : r;
 877  01a2 7b07          	ld	a,(OFST+1,sp)
 878  01a4 a165          	cp	a,#101
 879  01a6 2504          	jrult	L41
 880  01a8 a664          	ld	a,#100
 881  01aa 2002          	jra	L61
 882  01ac               L41:
 883  01ac 7b07          	ld	a,(OFST+1,sp)
 884  01ae               L61:
 885  01ae 6b07          	ld	(OFST+1,sp),a
 886                     ; 278 	g = g > 100 ? 100 : g;
 888  01b0 7b08          	ld	a,(OFST+2,sp)
 889  01b2 a165          	cp	a,#101
 890  01b4 2504          	jrult	L02
 891  01b6 a664          	ld	a,#100
 892  01b8 2002          	jra	L22
 893  01ba               L02:
 894  01ba 7b08          	ld	a,(OFST+2,sp)
 895  01bc               L22:
 896  01bc 6b08          	ld	(OFST+2,sp),a
 897                     ; 279 	b = b > 100 ? 100 : b;
 899  01be 7b0b          	ld	a,(OFST+5,sp)
 900  01c0 a165          	cp	a,#101
 901  01c2 2504          	jrult	L42
 902  01c4 a664          	ld	a,#100
 903  01c6 2002          	jra	L62
 904  01c8               L42:
 905  01c8 7b0b          	ld	a,(OFST+5,sp)
 906  01ca               L62:
 907  01ca 6b0b          	ld	(OFST+5,sp),a
 908                     ; 280 	if (changeInterrupts) disableInterrupts();
 910  01cc 0d0c          	tnz	(OFST+6,sp)
 911  01ce 2701          	jreq	L362
 915  01d0 9b            sim
 917  01d1               L362:
 918                     ; 263 	int i = 0;
 922                     ; 264 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
 924  01d1 72135000      	bres	20480,#1
 925                     ; 266 	for (i = 1280; i >= 0; i--) {
 927  01d5 ae0500        	ldw	x,#1280
 928  01d8 1f05          	ldw	(OFST-1,sp),x
 929  01da               L562:
 930                     ; 267 		nop();
 933  01da 9d            nop
 935                     ; 266 	for (i = 1280; i >= 0; i--) {
 938  01db 1e05          	ldw	x,(OFST-1,sp)
 939  01dd 1d0001        	subw	x,#1
 940  01e0 1f05          	ldw	(OFST-1,sp),x
 943  01e2 9c            	rvf
 944  01e3 1e05          	ldw	x,(OFST-1,sp)
 945  01e5 2ef3          	jrsge	L562
 946                     ; 282 	LED_SendByte(g);
 949  01e7 7b08          	ld	a,(OFST+2,sp)
 950  01e9 6b04          	ld	(OFST-2,sp),a
 951                     ; 111 	int i = 0;
 953                     ; 113 	for (i = 7; i >= 0; i--) {
 955  01eb ae0007        	ldw	x,#7
 956  01ee 1f05          	ldw	(OFST-1,sp),x
 957  01f0               L372:
 958                     ; 114 		bool bit = (1<<i & data);
 960  01f0 7b04          	ld	a,(OFST-2,sp)
 961  01f2 5f            	clrw	x
 962  01f3 97            	ld	xl,a
 963  01f4 1f01          	ldw	(OFST-5,sp),x
 964  01f6 ae0001        	ldw	x,#1
 965  01f9 7b06          	ld	a,(OFST+0,sp)
 966  01fb 4d            	tnz	a
 967  01fc 2704          	jreq	L03
 968  01fe               L23:
 969  01fe 58            	sllw	x
 970  01ff 4a            	dec	a
 971  0200 26fc          	jrne	L23
 972  0202               L03:
 973  0202 01            	rrwa	x,a
 974  0203 1402          	and	a,(OFST-4,sp)
 975  0205 01            	rrwa	x,a
 976  0206 1401          	and	a,(OFST-5,sp)
 977  0208 01            	rrwa	x,a
 978  0209 01            	rrwa	x,a
 979  020a 6b03          	ld	(OFST-3,sp),a
 980  020c 02            	rlwa	x,a
 981                     ; 115 		if (bit != 0) {
 983  020d 0d03          	tnz	(OFST-3,sp)
 984  020f 271c          	jreq	L103
 985                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
 988  0211 72125000      	bset	20480,#1
 989                     ; 66 	nop();
 992  0215 9d            nop
 994                     ; 67 	nop();
 998  0216 9d            nop
1000                     ; 68 	nop();
1004  0217 9d            nop
1006                     ; 69 	nop();
1010  0218 9d            nop
1012                     ; 70 	nop();
1016  0219 9d            nop
1018                     ; 71 	nop();
1022  021a 9d            nop
1024                     ; 72 	nop();
1028  021b 9d            nop
1030                     ; 73 	nop();
1034  021c 9d            nop
1036                     ; 74 	nop();
1040  021d 9d            nop
1042                     ; 75 	nop();
1046  021e 9d            nop
1048                     ; 76 	nop();
1052  021f 9d            nop
1054                     ; 77 	nop();
1058  0220 9d            nop
1060                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1063  0221 72135000      	bres	20480,#1
1064                     ; 79 	nop();
1067  0225 9d            nop
1069                     ; 80 	nop();
1073  0226 9d            nop
1075                     ; 81 	nop();
1079  0227 9d            nop
1081                     ; 82 	nop();
1085  0228 9d            nop
1087                     ; 83 	nop();
1091  0229 9d            nop
1093                     ; 84 	nop();
1097  022a 9d            nop
1100  022b 201a          	jra	L303
1101  022d               L103:
1102                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1105  022d 72125000      	bset	20480,#1
1106                     ; 89 	nop();
1109  0231 9d            nop
1111                     ; 90 	nop();
1115  0232 9d            nop
1117                     ; 91 	nop();
1121  0233 9d            nop
1123                     ; 92 	nop();
1127  0234 9d            nop
1129                     ; 93 	nop();
1133  0235 9d            nop
1135                     ; 94 	nop();
1139  0236 9d            nop
1141                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1144  0237 72135000      	bres	20480,#1
1145                     ; 96 	nop();
1148  023b 9d            nop
1150                     ; 97 	nop();
1154  023c 9d            nop
1156                     ; 98 	nop();
1160  023d 9d            nop
1162                     ; 99 	nop();
1166  023e 9d            nop
1168                     ; 100 	nop();
1172  023f 9d            nop
1174                     ; 101 	nop();
1178  0240 9d            nop
1180                     ; 102 	nop();
1184  0241 9d            nop
1186                     ; 103 	nop();
1190  0242 9d            nop
1192                     ; 104 	nop();
1196  0243 9d            nop
1198                     ; 105 	nop();
1202  0244 9d            nop
1204                     ; 106 	nop();
1208  0245 9d            nop
1210                     ; 107 	nop();
1214  0246 9d            nop
1216  0247               L303:
1217                     ; 113 	for (i = 7; i >= 0; i--) {
1219  0247 1e05          	ldw	x,(OFST-1,sp)
1220  0249 1d0001        	subw	x,#1
1221  024c 1f05          	ldw	(OFST-1,sp),x
1224  024e 9c            	rvf
1225  024f 1e05          	ldw	x,(OFST-1,sp)
1226  0251 2f02          	jrslt	L44
1227  0253 209b          	jp	L372
1228  0255               L44:
1229                     ; 283 	LED_SendByte(r);
1232  0255 7b07          	ld	a,(OFST+1,sp)
1233  0257 6b04          	ld	(OFST-2,sp),a
1234                     ; 111 	int i = 0;
1236                     ; 113 	for (i = 7; i >= 0; i--) {
1238  0259 ae0007        	ldw	x,#7
1239  025c 1f05          	ldw	(OFST-1,sp),x
1240  025e               L503:
1241                     ; 114 		bool bit = (1<<i & data);
1243  025e 7b04          	ld	a,(OFST-2,sp)
1244  0260 5f            	clrw	x
1245  0261 97            	ld	xl,a
1246  0262 1f01          	ldw	(OFST-5,sp),x
1247  0264 ae0001        	ldw	x,#1
1248  0267 7b06          	ld	a,(OFST+0,sp)
1249  0269 4d            	tnz	a
1250  026a 2704          	jreq	L43
1251  026c               L63:
1252  026c 58            	sllw	x
1253  026d 4a            	dec	a
1254  026e 26fc          	jrne	L63
1255  0270               L43:
1256  0270 01            	rrwa	x,a
1257  0271 1402          	and	a,(OFST-4,sp)
1258  0273 01            	rrwa	x,a
1259  0274 1401          	and	a,(OFST-5,sp)
1260  0276 01            	rrwa	x,a
1261  0277 01            	rrwa	x,a
1262  0278 6b03          	ld	(OFST-3,sp),a
1263  027a 02            	rlwa	x,a
1264                     ; 115 		if (bit != 0) {
1266  027b 0d03          	tnz	(OFST-3,sp)
1267  027d 271c          	jreq	L313
1268                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1271  027f 72125000      	bset	20480,#1
1272                     ; 66 	nop();
1275  0283 9d            nop
1277                     ; 67 	nop();
1281  0284 9d            nop
1283                     ; 68 	nop();
1287  0285 9d            nop
1289                     ; 69 	nop();
1293  0286 9d            nop
1295                     ; 70 	nop();
1299  0287 9d            nop
1301                     ; 71 	nop();
1305  0288 9d            nop
1307                     ; 72 	nop();
1311  0289 9d            nop
1313                     ; 73 	nop();
1317  028a 9d            nop
1319                     ; 74 	nop();
1323  028b 9d            nop
1325                     ; 75 	nop();
1329  028c 9d            nop
1331                     ; 76 	nop();
1335  028d 9d            nop
1337                     ; 77 	nop();
1341  028e 9d            nop
1343                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1346  028f 72135000      	bres	20480,#1
1347                     ; 79 	nop();
1350  0293 9d            nop
1352                     ; 80 	nop();
1356  0294 9d            nop
1358                     ; 81 	nop();
1362  0295 9d            nop
1364                     ; 82 	nop();
1368  0296 9d            nop
1370                     ; 83 	nop();
1374  0297 9d            nop
1376                     ; 84 	nop();
1380  0298 9d            nop
1383  0299 201a          	jra	L513
1384  029b               L313:
1385                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1388  029b 72125000      	bset	20480,#1
1389                     ; 89 	nop();
1392  029f 9d            nop
1394                     ; 90 	nop();
1398  02a0 9d            nop
1400                     ; 91 	nop();
1404  02a1 9d            nop
1406                     ; 92 	nop();
1410  02a2 9d            nop
1412                     ; 93 	nop();
1416  02a3 9d            nop
1418                     ; 94 	nop();
1422  02a4 9d            nop
1424                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1427  02a5 72135000      	bres	20480,#1
1428                     ; 96 	nop();
1431  02a9 9d            nop
1433                     ; 97 	nop();
1437  02aa 9d            nop
1439                     ; 98 	nop();
1443  02ab 9d            nop
1445                     ; 99 	nop();
1449  02ac 9d            nop
1451                     ; 100 	nop();
1455  02ad 9d            nop
1457                     ; 101 	nop();
1461  02ae 9d            nop
1463                     ; 102 	nop();
1467  02af 9d            nop
1469                     ; 103 	nop();
1473  02b0 9d            nop
1475                     ; 104 	nop();
1479  02b1 9d            nop
1481                     ; 105 	nop();
1485  02b2 9d            nop
1487                     ; 106 	nop();
1491  02b3 9d            nop
1493                     ; 107 	nop();
1497  02b4 9d            nop
1499  02b5               L513:
1500                     ; 113 	for (i = 7; i >= 0; i--) {
1502  02b5 1e05          	ldw	x,(OFST-1,sp)
1503  02b7 1d0001        	subw	x,#1
1504  02ba 1f05          	ldw	(OFST-1,sp),x
1507  02bc 9c            	rvf
1508  02bd 1e05          	ldw	x,(OFST-1,sp)
1509  02bf 2f02          	jrslt	L64
1510  02c1 209b          	jp	L503
1511  02c3               L64:
1512                     ; 284 	LED_SendByte(b);
1515  02c3 7b0b          	ld	a,(OFST+5,sp)
1516  02c5 6b04          	ld	(OFST-2,sp),a
1517                     ; 111 	int i = 0;
1519                     ; 113 	for (i = 7; i >= 0; i--) {
1521  02c7 ae0007        	ldw	x,#7
1522  02ca 1f05          	ldw	(OFST-1,sp),x
1523  02cc               L713:
1524                     ; 114 		bool bit = (1<<i & data);
1526  02cc 7b04          	ld	a,(OFST-2,sp)
1527  02ce 5f            	clrw	x
1528  02cf 97            	ld	xl,a
1529  02d0 1f01          	ldw	(OFST-5,sp),x
1530  02d2 ae0001        	ldw	x,#1
1531  02d5 7b06          	ld	a,(OFST+0,sp)
1532  02d7 4d            	tnz	a
1533  02d8 2704          	jreq	L04
1534  02da               L24:
1535  02da 58            	sllw	x
1536  02db 4a            	dec	a
1537  02dc 26fc          	jrne	L24
1538  02de               L04:
1539  02de 01            	rrwa	x,a
1540  02df 1402          	and	a,(OFST-4,sp)
1541  02e1 01            	rrwa	x,a
1542  02e2 1401          	and	a,(OFST-5,sp)
1543  02e4 01            	rrwa	x,a
1544  02e5 01            	rrwa	x,a
1545  02e6 6b03          	ld	(OFST-3,sp),a
1546  02e8 02            	rlwa	x,a
1547                     ; 115 		if (bit != 0) {
1549  02e9 0d03          	tnz	(OFST-3,sp)
1550  02eb 271c          	jreq	L523
1551                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1554  02ed 72125000      	bset	20480,#1
1555                     ; 66 	nop();
1558  02f1 9d            nop
1560                     ; 67 	nop();
1564  02f2 9d            nop
1566                     ; 68 	nop();
1570  02f3 9d            nop
1572                     ; 69 	nop();
1576  02f4 9d            nop
1578                     ; 70 	nop();
1582  02f5 9d            nop
1584                     ; 71 	nop();
1588  02f6 9d            nop
1590                     ; 72 	nop();
1594  02f7 9d            nop
1596                     ; 73 	nop();
1600  02f8 9d            nop
1602                     ; 74 	nop();
1606  02f9 9d            nop
1608                     ; 75 	nop();
1612  02fa 9d            nop
1614                     ; 76 	nop();
1618  02fb 9d            nop
1620                     ; 77 	nop();
1624  02fc 9d            nop
1626                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1629  02fd 72135000      	bres	20480,#1
1630                     ; 79 	nop();
1633  0301 9d            nop
1635                     ; 80 	nop();
1639  0302 9d            nop
1641                     ; 81 	nop();
1645  0303 9d            nop
1647                     ; 82 	nop();
1651  0304 9d            nop
1653                     ; 83 	nop();
1657  0305 9d            nop
1659                     ; 84 	nop();
1663  0306 9d            nop
1666  0307 201a          	jra	L723
1667  0309               L523:
1668                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1671  0309 72125000      	bset	20480,#1
1672                     ; 89 	nop();
1675  030d 9d            nop
1677                     ; 90 	nop();
1681  030e 9d            nop
1683                     ; 91 	nop();
1687  030f 9d            nop
1689                     ; 92 	nop();
1693  0310 9d            nop
1695                     ; 93 	nop();
1699  0311 9d            nop
1701                     ; 94 	nop();
1705  0312 9d            nop
1707                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1710  0313 72135000      	bres	20480,#1
1711                     ; 96 	nop();
1714  0317 9d            nop
1716                     ; 97 	nop();
1720  0318 9d            nop
1722                     ; 98 	nop();
1726  0319 9d            nop
1728                     ; 99 	nop();
1732  031a 9d            nop
1734                     ; 100 	nop();
1738  031b 9d            nop
1740                     ; 101 	nop();
1744  031c 9d            nop
1746                     ; 102 	nop();
1750  031d 9d            nop
1752                     ; 103 	nop();
1756  031e 9d            nop
1758                     ; 104 	nop();
1762  031f 9d            nop
1764                     ; 105 	nop();
1768  0320 9d            nop
1770                     ; 106 	nop();
1774  0321 9d            nop
1776                     ; 107 	nop();
1780  0322 9d            nop
1782  0323               L723:
1783                     ; 113 	for (i = 7; i >= 0; i--) {
1785  0323 1e05          	ldw	x,(OFST-1,sp)
1786  0325 1d0001        	subw	x,#1
1787  0328 1f05          	ldw	(OFST-1,sp),x
1790  032a 9c            	rvf
1791  032b 1e05          	ldw	x,(OFST-1,sp)
1792  032d 2f02          	jrslt	L05
1793  032f 209b          	jp	L713
1794  0331               L05:
1795                     ; 263 	int i = 0;
1798                     ; 264 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1800  0331 72135000      	bres	20480,#1
1801                     ; 266 	for (i = 1280; i >= 0; i--) {
1803  0335 ae0500        	ldw	x,#1280
1804  0338 1f05          	ldw	(OFST-1,sp),x
1805  033a               L133:
1806                     ; 267 		nop();
1809  033a 9d            nop
1811                     ; 266 	for (i = 1280; i >= 0; i--) {
1814  033b 1e05          	ldw	x,(OFST-1,sp)
1815  033d 1d0001        	subw	x,#1
1816  0340 1f05          	ldw	(OFST-1,sp),x
1819  0342 9c            	rvf
1820  0343 1e05          	ldw	x,(OFST-1,sp)
1821  0345 2ef3          	jrsge	L133
1822                     ; 286 	if (changeInterrupts) enableInterrupts();
1824  0347 0d0c          	tnz	(OFST+6,sp)
1825  0349 2701          	jreq	L733
1829  034b 9a            rim
1831  034c               L733:
1832                     ; 291 }
1836  034c 5b08          	addw	sp,#8
1837  034e 81            	ret
1864                     ; 293 void TIMER_Configuration(void)
1864                     ; 294 {
1865                     	switch	.text
1866  034f               _TIMER_Configuration:
1870                     ; 295   TIM4_DeInit();
1872  034f cd0000        	call	_TIM4_DeInit
1874                     ; 298   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x7F );
1876  0352 ae077f        	ldw	x,#1919
1877  0355 cd0000        	call	_TIM4_TimeBaseInit
1879                     ; 301   TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
1881  0358 ae0100        	ldw	x,#256
1882  035b cd0000        	call	_TIM4_ITConfig
1884                     ; 302 }
1887  035e 81            	ret
1927                     ; 304 void I2C_SendPacket(u8 data) {
1928                     	switch	.text
1929  035f               _I2C_SendPacket:
1931  035f 88            	push	a
1932       00000000      OFST:	set	0
1935                     ; 305 	I2C_GenerateSTART(ENABLE);	
1937  0360 a601          	ld	a,#1
1938  0362 cd0000        	call	_I2C_GenerateSTART
1941  0365               L173:
1942                     ; 306 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
1944  0365 ae0301        	ldw	x,#769
1945  0368 cd0000        	call	_I2C_CheckEvent
1947  036b 4d            	tnz	a
1948  036c 27f7          	jreq	L173
1949                     ; 308 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
1951  036e ae1000        	ldw	x,#4096
1952  0371 cd0000        	call	_I2C_Send7bitAddress
1955  0374               L773:
1956                     ; 310 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) ) {}
1958  0374 ae0782        	ldw	x,#1922
1959  0377 cd0000        	call	_I2C_CheckEvent
1961  037a 4d            	tnz	a
1962  037b 27f7          	jreq	L773
1963                     ; 312 	I2C_SendData(received2);
1965  037d b609          	ld	a,_received2
1966  037f cd0000        	call	_I2C_SendData
1969  0382               L504:
1970                     ; 313 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS ) {}
1972  0382 ae0784        	ldw	x,#1924
1973  0385 cd0000        	call	_I2C_CheckEvent
1975  0388 a101          	cp	a,#1
1976  038a 26f6          	jrne	L504
1977                     ; 314 	I2C_SendData(0x01);
1979  038c a601          	ld	a,#1
1980  038e cd0000        	call	_I2C_SendData
1983  0391               L314:
1984                     ; 315 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS ) {}
1986  0391 ae0784        	ldw	x,#1924
1987  0394 cd0000        	call	_I2C_CheckEvent
1989  0397 a101          	cp	a,#1
1990  0399 26f6          	jrne	L314
1991                     ; 316 	I2C_SendData(data);
1993  039b 7b01          	ld	a,(OFST+1,sp)
1994  039d cd0000        	call	_I2C_SendData
1997  03a0               L124:
1998                     ; 317 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) {}
2000  03a0 ae0784        	ldw	x,#1924
2001  03a3 cd0000        	call	_I2C_CheckEvent
2003  03a6 a101          	cp	a,#1
2004  03a8 26f6          	jrne	L124
2005                     ; 318 	I2C_GenerateSTOP(ENABLE);
2007  03aa a601          	ld	a,#1
2008  03ac cd0000        	call	_I2C_GenerateSTOP
2010                     ; 319 }
2013  03af 84            	pop	a
2014  03b0 81            	ret
2037                     ; 321 void Core_Ping_Reply(){
2038                     	switch	.text
2039  03b1               _Core_Ping_Reply:
2043                     ; 323 }
2046  03b1 81            	ret
2081                     ; 335 void assert_failed(u8* file, u32 line)
2081                     ; 336 {
2082                     	switch	.text
2083  03b2               _assert_failed:
2087  03b2               L354:
2088  03b2 20fe          	jra	L354
2223                     	xdef	_Core_Ping_Reply
2224                     	xdef	_I2C_SendPacket
2225                     	xdef	_main
2226                     	xdef	_LED_SetColor
2227                     	xdef	_LED_SetColor_Int
2228                     	xdef	_TIMER_Configuration
2229                     	xdef	_I2C_Configuration
2230                     	xdef	_ping_received
2231                     	xdef	_received2
2232                     	xdef	_received
2233                     	xdef	_velocity
2234                     	switch	.ubsct
2235  0000               _TxBuffer:
2236  0000 000000000000  	ds.b	7
2237                     	xdef	_TxBuffer
2238                     	xdef	_next_case
2239                     	xdef	_NumOfBytes
2240                     	xdef	_i
2241                     	xdef	_PeriodNumber
2242  0007               _Counter:
2243  0007 00            	ds.b	1
2244                     	xdef	_Counter
2245                     	xdef	_button_state
2246                     	xdef	_previous_button_state
2247                     	xdef	_User_Key_Pressed
2248                     	xdef	_assert_failed
2249                     	xref	_TIM4_ITConfig
2250                     	xref	_TIM4_TimeBaseInit
2251                     	xref	_TIM4_DeInit
2252                     	xref	_I2C_CheckEvent
2253                     	xref	_I2C_SendData
2254                     	xref	_I2C_Send7bitAddress
2255                     	xref	_I2C_ReceiveData
2256                     	xref	_I2C_ITConfig
2257                     	xref	_I2C_GenerateSTOP
2258                     	xref	_I2C_GenerateSTART
2259                     	xref	_I2C_GeneralCallCmd
2260                     	xref	_I2C_Init
2261                     	xref	_I2C_DeInit
2262                     	xref	_GPIO_WriteLow
2263                     	xref	_GPIO_WriteHigh
2264                     	xref	_GPIO_Init
2265                     	xref	_EXTI_SetExtIntSensitivity
2266                     	xref	_CLK_SYSCLKConfig
2267                     	xref	_CLK_HSIPrescalerConfig
2268                     	xref	_CLK_PeripheralClockConfig
2269                     	xref	_CLK_FastHaltWakeUpCmd
2270                     	xref	_CLK_HSICmd
2271                     	xref	_CLK_DeInit
2291                     	end
