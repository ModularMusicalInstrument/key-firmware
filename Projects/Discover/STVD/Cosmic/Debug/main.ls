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
  36  0009 0a            	dc.b	10
  37  000a               _ping_received:
  38  000a 00            	dc.b	0
  92                     ; 155 void main(void)
  92                     ; 156 {
  94                     	switch	.text
  95  0000               _main:
  99                     ; 158 	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 101  0000 4bd0          	push	#208
 102  0002 4b04          	push	#4
 103  0004 ae5000        	ldw	x,#20480
 104  0007 cd0000        	call	_GPIO_Init
 106  000a 85            	popw	x
 107                     ; 159 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 109  000b 4b04          	push	#4
 110  000d ae5000        	ldw	x,#20480
 111  0010 cd0000        	call	_GPIO_WriteHigh
 113  0013 84            	pop	a
 114                     ; 160 	GPIO_WriteLow(TRIGGER_PORT,TRIGGER_PIN);
 116  0014 4b04          	push	#4
 117  0016 ae5000        	ldw	x,#20480
 118  0019 cd0000        	call	_GPIO_WriteLow
 120  001c 84            	pop	a
 121                     ; 161 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 123  001d 4b04          	push	#4
 124  001f ae5000        	ldw	x,#20480
 125  0022 cd0000        	call	_GPIO_WriteHigh
 127  0025 84            	pop	a
 128                     ; 164 	CLK_DeInit();  
 130  0026 cd0000        	call	_CLK_DeInit
 132                     ; 165   CLK_HSICmd(ENABLE);
 134  0029 a601          	ld	a,#1
 135  002b cd0000        	call	_CLK_HSICmd
 137                     ; 166   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 139  002e 4f            	clr	a
 140  002f cd0000        	call	_CLK_HSIPrescalerConfig
 142                     ; 167   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 144  0032 a680          	ld	a,#128
 145  0034 cd0000        	call	_CLK_SYSCLKConfig
 147                     ; 170 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 149  0037 ae0100        	ldw	x,#256
 150  003a cd0000        	call	_CLK_PeripheralClockConfig
 152                     ; 171 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 154  003d ae0300        	ldw	x,#768
 155  0040 cd0000        	call	_CLK_PeripheralClockConfig
 157                     ; 172 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 159  0043 ae0300        	ldw	x,#768
 160  0046 cd0000        	call	_CLK_PeripheralClockConfig
 162                     ; 173 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 164  0049 ae0300        	ldw	x,#768
 165  004c cd0000        	call	_CLK_PeripheralClockConfig
 167                     ; 174 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, DISABLE);
 169  004f ae0400        	ldw	x,#1024
 170  0052 cd0000        	call	_CLK_PeripheralClockConfig
 172                     ; 175 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, DISABLE);
 174  0055 ae0500        	ldw	x,#1280
 175  0058 cd0000        	call	_CLK_PeripheralClockConfig
 177                     ; 176 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 179  005b ae0600        	ldw	x,#1536
 180  005e cd0000        	call	_CLK_PeripheralClockConfig
 182                     ; 177 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 184  0061 ae0500        	ldw	x,#1280
 185  0064 cd0000        	call	_CLK_PeripheralClockConfig
 187                     ; 178 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 189  0067 ae0700        	ldw	x,#1792
 190  006a cd0000        	call	_CLK_PeripheralClockConfig
 192                     ; 179 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 194  006d ae1300        	ldw	x,#4864
 195  0070 cd0000        	call	_CLK_PeripheralClockConfig
 197                     ; 180 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 199  0073 ae1200        	ldw	x,#4608
 200  0076 cd0000        	call	_CLK_PeripheralClockConfig
 202                     ; 181 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
 204  0079 ae1700        	ldw	x,#5888
 205  007c cd0000        	call	_CLK_PeripheralClockConfig
 207                     ; 182 	CLK_FastHaltWakeUpCmd(DISABLE);
 209  007f 4f            	clr	a
 210  0080 cd0000        	call	_CLK_FastHaltWakeUpCmd
 212                     ; 188 	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
 214  0083 4b60          	push	#96
 215  0085 4b20          	push	#32
 216  0087 ae500a        	ldw	x,#20490
 217  008a cd0000        	call	_GPIO_Init
 219  008d 85            	popw	x
 220                     ; 189 	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
 222  008e 4b60          	push	#96
 223  0090 4b08          	push	#8
 224  0092 ae500a        	ldw	x,#20490
 225  0095 cd0000        	call	_GPIO_Init
 227  0098 85            	popw	x
 228                     ; 195 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 230  0099 ae0202        	ldw	x,#514
 231  009c cd0000        	call	_EXTI_SetExtIntSensitivity
 233                     ; 198   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 235  009f 4be0          	push	#224
 236  00a1 4b02          	push	#2
 237  00a3 ae5000        	ldw	x,#20480
 238  00a6 cd0000        	call	_GPIO_Init
 240  00a9 85            	popw	x
 241                     ; 200 	LED_SetColor_Int(100, 0, 0, FALSE);
 243  00aa 4b00          	push	#0
 244  00ac 4b00          	push	#0
 245  00ae ae6400        	ldw	x,#25600
 246  00b1 cd01b8        	call	_LED_SetColor_Int
 248  00b4 85            	popw	x
 249                     ; 201   TIMER_Configuration();
 251  00b5 cd0368        	call	_TIMER_Configuration
 253                     ; 202 	I2C_Configuration();
 255  00b8 cd0183        	call	_I2C_Configuration
 257                     ; 203 	LED_SetColor_Int(100, 100, 0, FALSE);
 259  00bb 4b00          	push	#0
 260  00bd 4b00          	push	#0
 261  00bf ae6464        	ldw	x,#25700
 262  00c2 cd01b8        	call	_LED_SetColor_Int
 264  00c5 85            	popw	x
 265                     ; 206 	I2C_GenerateSTART(ENABLE);
 267  00c6 a601          	ld	a,#1
 268  00c8 cd0000        	call	_I2C_GenerateSTART
 271  00cb               L32:
 272                     ; 207 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
 274  00cb ae0301        	ldw	x,#769
 275  00ce cd0000        	call	_I2C_CheckEvent
 277  00d1 4d            	tnz	a
 278  00d2 27f7          	jreq	L32
 279                     ; 208 	LED_SetColor_Int(80, 80, 20, FALSE);
 281  00d4 4b00          	push	#0
 282  00d6 4b14          	push	#20
 283  00d8 ae5050        	ldw	x,#20560
 284  00db cd01b8        	call	_LED_SetColor_Int
 286  00de 85            	popw	x
 287                     ; 210 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
 289  00df ae1000        	ldw	x,#4096
 290  00e2 cd0000        	call	_I2C_Send7bitAddress
 293  00e5               L13:
 294                     ; 211 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
 296  00e5 ae0782        	ldw	x,#1922
 297  00e8 cd0000        	call	_I2C_CheckEvent
 299  00eb a101          	cp	a,#1
 300  00ed 26f6          	jrne	L13
 301                     ; 212 	LED_SetColor_Int(60, 60, 40, FALSE);
 303  00ef 4b00          	push	#0
 304  00f1 4b28          	push	#40
 305  00f3 ae3c3c        	ldw	x,#15420
 306  00f6 cd01b8        	call	_LED_SetColor_Int
 308  00f9 85            	popw	x
 309                     ; 215 	I2C_SendData(0x01);
 311  00fa a601          	ld	a,#1
 312  00fc cd0000        	call	_I2C_SendData
 315  00ff               L73:
 316                     ; 216 	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
 318  00ff ae0784        	ldw	x,#1924
 319  0102 cd0000        	call	_I2C_CheckEvent
 321  0105 a101          	cp	a,#1
 322  0107 26f6          	jrne	L73
 323                     ; 217 	LED_SetColor_Int(40, 40, 60, FALSE);
 325  0109 4b00          	push	#0
 326  010b 4b3c          	push	#60
 327  010d ae2828        	ldw	x,#10280
 328  0110 cd01b8        	call	_LED_SetColor_Int
 330  0113 85            	popw	x
 331                     ; 219 	I2C_GeneralCallCmd(ENABLE);
 333  0114 a601          	ld	a,#1
 334  0116 cd0000        	call	_I2C_GeneralCallCmd
 336                     ; 220 	I2C_GenerateSTOP(ENABLE);
 338  0119 a601          	ld	a,#1
 339  011b cd0000        	call	_I2C_GenerateSTOP
 342  011e               L54:
 343                     ; 223 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
 345  011e ae1200        	ldw	x,#4608
 346  0121 cd0000        	call	_I2C_CheckEvent
 348  0124 a101          	cp	a,#1
 349  0126 26f6          	jrne	L54
 350                     ; 224 	received = I2C_ReceiveData();
 352  0128 cd0000        	call	_I2C_ReceiveData
 354  012b b708          	ld	_received,a
 356  012d               L55:
 357                     ; 225 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
 359  012d ae0240        	ldw	x,#576
 360  0130 cd0000        	call	_I2C_CheckEvent
 362  0133 a101          	cp	a,#1
 363  0135 26f6          	jrne	L55
 364                     ; 226 	received2 = I2C_ReceiveData();
 366  0137 cd0000        	call	_I2C_ReceiveData
 368  013a b709          	ld	_received2,a
 369                     ; 227 	I2C_GeneralCallCmd(DISABLE);
 371  013c 4f            	clr	a
 372  013d cd0000        	call	_I2C_GeneralCallCmd
 374                     ; 228 	LED_SetColor_Int(20, 20, 80, FALSE);
 376  0140 4b00          	push	#0
 377  0142 4b50          	push	#80
 378  0144 ae1414        	ldw	x,#5140
 379  0147 ad6f          	call	_LED_SetColor_Int
 381  0149 85            	popw	x
 382                     ; 231 	I2C_Configuration();
 384  014a ad37          	call	_I2C_Configuration
 386                     ; 232 	LED_SetColor_Int(0, 0, 100, FALSE);
 388  014c 4b00          	push	#0
 389  014e 4b64          	push	#100
 390  0150 5f            	clrw	x
 391  0151 ad65          	call	_LED_SetColor_Int
 393  0153 85            	popw	x
 394                     ; 234 	GPIO_Init(TRIGGER_PORT,  TRIGGER_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 396  0154 4bc0          	push	#192
 397  0156 4b04          	push	#4
 398  0158 ae5000        	ldw	x,#20480
 399  015b cd0000        	call	_GPIO_Init
 401  015e 85            	popw	x
 402                     ; 235 	LED_SetColor_Int(0, 0, 0, FALSE);
 404  015f 4b00          	push	#0
 405  0161 4b00          	push	#0
 406  0163 5f            	clrw	x
 407  0164 ad52          	call	_LED_SetColor_Int
 409  0166 85            	popw	x
 410                     ; 237   enableInterrupts();	
 413  0167 9a            rim
 416  0168               L76:
 417                     ; 240 		while ( I2C_CheckEvent(I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED)!= SUCCESS );
 419  0168 ae0682        	ldw	x,#1666
 420  016b cd0000        	call	_I2C_CheckEvent
 422  016e a101          	cp	a,#1
 423  0170 26f6          	jrne	L76
 424                     ; 241 		I2C_SendData(received2);
 426  0172 b609          	ld	a,_received2
 427  0174 cd0000        	call	_I2C_SendData
 430  0177               L57:
 431                     ; 242 		while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_TRANSMITTED)!= SUCCESS);
 433  0177 ae0684        	ldw	x,#1668
 434  017a cd0000        	call	_I2C_CheckEvent
 436  017d a101          	cp	a,#1
 437  017f 26f6          	jrne	L57
 439  0181 20e5          	jra	L76
 466                     ; 246 void I2C_Configuration(void) {
 467                     	switch	.text
 468  0183               _I2C_Configuration:
 472                     ; 247 	I2C_DeInit();
 474  0183 cd0000        	call	_I2C_DeInit
 476                     ; 248   I2C_Init(I2C_MAX_STANDARD_FREQ,
 476                     ; 249      (received2<<1),// Self address 
 476                     ; 250      I2C_DUTYCYCLE_2, 
 476                     ; 251      I2C_ACK_CURR,
 476                     ; 252      I2C_ADDMODE_7BIT, 
 476                     ; 253      I2C_MAX_INPUT_FREQ
 476                     ; 254   );
 478  0186 4b10          	push	#16
 479  0188 4b00          	push	#0
 480  018a 4b01          	push	#1
 481  018c 4b00          	push	#0
 482  018e b609          	ld	a,_received2
 483  0190 5f            	clrw	x
 484  0191 97            	ld	xl,a
 485  0192 58            	sllw	x
 486  0193 89            	pushw	x
 487  0194 ae86a0        	ldw	x,#34464
 488  0197 89            	pushw	x
 489  0198 ae0001        	ldw	x,#1
 490  019b 89            	pushw	x
 491  019c cd0000        	call	_I2C_Init
 493  019f 5b0a          	addw	sp,#10
 494                     ; 255 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
 494                     ; 256 	DISABLE);
 496  01a1 ae0600        	ldw	x,#1536
 497  01a4 cd0000        	call	_I2C_ITConfig
 499                     ; 259 }
 502  01a7 81            	ret
 555                     ; 270 void LED_SetColor(u8 r, u8 g, u8 b) {
 556                     	switch	.text
 557  01a8               _LED_SetColor:
 559  01a8 89            	pushw	x
 560       00000000      OFST:	set	0
 563                     ; 271 	LED_SetColor_Int(r, g, b, TRUE);
 565  01a9 4b01          	push	#1
 566  01ab 7b06          	ld	a,(OFST+6,sp)
 567  01ad 88            	push	a
 568  01ae 9f            	ld	a,xl
 569  01af 97            	ld	xl,a
 570  01b0 7b03          	ld	a,(OFST+3,sp)
 571  01b2 95            	ld	xh,a
 572  01b3 ad03          	call	_LED_SetColor_Int
 574  01b5 85            	popw	x
 575                     ; 272 }
 578  01b6 85            	popw	x
 579  01b7 81            	ret
 879                     ; 275 void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
 880                     	switch	.text
 881  01b8               _LED_SetColor_Int:
 883  01b8 89            	pushw	x
 884  01b9 5206          	subw	sp,#6
 885       00000006      OFST:	set	6
 888                     ; 276 	r = r > 100 ? 100 : r;
 890  01bb 7b07          	ld	a,(OFST+1,sp)
 891  01bd a165          	cp	a,#101
 892  01bf 2504          	jrult	L41
 893  01c1 a664          	ld	a,#100
 894  01c3 2002          	jra	L61
 895  01c5               L41:
 896  01c5 7b07          	ld	a,(OFST+1,sp)
 897  01c7               L61:
 898  01c7 6b07          	ld	(OFST+1,sp),a
 899                     ; 277 	g = g > 100 ? 100 : g;
 901  01c9 7b08          	ld	a,(OFST+2,sp)
 902  01cb a165          	cp	a,#101
 903  01cd 2504          	jrult	L02
 904  01cf a664          	ld	a,#100
 905  01d1 2002          	jra	L22
 906  01d3               L02:
 907  01d3 7b08          	ld	a,(OFST+2,sp)
 908  01d5               L22:
 909  01d5 6b08          	ld	(OFST+2,sp),a
 910                     ; 278 	b = b > 100 ? 100 : b;
 912  01d7 7b0b          	ld	a,(OFST+5,sp)
 913  01d9 a165          	cp	a,#101
 914  01db 2504          	jrult	L42
 915  01dd a664          	ld	a,#100
 916  01df 2002          	jra	L62
 917  01e1               L42:
 918  01e1 7b0b          	ld	a,(OFST+5,sp)
 919  01e3               L62:
 920  01e3 6b0b          	ld	(OFST+5,sp),a
 921                     ; 279 	if (changeInterrupts) disableInterrupts();
 923  01e5 0d0c          	tnz	(OFST+6,sp)
 924  01e7 2701          	jreq	L303
 928  01e9 9b            sim
 930  01ea               L303:
 931                     ; 262 	int i = 0;
 935                     ; 263 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
 937  01ea 72135000      	bres	20480,#1
 938                     ; 265 	for (i = 1280; i >= 0; i--) {
 940  01ee ae0500        	ldw	x,#1280
 941  01f1 1f05          	ldw	(OFST-1,sp),x
 942  01f3               L503:
 943                     ; 266 		nop();
 946  01f3 9d            nop
 948                     ; 265 	for (i = 1280; i >= 0; i--) {
 951  01f4 1e05          	ldw	x,(OFST-1,sp)
 952  01f6 1d0001        	subw	x,#1
 953  01f9 1f05          	ldw	(OFST-1,sp),x
 956  01fb 9c            	rvf
 957  01fc 1e05          	ldw	x,(OFST-1,sp)
 958  01fe 2ef3          	jrsge	L503
 959                     ; 281 	LED_SendByte(g);
 962  0200 7b08          	ld	a,(OFST+2,sp)
 963  0202 6b04          	ld	(OFST-2,sp),a
 964                     ; 111 	int i = 0;
 966                     ; 113 	for (i = 7; i >= 0; i--) {
 968  0204 ae0007        	ldw	x,#7
 969  0207 1f05          	ldw	(OFST-1,sp),x
 970  0209               L313:
 971                     ; 114 		bool bit = (1<<i & data);
 973  0209 7b04          	ld	a,(OFST-2,sp)
 974  020b 5f            	clrw	x
 975  020c 97            	ld	xl,a
 976  020d 1f01          	ldw	(OFST-5,sp),x
 977  020f ae0001        	ldw	x,#1
 978  0212 7b06          	ld	a,(OFST+0,sp)
 979  0214 4d            	tnz	a
 980  0215 2704          	jreq	L03
 981  0217               L23:
 982  0217 58            	sllw	x
 983  0218 4a            	dec	a
 984  0219 26fc          	jrne	L23
 985  021b               L03:
 986  021b 01            	rrwa	x,a
 987  021c 1402          	and	a,(OFST-4,sp)
 988  021e 01            	rrwa	x,a
 989  021f 1401          	and	a,(OFST-5,sp)
 990  0221 01            	rrwa	x,a
 991  0222 01            	rrwa	x,a
 992  0223 6b03          	ld	(OFST-3,sp),a
 993  0225 02            	rlwa	x,a
 994                     ; 115 		if (bit != 0) {
 996  0226 0d03          	tnz	(OFST-3,sp)
 997  0228 271c          	jreq	L123
 998                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1001  022a 72125000      	bset	20480,#1
1002                     ; 66 	nop();
1005  022e 9d            nop
1007                     ; 67 	nop();
1011  022f 9d            nop
1013                     ; 68 	nop();
1017  0230 9d            nop
1019                     ; 69 	nop();
1023  0231 9d            nop
1025                     ; 70 	nop();
1029  0232 9d            nop
1031                     ; 71 	nop();
1035  0233 9d            nop
1037                     ; 72 	nop();
1041  0234 9d            nop
1043                     ; 73 	nop();
1047  0235 9d            nop
1049                     ; 74 	nop();
1053  0236 9d            nop
1055                     ; 75 	nop();
1059  0237 9d            nop
1061                     ; 76 	nop();
1065  0238 9d            nop
1067                     ; 77 	nop();
1071  0239 9d            nop
1073                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1076  023a 72135000      	bres	20480,#1
1077                     ; 79 	nop();
1080  023e 9d            nop
1082                     ; 80 	nop();
1086  023f 9d            nop
1088                     ; 81 	nop();
1092  0240 9d            nop
1094                     ; 82 	nop();
1098  0241 9d            nop
1100                     ; 83 	nop();
1104  0242 9d            nop
1106                     ; 84 	nop();
1110  0243 9d            nop
1113  0244 201a          	jra	L323
1114  0246               L123:
1115                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1118  0246 72125000      	bset	20480,#1
1119                     ; 89 	nop();
1122  024a 9d            nop
1124                     ; 90 	nop();
1128  024b 9d            nop
1130                     ; 91 	nop();
1134  024c 9d            nop
1136                     ; 92 	nop();
1140  024d 9d            nop
1142                     ; 93 	nop();
1146  024e 9d            nop
1148                     ; 94 	nop();
1152  024f 9d            nop
1154                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1157  0250 72135000      	bres	20480,#1
1158                     ; 96 	nop();
1161  0254 9d            nop
1163                     ; 97 	nop();
1167  0255 9d            nop
1169                     ; 98 	nop();
1173  0256 9d            nop
1175                     ; 99 	nop();
1179  0257 9d            nop
1181                     ; 100 	nop();
1185  0258 9d            nop
1187                     ; 101 	nop();
1191  0259 9d            nop
1193                     ; 102 	nop();
1197  025a 9d            nop
1199                     ; 103 	nop();
1203  025b 9d            nop
1205                     ; 104 	nop();
1209  025c 9d            nop
1211                     ; 105 	nop();
1215  025d 9d            nop
1217                     ; 106 	nop();
1221  025e 9d            nop
1223                     ; 107 	nop();
1227  025f 9d            nop
1229  0260               L323:
1230                     ; 113 	for (i = 7; i >= 0; i--) {
1232  0260 1e05          	ldw	x,(OFST-1,sp)
1233  0262 1d0001        	subw	x,#1
1234  0265 1f05          	ldw	(OFST-1,sp),x
1237  0267 9c            	rvf
1238  0268 1e05          	ldw	x,(OFST-1,sp)
1239  026a 2f02          	jrslt	L44
1240  026c 209b          	jp	L313
1241  026e               L44:
1242                     ; 282 	LED_SendByte(r);
1245  026e 7b07          	ld	a,(OFST+1,sp)
1246  0270 6b04          	ld	(OFST-2,sp),a
1247                     ; 111 	int i = 0;
1249                     ; 113 	for (i = 7; i >= 0; i--) {
1251  0272 ae0007        	ldw	x,#7
1252  0275 1f05          	ldw	(OFST-1,sp),x
1253  0277               L523:
1254                     ; 114 		bool bit = (1<<i & data);
1256  0277 7b04          	ld	a,(OFST-2,sp)
1257  0279 5f            	clrw	x
1258  027a 97            	ld	xl,a
1259  027b 1f01          	ldw	(OFST-5,sp),x
1260  027d ae0001        	ldw	x,#1
1261  0280 7b06          	ld	a,(OFST+0,sp)
1262  0282 4d            	tnz	a
1263  0283 2704          	jreq	L43
1264  0285               L63:
1265  0285 58            	sllw	x
1266  0286 4a            	dec	a
1267  0287 26fc          	jrne	L63
1268  0289               L43:
1269  0289 01            	rrwa	x,a
1270  028a 1402          	and	a,(OFST-4,sp)
1271  028c 01            	rrwa	x,a
1272  028d 1401          	and	a,(OFST-5,sp)
1273  028f 01            	rrwa	x,a
1274  0290 01            	rrwa	x,a
1275  0291 6b03          	ld	(OFST-3,sp),a
1276  0293 02            	rlwa	x,a
1277                     ; 115 		if (bit != 0) {
1279  0294 0d03          	tnz	(OFST-3,sp)
1280  0296 271c          	jreq	L333
1281                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1284  0298 72125000      	bset	20480,#1
1285                     ; 66 	nop();
1288  029c 9d            nop
1290                     ; 67 	nop();
1294  029d 9d            nop
1296                     ; 68 	nop();
1300  029e 9d            nop
1302                     ; 69 	nop();
1306  029f 9d            nop
1308                     ; 70 	nop();
1312  02a0 9d            nop
1314                     ; 71 	nop();
1318  02a1 9d            nop
1320                     ; 72 	nop();
1324  02a2 9d            nop
1326                     ; 73 	nop();
1330  02a3 9d            nop
1332                     ; 74 	nop();
1336  02a4 9d            nop
1338                     ; 75 	nop();
1342  02a5 9d            nop
1344                     ; 76 	nop();
1348  02a6 9d            nop
1350                     ; 77 	nop();
1354  02a7 9d            nop
1356                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1359  02a8 72135000      	bres	20480,#1
1360                     ; 79 	nop();
1363  02ac 9d            nop
1365                     ; 80 	nop();
1369  02ad 9d            nop
1371                     ; 81 	nop();
1375  02ae 9d            nop
1377                     ; 82 	nop();
1381  02af 9d            nop
1383                     ; 83 	nop();
1387  02b0 9d            nop
1389                     ; 84 	nop();
1393  02b1 9d            nop
1396  02b2 201a          	jra	L533
1397  02b4               L333:
1398                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1401  02b4 72125000      	bset	20480,#1
1402                     ; 89 	nop();
1405  02b8 9d            nop
1407                     ; 90 	nop();
1411  02b9 9d            nop
1413                     ; 91 	nop();
1417  02ba 9d            nop
1419                     ; 92 	nop();
1423  02bb 9d            nop
1425                     ; 93 	nop();
1429  02bc 9d            nop
1431                     ; 94 	nop();
1435  02bd 9d            nop
1437                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1440  02be 72135000      	bres	20480,#1
1441                     ; 96 	nop();
1444  02c2 9d            nop
1446                     ; 97 	nop();
1450  02c3 9d            nop
1452                     ; 98 	nop();
1456  02c4 9d            nop
1458                     ; 99 	nop();
1462  02c5 9d            nop
1464                     ; 100 	nop();
1468  02c6 9d            nop
1470                     ; 101 	nop();
1474  02c7 9d            nop
1476                     ; 102 	nop();
1480  02c8 9d            nop
1482                     ; 103 	nop();
1486  02c9 9d            nop
1488                     ; 104 	nop();
1492  02ca 9d            nop
1494                     ; 105 	nop();
1498  02cb 9d            nop
1500                     ; 106 	nop();
1504  02cc 9d            nop
1506                     ; 107 	nop();
1510  02cd 9d            nop
1512  02ce               L533:
1513                     ; 113 	for (i = 7; i >= 0; i--) {
1515  02ce 1e05          	ldw	x,(OFST-1,sp)
1516  02d0 1d0001        	subw	x,#1
1517  02d3 1f05          	ldw	(OFST-1,sp),x
1520  02d5 9c            	rvf
1521  02d6 1e05          	ldw	x,(OFST-1,sp)
1522  02d8 2f02          	jrslt	L64
1523  02da 209b          	jp	L523
1524  02dc               L64:
1525                     ; 283 	LED_SendByte(b);
1528  02dc 7b0b          	ld	a,(OFST+5,sp)
1529  02de 6b04          	ld	(OFST-2,sp),a
1530                     ; 111 	int i = 0;
1532                     ; 113 	for (i = 7; i >= 0; i--) {
1534  02e0 ae0007        	ldw	x,#7
1535  02e3 1f05          	ldw	(OFST-1,sp),x
1536  02e5               L733:
1537                     ; 114 		bool bit = (1<<i & data);
1539  02e5 7b04          	ld	a,(OFST-2,sp)
1540  02e7 5f            	clrw	x
1541  02e8 97            	ld	xl,a
1542  02e9 1f01          	ldw	(OFST-5,sp),x
1543  02eb ae0001        	ldw	x,#1
1544  02ee 7b06          	ld	a,(OFST+0,sp)
1545  02f0 4d            	tnz	a
1546  02f1 2704          	jreq	L04
1547  02f3               L24:
1548  02f3 58            	sllw	x
1549  02f4 4a            	dec	a
1550  02f5 26fc          	jrne	L24
1551  02f7               L04:
1552  02f7 01            	rrwa	x,a
1553  02f8 1402          	and	a,(OFST-4,sp)
1554  02fa 01            	rrwa	x,a
1555  02fb 1401          	and	a,(OFST-5,sp)
1556  02fd 01            	rrwa	x,a
1557  02fe 01            	rrwa	x,a
1558  02ff 6b03          	ld	(OFST-3,sp),a
1559  0301 02            	rlwa	x,a
1560                     ; 115 		if (bit != 0) {
1562  0302 0d03          	tnz	(OFST-3,sp)
1563  0304 271c          	jreq	L543
1564                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1567  0306 72125000      	bset	20480,#1
1568                     ; 66 	nop();
1571  030a 9d            nop
1573                     ; 67 	nop();
1577  030b 9d            nop
1579                     ; 68 	nop();
1583  030c 9d            nop
1585                     ; 69 	nop();
1589  030d 9d            nop
1591                     ; 70 	nop();
1595  030e 9d            nop
1597                     ; 71 	nop();
1601  030f 9d            nop
1603                     ; 72 	nop();
1607  0310 9d            nop
1609                     ; 73 	nop();
1613  0311 9d            nop
1615                     ; 74 	nop();
1619  0312 9d            nop
1621                     ; 75 	nop();
1625  0313 9d            nop
1627                     ; 76 	nop();
1631  0314 9d            nop
1633                     ; 77 	nop();
1637  0315 9d            nop
1639                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1642  0316 72135000      	bres	20480,#1
1643                     ; 79 	nop();
1646  031a 9d            nop
1648                     ; 80 	nop();
1652  031b 9d            nop
1654                     ; 81 	nop();
1658  031c 9d            nop
1660                     ; 82 	nop();
1664  031d 9d            nop
1666                     ; 83 	nop();
1670  031e 9d            nop
1672                     ; 84 	nop();
1676  031f 9d            nop
1679  0320 201a          	jra	L743
1680  0322               L543:
1681                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1684  0322 72125000      	bset	20480,#1
1685                     ; 89 	nop();
1688  0326 9d            nop
1690                     ; 90 	nop();
1694  0327 9d            nop
1696                     ; 91 	nop();
1700  0328 9d            nop
1702                     ; 92 	nop();
1706  0329 9d            nop
1708                     ; 93 	nop();
1712  032a 9d            nop
1714                     ; 94 	nop();
1718  032b 9d            nop
1720                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1723  032c 72135000      	bres	20480,#1
1724                     ; 96 	nop();
1727  0330 9d            nop
1729                     ; 97 	nop();
1733  0331 9d            nop
1735                     ; 98 	nop();
1739  0332 9d            nop
1741                     ; 99 	nop();
1745  0333 9d            nop
1747                     ; 100 	nop();
1751  0334 9d            nop
1753                     ; 101 	nop();
1757  0335 9d            nop
1759                     ; 102 	nop();
1763  0336 9d            nop
1765                     ; 103 	nop();
1769  0337 9d            nop
1771                     ; 104 	nop();
1775  0338 9d            nop
1777                     ; 105 	nop();
1781  0339 9d            nop
1783                     ; 106 	nop();
1787  033a 9d            nop
1789                     ; 107 	nop();
1793  033b 9d            nop
1795  033c               L743:
1796                     ; 113 	for (i = 7; i >= 0; i--) {
1798  033c 1e05          	ldw	x,(OFST-1,sp)
1799  033e 1d0001        	subw	x,#1
1800  0341 1f05          	ldw	(OFST-1,sp),x
1803  0343 9c            	rvf
1804  0344 1e05          	ldw	x,(OFST-1,sp)
1805  0346 2f02          	jrslt	L05
1806  0348 209b          	jp	L733
1807  034a               L05:
1808                     ; 262 	int i = 0;
1811                     ; 263 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1813  034a 72135000      	bres	20480,#1
1814                     ; 265 	for (i = 1280; i >= 0; i--) {
1816  034e ae0500        	ldw	x,#1280
1817  0351 1f05          	ldw	(OFST-1,sp),x
1818  0353               L153:
1819                     ; 266 		nop();
1822  0353 9d            nop
1824                     ; 265 	for (i = 1280; i >= 0; i--) {
1827  0354 1e05          	ldw	x,(OFST-1,sp)
1828  0356 1d0001        	subw	x,#1
1829  0359 1f05          	ldw	(OFST-1,sp),x
1832  035b 9c            	rvf
1833  035c 1e05          	ldw	x,(OFST-1,sp)
1834  035e 2ef3          	jrsge	L153
1835                     ; 285 	if (changeInterrupts) enableInterrupts();
1837  0360 0d0c          	tnz	(OFST+6,sp)
1838  0362 2701          	jreq	L753
1842  0364 9a            rim
1844  0365               L753:
1845                     ; 290 }
1849  0365 5b08          	addw	sp,#8
1850  0367 81            	ret
1877                     ; 292 void TIMER_Configuration(void)
1877                     ; 293 {
1878                     	switch	.text
1879  0368               _TIMER_Configuration:
1883                     ; 294   TIM4_DeInit();
1885  0368 cd0000        	call	_TIM4_DeInit
1887                     ; 297   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x7F );
1889  036b ae077f        	ldw	x,#1919
1890  036e cd0000        	call	_TIM4_TimeBaseInit
1892                     ; 300   TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
1894  0371 ae0100        	ldw	x,#256
1895  0374 cd0000        	call	_TIM4_ITConfig
1897                     ; 301 }
1900  0377 81            	ret
1939                     ; 303 void I2C_SendPacket(u8 data) {
1940                     	switch	.text
1941  0378               _I2C_SendPacket:
1945                     ; 304 	I2C_GenerateSTART(ENABLE);	
1947  0378 a601          	ld	a,#1
1948  037a cd0000        	call	_I2C_GenerateSTART
1951  037d               L114:
1952                     ; 305 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
1954  037d ae0301        	ldw	x,#769
1955  0380 cd0000        	call	_I2C_CheckEvent
1957  0383 4d            	tnz	a
1958  0384 27f7          	jreq	L114
1959                     ; 307 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
1961  0386 ae1000        	ldw	x,#4096
1962  0389 cd0000        	call	_I2C_Send7bitAddress
1965  038c               L714:
1966                     ; 309 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) ) {}
1968  038c ae0782        	ldw	x,#1922
1969  038f cd0000        	call	_I2C_CheckEvent
1971  0392 4d            	tnz	a
1972  0393 27f7          	jreq	L714
1973                     ; 311 	I2C_SendData(12);
1975  0395 a60c          	ld	a,#12
1976  0397 cd0000        	call	_I2C_SendData
1979  039a               L524:
1980                     ; 312 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS ) {}
1982  039a ae0784        	ldw	x,#1924
1983  039d cd0000        	call	_I2C_CheckEvent
1985  03a0 a101          	cp	a,#1
1986  03a2 26f6          	jrne	L524
1987                     ; 313 	I2C_SendData(0x01);
1989  03a4 a601          	ld	a,#1
1990  03a6 cd0000        	call	_I2C_SendData
1993  03a9               L334:
1994                     ; 314 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS ) {}
1996  03a9 ae0784        	ldw	x,#1924
1997  03ac cd0000        	call	_I2C_CheckEvent
1999  03af a101          	cp	a,#1
2000  03b1 26f6          	jrne	L334
2001                     ; 315 	I2C_SendData(20);
2003  03b3 a614          	ld	a,#20
2004  03b5 cd0000        	call	_I2C_SendData
2007  03b8               L144:
2008                     ; 316 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) {}
2010  03b8 ae0784        	ldw	x,#1924
2011  03bb cd0000        	call	_I2C_CheckEvent
2013  03be a101          	cp	a,#1
2014  03c0 26f6          	jrne	L144
2015                     ; 317 	I2C_GenerateSTOP(ENABLE);
2017  03c2 a601          	ld	a,#1
2018  03c4 cd0000        	call	_I2C_GenerateSTOP
2020                     ; 318 }
2023  03c7 81            	ret
2058                     ; 331 void assert_failed(u8* file, u32 line)
2058                     ; 332 {
2059                     	switch	.text
2060  03c8               _assert_failed:
2064  03c8               L364:
2065  03c8 20fe          	jra	L364
2200                     	xdef	_I2C_SendPacket
2201                     	xdef	_main
2202                     	xdef	_LED_SetColor
2203                     	xdef	_LED_SetColor_Int
2204                     	xdef	_TIMER_Configuration
2205                     	xdef	_I2C_Configuration
2206                     	xdef	_ping_received
2207                     	xdef	_received2
2208                     	xdef	_received
2209                     	xdef	_velocity
2210                     	switch	.ubsct
2211  0000               _TxBuffer:
2212  0000 000000000000  	ds.b	7
2213                     	xdef	_TxBuffer
2214                     	xdef	_next_case
2215                     	xdef	_NumOfBytes
2216                     	xdef	_i
2217                     	xdef	_PeriodNumber
2218  0007               _Counter:
2219  0007 00            	ds.b	1
2220                     	xdef	_Counter
2221                     	xdef	_button_state
2222                     	xdef	_previous_button_state
2223                     	xdef	_User_Key_Pressed
2224                     	xdef	_assert_failed
2225                     	xref	_TIM4_ITConfig
2226                     	xref	_TIM4_TimeBaseInit
2227                     	xref	_TIM4_DeInit
2228                     	xref	_I2C_CheckEvent
2229                     	xref	_I2C_SendData
2230                     	xref	_I2C_Send7bitAddress
2231                     	xref	_I2C_ReceiveData
2232                     	xref	_I2C_ITConfig
2233                     	xref	_I2C_GenerateSTOP
2234                     	xref	_I2C_GenerateSTART
2235                     	xref	_I2C_GeneralCallCmd
2236                     	xref	_I2C_Init
2237                     	xref	_I2C_DeInit
2238                     	xref	_GPIO_WriteLow
2239                     	xref	_GPIO_WriteHigh
2240                     	xref	_GPIO_Init
2241                     	xref	_EXTI_SetExtIntSensitivity
2242                     	xref	_CLK_SYSCLKConfig
2243                     	xref	_CLK_HSIPrescalerConfig
2244                     	xref	_CLK_PeripheralClockConfig
2245                     	xref	_CLK_FastHaltWakeUpCmd
2246                     	xref	_CLK_HSICmd
2247                     	xref	_CLK_DeInit
2267                     	end
