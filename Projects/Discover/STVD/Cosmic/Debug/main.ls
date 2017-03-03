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
  91                     ; 154 void main(void)
  91                     ; 155 {
  93                     	switch	.text
  94  0000               _main:
  98                     ; 157 	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 100  0000 4bd0          	push	#208
 101  0002 4b04          	push	#4
 102  0004 ae5000        	ldw	x,#20480
 103  0007 cd0000        	call	_GPIO_Init
 105  000a 85            	popw	x
 106                     ; 158 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 108  000b 4b04          	push	#4
 109  000d ae5000        	ldw	x,#20480
 110  0010 cd0000        	call	_GPIO_WriteHigh
 112  0013 84            	pop	a
 113                     ; 159 	GPIO_WriteLow(TRIGGER_PORT,TRIGGER_PIN);
 115  0014 4b04          	push	#4
 116  0016 ae5000        	ldw	x,#20480
 117  0019 cd0000        	call	_GPIO_WriteLow
 119  001c 84            	pop	a
 120                     ; 160 	GPIO_WriteHigh(TRIGGER_PORT,TRIGGER_PIN);
 122  001d 4b04          	push	#4
 123  001f ae5000        	ldw	x,#20480
 124  0022 cd0000        	call	_GPIO_WriteHigh
 126  0025 84            	pop	a
 127                     ; 161 	CLK_DeInit();  
 129  0026 cd0000        	call	_CLK_DeInit
 131                     ; 162   CLK_HSICmd(ENABLE);
 133  0029 a601          	ld	a,#1
 134  002b cd0000        	call	_CLK_HSICmd
 136                     ; 163   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 138  002e 4f            	clr	a
 139  002f cd0000        	call	_CLK_HSIPrescalerConfig
 141                     ; 164   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 143  0032 a680          	ld	a,#128
 144  0034 cd0000        	call	_CLK_SYSCLKConfig
 146                     ; 165 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 148  0037 ae0100        	ldw	x,#256
 149  003a cd0000        	call	_CLK_PeripheralClockConfig
 151                     ; 166 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 153  003d ae0300        	ldw	x,#768
 154  0040 cd0000        	call	_CLK_PeripheralClockConfig
 156                     ; 167 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 158  0043 ae0300        	ldw	x,#768
 159  0046 cd0000        	call	_CLK_PeripheralClockConfig
 161                     ; 168 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 163  0049 ae0300        	ldw	x,#768
 164  004c cd0000        	call	_CLK_PeripheralClockConfig
 166                     ; 169 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, DISABLE);
 168  004f ae0400        	ldw	x,#1024
 169  0052 cd0000        	call	_CLK_PeripheralClockConfig
 171                     ; 170 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, DISABLE);
 173  0055 ae0500        	ldw	x,#1280
 174  0058 cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 171 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 178  005b ae0600        	ldw	x,#1536
 179  005e cd0000        	call	_CLK_PeripheralClockConfig
 181                     ; 172 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 183  0061 ae0500        	ldw	x,#1280
 184  0064 cd0000        	call	_CLK_PeripheralClockConfig
 186                     ; 173 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 188  0067 ae0700        	ldw	x,#1792
 189  006a cd0000        	call	_CLK_PeripheralClockConfig
 191                     ; 174 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 193  006d ae1300        	ldw	x,#4864
 194  0070 cd0000        	call	_CLK_PeripheralClockConfig
 196                     ; 175 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 198  0073 ae1200        	ldw	x,#4608
 199  0076 cd0000        	call	_CLK_PeripheralClockConfig
 201                     ; 176 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
 203  0079 ae1700        	ldw	x,#5888
 204  007c cd0000        	call	_CLK_PeripheralClockConfig
 206                     ; 177 	CLK_FastHaltWakeUpCmd(DISABLE);
 208  007f 4f            	clr	a
 209  0080 cd0000        	call	_CLK_FastHaltWakeUpCmd
 211                     ; 183 	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
 213  0083 4b60          	push	#96
 214  0085 4b20          	push	#32
 215  0087 ae500a        	ldw	x,#20490
 216  008a cd0000        	call	_GPIO_Init
 218  008d 85            	popw	x
 219                     ; 184 	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
 221  008e 4b60          	push	#96
 222  0090 4b08          	push	#8
 223  0092 ae500a        	ldw	x,#20490
 224  0095 cd0000        	call	_GPIO_Init
 226  0098 85            	popw	x
 227                     ; 190 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 229  0099 ae0202        	ldw	x,#514
 230  009c cd0000        	call	_EXTI_SetExtIntSensitivity
 232                     ; 193   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 234  009f 4be0          	push	#224
 235  00a1 4b02          	push	#2
 236  00a3 ae5000        	ldw	x,#20480
 237  00a6 cd0000        	call	_GPIO_Init
 239  00a9 85            	popw	x
 240                     ; 195 	LED_SetColor_Int(100, 0, 0, FALSE);
 242  00aa 4b00          	push	#0
 243  00ac 4b00          	push	#0
 244  00ae ae6400        	ldw	x,#25600
 245  00b1 cd019f        	call	_LED_SetColor_Int
 247  00b4 85            	popw	x
 248                     ; 196   TIMER_Configuration();
 250  00b5 cd034f        	call	_TIMER_Configuration
 252                     ; 197 	I2C_Configuration();
 254  00b8 cd016b        	call	_I2C_Configuration
 256                     ; 198 	LED_SetColor_Int(100, 100, 0, FALSE);
 258  00bb 4b00          	push	#0
 259  00bd 4b00          	push	#0
 260  00bf ae6464        	ldw	x,#25700
 261  00c2 cd019f        	call	_LED_SetColor_Int
 263  00c5 85            	popw	x
 264                     ; 201 	I2C_GenerateSTART(ENABLE);
 266  00c6 a601          	ld	a,#1
 267  00c8 cd0000        	call	_I2C_GenerateSTART
 270  00cb               L32:
 271                     ; 202 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
 273  00cb ae0301        	ldw	x,#769
 274  00ce cd0000        	call	_I2C_CheckEvent
 276  00d1 4d            	tnz	a
 277  00d2 27f7          	jreq	L32
 278                     ; 203 	LED_SetColor_Int(80, 80, 20, FALSE);
 280  00d4 4b00          	push	#0
 281  00d6 4b14          	push	#20
 282  00d8 ae5050        	ldw	x,#20560
 283  00db cd019f        	call	_LED_SetColor_Int
 285  00de 85            	popw	x
 286                     ; 205 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
 288  00df ae1000        	ldw	x,#4096
 289  00e2 cd0000        	call	_I2C_Send7bitAddress
 292  00e5               L13:
 293                     ; 206 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
 295  00e5 ae0782        	ldw	x,#1922
 296  00e8 cd0000        	call	_I2C_CheckEvent
 298  00eb a101          	cp	a,#1
 299  00ed 26f6          	jrne	L13
 300                     ; 207 	LED_SetColor_Int(60, 60, 40, FALSE);
 302  00ef 4b00          	push	#0
 303  00f1 4b28          	push	#40
 304  00f3 ae3c3c        	ldw	x,#15420
 305  00f6 cd019f        	call	_LED_SetColor_Int
 307  00f9 85            	popw	x
 308                     ; 210 	I2C_SendData(0x01);
 310  00fa a601          	ld	a,#1
 311  00fc cd0000        	call	_I2C_SendData
 314  00ff               L73:
 315                     ; 211 	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
 317  00ff ae0784        	ldw	x,#1924
 318  0102 cd0000        	call	_I2C_CheckEvent
 320  0105 a101          	cp	a,#1
 321  0107 26f6          	jrne	L73
 322                     ; 212 	LED_SetColor_Int(40, 40, 60, FALSE);
 324  0109 4b00          	push	#0
 325  010b 4b3c          	push	#60
 326  010d ae2828        	ldw	x,#10280
 327  0110 cd019f        	call	_LED_SetColor_Int
 329  0113 85            	popw	x
 330                     ; 214 	I2C_GeneralCallCmd(ENABLE);
 332  0114 a601          	ld	a,#1
 333  0116 cd0000        	call	_I2C_GeneralCallCmd
 335                     ; 215 	I2C_GenerateSTOP(ENABLE);
 337  0119 a601          	ld	a,#1
 338  011b cd0000        	call	_I2C_GenerateSTOP
 341  011e               L54:
 342                     ; 219 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
 344  011e ae1200        	ldw	x,#4608
 345  0121 cd0000        	call	_I2C_CheckEvent
 347  0124 a101          	cp	a,#1
 348  0126 26f6          	jrne	L54
 349                     ; 220 	received = I2C_ReceiveData();
 351  0128 cd0000        	call	_I2C_ReceiveData
 353  012b b708          	ld	_received,a
 355  012d               L55:
 356                     ; 221 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
 358  012d ae0240        	ldw	x,#576
 359  0130 cd0000        	call	_I2C_CheckEvent
 361  0133 a101          	cp	a,#1
 362  0135 26f6          	jrne	L55
 363                     ; 222 	received2 = I2C_ReceiveData();
 365  0137 cd0000        	call	_I2C_ReceiveData
 367  013a b709          	ld	_received2,a
 368                     ; 223 	I2C_GeneralCallCmd(DISABLE);
 370  013c 4f            	clr	a
 371  013d cd0000        	call	_I2C_GeneralCallCmd
 373                     ; 224 	LED_SetColor_Int(20, 20, 80, FALSE);
 375  0140 4b00          	push	#0
 376  0142 4b50          	push	#80
 377  0144 ae1414        	ldw	x,#5140
 378  0147 ad56          	call	_LED_SetColor_Int
 380  0149 85            	popw	x
 381                     ; 227 	I2C_Configuration();
 383  014a ad1f          	call	_I2C_Configuration
 385                     ; 228 	LED_SetColor_Int(0, 0, 100, FALSE);
 387  014c 4b00          	push	#0
 388  014e 4b64          	push	#100
 389  0150 5f            	clrw	x
 390  0151 ad4c          	call	_LED_SetColor_Int
 392  0153 85            	popw	x
 393                     ; 230 	GPIO_Init(TRIGGER_PORT,  TRIGGER_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 395  0154 4bc0          	push	#192
 396  0156 4b04          	push	#4
 397  0158 ae5000        	ldw	x,#20480
 398  015b cd0000        	call	_GPIO_Init
 400  015e 85            	popw	x
 401                     ; 231 	LED_SetColor_Int(0, 0, 0, FALSE);
 403  015f 4b00          	push	#0
 404  0161 4b00          	push	#0
 405  0163 5f            	clrw	x
 406  0164 ad39          	call	_LED_SetColor_Int
 408  0166 85            	popw	x
 409                     ; 233   enableInterrupts();	
 412  0167 9a            rim
 414  0168               L16:
 415                     ; 235 	  halt();
 418  0168 8e            halt
 422  0169 20fd          	jra	L16
 449                     ; 239 void I2C_Configuration(void) {
 450                     	switch	.text
 451  016b               _I2C_Configuration:
 455                     ; 243 	I2C_DeInit();
 457  016b cd0000        	call	_I2C_DeInit
 459                     ; 245   I2C_Init(I2C_MAX_STANDARD_FREQ,
 459                     ; 246      received2,// Self address 
 459                     ; 247      I2C_DUTYCYCLE_2, 
 459                     ; 248      I2C_ACK_CURR,
 459                     ; 249      I2C_ADDMODE_7BIT, 
 459                     ; 250      I2C_MAX_INPUT_FREQ
 459                     ; 251   );
 461  016e 4b10          	push	#16
 462  0170 4b00          	push	#0
 463  0172 4b01          	push	#1
 464  0174 4b00          	push	#0
 465  0176 b609          	ld	a,_received2
 466  0178 5f            	clrw	x
 467  0179 97            	ld	xl,a
 468  017a 89            	pushw	x
 469  017b ae86a0        	ldw	x,#34464
 470  017e 89            	pushw	x
 471  017f ae0001        	ldw	x,#1
 472  0182 89            	pushw	x
 473  0183 cd0000        	call	_I2C_Init
 475  0186 5b0a          	addw	sp,#10
 476                     ; 252 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
 476                     ; 253 	DISABLE);
 478  0188 ae0600        	ldw	x,#1536
 479  018b cd0000        	call	_I2C_ITConfig
 481                     ; 256 }
 484  018e 81            	ret
 537                     ; 267 void LED_SetColor(u8 r, u8 g, u8 b) {
 538                     	switch	.text
 539  018f               _LED_SetColor:
 541  018f 89            	pushw	x
 542       00000000      OFST:	set	0
 545                     ; 268 	LED_SetColor_Int(r, g, b, TRUE);
 547  0190 4b01          	push	#1
 548  0192 7b06          	ld	a,(OFST+6,sp)
 549  0194 88            	push	a
 550  0195 9f            	ld	a,xl
 551  0196 97            	ld	xl,a
 552  0197 7b03          	ld	a,(OFST+3,sp)
 553  0199 95            	ld	xh,a
 554  019a ad03          	call	_LED_SetColor_Int
 556  019c 85            	popw	x
 557                     ; 269 }
 560  019d 85            	popw	x
 561  019e 81            	ret
 861                     ; 272 void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
 862                     	switch	.text
 863  019f               _LED_SetColor_Int:
 865  019f 89            	pushw	x
 866  01a0 5206          	subw	sp,#6
 867       00000006      OFST:	set	6
 870                     ; 273 	r = r > 100 ? 100 : r;
 872  01a2 7b07          	ld	a,(OFST+1,sp)
 873  01a4 a165          	cp	a,#101
 874  01a6 2504          	jrult	L41
 875  01a8 a664          	ld	a,#100
 876  01aa 2002          	jra	L61
 877  01ac               L41:
 878  01ac 7b07          	ld	a,(OFST+1,sp)
 879  01ae               L61:
 880  01ae 6b07          	ld	(OFST+1,sp),a
 881                     ; 274 	g = g > 100 ? 100 : g;
 883  01b0 7b08          	ld	a,(OFST+2,sp)
 884  01b2 a165          	cp	a,#101
 885  01b4 2504          	jrult	L02
 886  01b6 a664          	ld	a,#100
 887  01b8 2002          	jra	L22
 888  01ba               L02:
 889  01ba 7b08          	ld	a,(OFST+2,sp)
 890  01bc               L22:
 891  01bc 6b08          	ld	(OFST+2,sp),a
 892                     ; 275 	b = b > 100 ? 100 : b;
 894  01be 7b0b          	ld	a,(OFST+5,sp)
 895  01c0 a165          	cp	a,#101
 896  01c2 2504          	jrult	L42
 897  01c4 a664          	ld	a,#100
 898  01c6 2002          	jra	L62
 899  01c8               L42:
 900  01c8 7b0b          	ld	a,(OFST+5,sp)
 901  01ca               L62:
 902  01ca 6b0b          	ld	(OFST+5,sp),a
 903                     ; 276 	if (changeInterrupts) disableInterrupts();
 905  01cc 0d0c          	tnz	(OFST+6,sp)
 906  01ce 2701          	jreq	L762
 910  01d0 9b            sim
 912  01d1               L762:
 913                     ; 259 	int i = 0;
 917                     ; 260 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
 919  01d1 72135000      	bres	20480,#1
 920                     ; 262 	for (i = 1280; i >= 0; i--) {
 922  01d5 ae0500        	ldw	x,#1280
 923  01d8 1f05          	ldw	(OFST-1,sp),x
 924  01da               L172:
 925                     ; 263 		nop();
 928  01da 9d            nop
 930                     ; 262 	for (i = 1280; i >= 0; i--) {
 933  01db 1e05          	ldw	x,(OFST-1,sp)
 934  01dd 1d0001        	subw	x,#1
 935  01e0 1f05          	ldw	(OFST-1,sp),x
 938  01e2 9c            	rvf
 939  01e3 1e05          	ldw	x,(OFST-1,sp)
 940  01e5 2ef3          	jrsge	L172
 941                     ; 278 	LED_SendByte(g);
 944  01e7 7b08          	ld	a,(OFST+2,sp)
 945  01e9 6b04          	ld	(OFST-2,sp),a
 946                     ; 110 	int i = 0;
 948                     ; 112 	for (i = 7; i >= 0; i--) {
 950  01eb ae0007        	ldw	x,#7
 951  01ee 1f05          	ldw	(OFST-1,sp),x
 952  01f0               L772:
 953                     ; 113 		bool bit = (1<<i & data);
 955  01f0 7b04          	ld	a,(OFST-2,sp)
 956  01f2 5f            	clrw	x
 957  01f3 97            	ld	xl,a
 958  01f4 1f01          	ldw	(OFST-5,sp),x
 959  01f6 ae0001        	ldw	x,#1
 960  01f9 7b06          	ld	a,(OFST+0,sp)
 961  01fb 4d            	tnz	a
 962  01fc 2704          	jreq	L03
 963  01fe               L23:
 964  01fe 58            	sllw	x
 965  01ff 4a            	dec	a
 966  0200 26fc          	jrne	L23
 967  0202               L03:
 968  0202 01            	rrwa	x,a
 969  0203 1402          	and	a,(OFST-4,sp)
 970  0205 01            	rrwa	x,a
 971  0206 1401          	and	a,(OFST-5,sp)
 972  0208 01            	rrwa	x,a
 973  0209 01            	rrwa	x,a
 974  020a 6b03          	ld	(OFST-3,sp),a
 975  020c 02            	rlwa	x,a
 976                     ; 114 		if (bit != 0) {
 978  020d 0d03          	tnz	(OFST-3,sp)
 979  020f 271c          	jreq	L503
 980                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
 983  0211 72125000      	bset	20480,#1
 984                     ; 65 	nop();
 987  0215 9d            nop
 989                     ; 66 	nop();
 993  0216 9d            nop
 995                     ; 67 	nop();
 999  0217 9d            nop
1001                     ; 68 	nop();
1005  0218 9d            nop
1007                     ; 69 	nop();
1011  0219 9d            nop
1013                     ; 70 	nop();
1017  021a 9d            nop
1019                     ; 71 	nop();
1023  021b 9d            nop
1025                     ; 72 	nop();
1029  021c 9d            nop
1031                     ; 73 	nop();
1035  021d 9d            nop
1037                     ; 74 	nop();
1041  021e 9d            nop
1043                     ; 75 	nop();
1047  021f 9d            nop
1049                     ; 76 	nop();
1053  0220 9d            nop
1055                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1058  0221 72135000      	bres	20480,#1
1059                     ; 78 	nop();
1062  0225 9d            nop
1064                     ; 79 	nop();
1068  0226 9d            nop
1070                     ; 80 	nop();
1074  0227 9d            nop
1076                     ; 81 	nop();
1080  0228 9d            nop
1082                     ; 82 	nop();
1086  0229 9d            nop
1088                     ; 83 	nop();
1092  022a 9d            nop
1095  022b 201a          	jra	L703
1096  022d               L503:
1097                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1100  022d 72125000      	bset	20480,#1
1101                     ; 88 	nop();
1104  0231 9d            nop
1106                     ; 89 	nop();
1110  0232 9d            nop
1112                     ; 90 	nop();
1116  0233 9d            nop
1118                     ; 91 	nop();
1122  0234 9d            nop
1124                     ; 92 	nop();
1128  0235 9d            nop
1130                     ; 93 	nop();
1134  0236 9d            nop
1136                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1139  0237 72135000      	bres	20480,#1
1140                     ; 95 	nop();
1143  023b 9d            nop
1145                     ; 96 	nop();
1149  023c 9d            nop
1151                     ; 97 	nop();
1155  023d 9d            nop
1157                     ; 98 	nop();
1161  023e 9d            nop
1163                     ; 99 	nop();
1167  023f 9d            nop
1169                     ; 100 	nop();
1173  0240 9d            nop
1175                     ; 101 	nop();
1179  0241 9d            nop
1181                     ; 102 	nop();
1185  0242 9d            nop
1187                     ; 103 	nop();
1191  0243 9d            nop
1193                     ; 104 	nop();
1197  0244 9d            nop
1199                     ; 105 	nop();
1203  0245 9d            nop
1205                     ; 106 	nop();
1209  0246 9d            nop
1211  0247               L703:
1212                     ; 112 	for (i = 7; i >= 0; i--) {
1214  0247 1e05          	ldw	x,(OFST-1,sp)
1215  0249 1d0001        	subw	x,#1
1216  024c 1f05          	ldw	(OFST-1,sp),x
1219  024e 9c            	rvf
1220  024f 1e05          	ldw	x,(OFST-1,sp)
1221  0251 2f02          	jrslt	L44
1222  0253 209b          	jp	L772
1223  0255               L44:
1224                     ; 279 	LED_SendByte(r);
1227  0255 7b07          	ld	a,(OFST+1,sp)
1228  0257 6b04          	ld	(OFST-2,sp),a
1229                     ; 110 	int i = 0;
1231                     ; 112 	for (i = 7; i >= 0; i--) {
1233  0259 ae0007        	ldw	x,#7
1234  025c 1f05          	ldw	(OFST-1,sp),x
1235  025e               L113:
1236                     ; 113 		bool bit = (1<<i & data);
1238  025e 7b04          	ld	a,(OFST-2,sp)
1239  0260 5f            	clrw	x
1240  0261 97            	ld	xl,a
1241  0262 1f01          	ldw	(OFST-5,sp),x
1242  0264 ae0001        	ldw	x,#1
1243  0267 7b06          	ld	a,(OFST+0,sp)
1244  0269 4d            	tnz	a
1245  026a 2704          	jreq	L43
1246  026c               L63:
1247  026c 58            	sllw	x
1248  026d 4a            	dec	a
1249  026e 26fc          	jrne	L63
1250  0270               L43:
1251  0270 01            	rrwa	x,a
1252  0271 1402          	and	a,(OFST-4,sp)
1253  0273 01            	rrwa	x,a
1254  0274 1401          	and	a,(OFST-5,sp)
1255  0276 01            	rrwa	x,a
1256  0277 01            	rrwa	x,a
1257  0278 6b03          	ld	(OFST-3,sp),a
1258  027a 02            	rlwa	x,a
1259                     ; 114 		if (bit != 0) {
1261  027b 0d03          	tnz	(OFST-3,sp)
1262  027d 271c          	jreq	L713
1263                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1266  027f 72125000      	bset	20480,#1
1267                     ; 65 	nop();
1270  0283 9d            nop
1272                     ; 66 	nop();
1276  0284 9d            nop
1278                     ; 67 	nop();
1282  0285 9d            nop
1284                     ; 68 	nop();
1288  0286 9d            nop
1290                     ; 69 	nop();
1294  0287 9d            nop
1296                     ; 70 	nop();
1300  0288 9d            nop
1302                     ; 71 	nop();
1306  0289 9d            nop
1308                     ; 72 	nop();
1312  028a 9d            nop
1314                     ; 73 	nop();
1318  028b 9d            nop
1320                     ; 74 	nop();
1324  028c 9d            nop
1326                     ; 75 	nop();
1330  028d 9d            nop
1332                     ; 76 	nop();
1336  028e 9d            nop
1338                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1341  028f 72135000      	bres	20480,#1
1342                     ; 78 	nop();
1345  0293 9d            nop
1347                     ; 79 	nop();
1351  0294 9d            nop
1353                     ; 80 	nop();
1357  0295 9d            nop
1359                     ; 81 	nop();
1363  0296 9d            nop
1365                     ; 82 	nop();
1369  0297 9d            nop
1371                     ; 83 	nop();
1375  0298 9d            nop
1378  0299 201a          	jra	L123
1379  029b               L713:
1380                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1383  029b 72125000      	bset	20480,#1
1384                     ; 88 	nop();
1387  029f 9d            nop
1389                     ; 89 	nop();
1393  02a0 9d            nop
1395                     ; 90 	nop();
1399  02a1 9d            nop
1401                     ; 91 	nop();
1405  02a2 9d            nop
1407                     ; 92 	nop();
1411  02a3 9d            nop
1413                     ; 93 	nop();
1417  02a4 9d            nop
1419                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1422  02a5 72135000      	bres	20480,#1
1423                     ; 95 	nop();
1426  02a9 9d            nop
1428                     ; 96 	nop();
1432  02aa 9d            nop
1434                     ; 97 	nop();
1438  02ab 9d            nop
1440                     ; 98 	nop();
1444  02ac 9d            nop
1446                     ; 99 	nop();
1450  02ad 9d            nop
1452                     ; 100 	nop();
1456  02ae 9d            nop
1458                     ; 101 	nop();
1462  02af 9d            nop
1464                     ; 102 	nop();
1468  02b0 9d            nop
1470                     ; 103 	nop();
1474  02b1 9d            nop
1476                     ; 104 	nop();
1480  02b2 9d            nop
1482                     ; 105 	nop();
1486  02b3 9d            nop
1488                     ; 106 	nop();
1492  02b4 9d            nop
1494  02b5               L123:
1495                     ; 112 	for (i = 7; i >= 0; i--) {
1497  02b5 1e05          	ldw	x,(OFST-1,sp)
1498  02b7 1d0001        	subw	x,#1
1499  02ba 1f05          	ldw	(OFST-1,sp),x
1502  02bc 9c            	rvf
1503  02bd 1e05          	ldw	x,(OFST-1,sp)
1504  02bf 2f02          	jrslt	L64
1505  02c1 209b          	jp	L113
1506  02c3               L64:
1507                     ; 280 	LED_SendByte(b);
1510  02c3 7b0b          	ld	a,(OFST+5,sp)
1511  02c5 6b04          	ld	(OFST-2,sp),a
1512                     ; 110 	int i = 0;
1514                     ; 112 	for (i = 7; i >= 0; i--) {
1516  02c7 ae0007        	ldw	x,#7
1517  02ca 1f05          	ldw	(OFST-1,sp),x
1518  02cc               L323:
1519                     ; 113 		bool bit = (1<<i & data);
1521  02cc 7b04          	ld	a,(OFST-2,sp)
1522  02ce 5f            	clrw	x
1523  02cf 97            	ld	xl,a
1524  02d0 1f01          	ldw	(OFST-5,sp),x
1525  02d2 ae0001        	ldw	x,#1
1526  02d5 7b06          	ld	a,(OFST+0,sp)
1527  02d7 4d            	tnz	a
1528  02d8 2704          	jreq	L04
1529  02da               L24:
1530  02da 58            	sllw	x
1531  02db 4a            	dec	a
1532  02dc 26fc          	jrne	L24
1533  02de               L04:
1534  02de 01            	rrwa	x,a
1535  02df 1402          	and	a,(OFST-4,sp)
1536  02e1 01            	rrwa	x,a
1537  02e2 1401          	and	a,(OFST-5,sp)
1538  02e4 01            	rrwa	x,a
1539  02e5 01            	rrwa	x,a
1540  02e6 6b03          	ld	(OFST-3,sp),a
1541  02e8 02            	rlwa	x,a
1542                     ; 114 		if (bit != 0) {
1544  02e9 0d03          	tnz	(OFST-3,sp)
1545  02eb 271c          	jreq	L133
1546                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1549  02ed 72125000      	bset	20480,#1
1550                     ; 65 	nop();
1553  02f1 9d            nop
1555                     ; 66 	nop();
1559  02f2 9d            nop
1561                     ; 67 	nop();
1565  02f3 9d            nop
1567                     ; 68 	nop();
1571  02f4 9d            nop
1573                     ; 69 	nop();
1577  02f5 9d            nop
1579                     ; 70 	nop();
1583  02f6 9d            nop
1585                     ; 71 	nop();
1589  02f7 9d            nop
1591                     ; 72 	nop();
1595  02f8 9d            nop
1597                     ; 73 	nop();
1601  02f9 9d            nop
1603                     ; 74 	nop();
1607  02fa 9d            nop
1609                     ; 75 	nop();
1613  02fb 9d            nop
1615                     ; 76 	nop();
1619  02fc 9d            nop
1621                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1624  02fd 72135000      	bres	20480,#1
1625                     ; 78 	nop();
1628  0301 9d            nop
1630                     ; 79 	nop();
1634  0302 9d            nop
1636                     ; 80 	nop();
1640  0303 9d            nop
1642                     ; 81 	nop();
1646  0304 9d            nop
1648                     ; 82 	nop();
1652  0305 9d            nop
1654                     ; 83 	nop();
1658  0306 9d            nop
1661  0307 201a          	jra	L333
1662  0309               L133:
1663                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1666  0309 72125000      	bset	20480,#1
1667                     ; 88 	nop();
1670  030d 9d            nop
1672                     ; 89 	nop();
1676  030e 9d            nop
1678                     ; 90 	nop();
1682  030f 9d            nop
1684                     ; 91 	nop();
1688  0310 9d            nop
1690                     ; 92 	nop();
1694  0311 9d            nop
1696                     ; 93 	nop();
1700  0312 9d            nop
1702                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1705  0313 72135000      	bres	20480,#1
1706                     ; 95 	nop();
1709  0317 9d            nop
1711                     ; 96 	nop();
1715  0318 9d            nop
1717                     ; 97 	nop();
1721  0319 9d            nop
1723                     ; 98 	nop();
1727  031a 9d            nop
1729                     ; 99 	nop();
1733  031b 9d            nop
1735                     ; 100 	nop();
1739  031c 9d            nop
1741                     ; 101 	nop();
1745  031d 9d            nop
1747                     ; 102 	nop();
1751  031e 9d            nop
1753                     ; 103 	nop();
1757  031f 9d            nop
1759                     ; 104 	nop();
1763  0320 9d            nop
1765                     ; 105 	nop();
1769  0321 9d            nop
1771                     ; 106 	nop();
1775  0322 9d            nop
1777  0323               L333:
1778                     ; 112 	for (i = 7; i >= 0; i--) {
1780  0323 1e05          	ldw	x,(OFST-1,sp)
1781  0325 1d0001        	subw	x,#1
1782  0328 1f05          	ldw	(OFST-1,sp),x
1785  032a 9c            	rvf
1786  032b 1e05          	ldw	x,(OFST-1,sp)
1787  032d 2f02          	jrslt	L05
1788  032f 209b          	jp	L323
1789  0331               L05:
1790                     ; 259 	int i = 0;
1793                     ; 260 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1795  0331 72135000      	bres	20480,#1
1796                     ; 262 	for (i = 1280; i >= 0; i--) {
1798  0335 ae0500        	ldw	x,#1280
1799  0338 1f05          	ldw	(OFST-1,sp),x
1800  033a               L533:
1801                     ; 263 		nop();
1804  033a 9d            nop
1806                     ; 262 	for (i = 1280; i >= 0; i--) {
1809  033b 1e05          	ldw	x,(OFST-1,sp)
1810  033d 1d0001        	subw	x,#1
1811  0340 1f05          	ldw	(OFST-1,sp),x
1814  0342 9c            	rvf
1815  0343 1e05          	ldw	x,(OFST-1,sp)
1816  0345 2ef3          	jrsge	L533
1817                     ; 282 	if (changeInterrupts) enableInterrupts();
1819  0347 0d0c          	tnz	(OFST+6,sp)
1820  0349 2701          	jreq	L343
1824  034b 9a            rim
1826  034c               L343:
1827                     ; 288 }
1831  034c 5b08          	addw	sp,#8
1832  034e 81            	ret
1859                     ; 290 void TIMER_Configuration(void)
1859                     ; 291 {
1860                     	switch	.text
1861  034f               _TIMER_Configuration:
1865                     ; 292   TIM4_DeInit();
1867  034f cd0000        	call	_TIM4_DeInit
1869                     ; 295   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x7F );
1871  0352 ae077f        	ldw	x,#1919
1872  0355 cd0000        	call	_TIM4_TimeBaseInit
1874                     ; 298   TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
1876  0358 ae0100        	ldw	x,#256
1877  035b cd0000        	call	_TIM4_ITConfig
1879                     ; 299 }
1882  035e 81            	ret
1921                     ; 301 void I2C_SendPacket(u8 data) {
1922                     	switch	.text
1923  035f               _I2C_SendPacket:
1927                     ; 302 	I2C_GenerateSTART(ENABLE);	
1929  035f a601          	ld	a,#1
1930  0361 cd0000        	call	_I2C_GenerateSTART
1933  0364               L573:
1934                     ; 303 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
1936  0364 ae0301        	ldw	x,#769
1937  0367 cd0000        	call	_I2C_CheckEvent
1939  036a 4d            	tnz	a
1940  036b 27f7          	jreq	L573
1941                     ; 307 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
1943  036d ae1000        	ldw	x,#4096
1944  0370 cd0000        	call	_I2C_Send7bitAddress
1947  0373               L304:
1948                     ; 309 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) ) {}
1950  0373 ae0782        	ldw	x,#1922
1951  0376 cd0000        	call	_I2C_CheckEvent
1953  0379 4d            	tnz	a
1954  037a 27f7          	jreq	L304
1955                     ; 311 	I2C_SendData(12);
1957  037c a60c          	ld	a,#12
1958  037e cd0000        	call	_I2C_SendData
1961  0381               L114:
1962                     ; 312 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS ) {}
1964  0381 ae0784        	ldw	x,#1924
1965  0384 cd0000        	call	_I2C_CheckEvent
1967  0387 a101          	cp	a,#1
1968  0389 26f6          	jrne	L114
1969                     ; 313 	I2C_SendData(0x01);
1971  038b a601          	ld	a,#1
1972  038d cd0000        	call	_I2C_SendData
1975  0390               L714:
1976                     ; 314 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS ) {}
1978  0390 ae0784        	ldw	x,#1924
1979  0393 cd0000        	call	_I2C_CheckEvent
1981  0396 a101          	cp	a,#1
1982  0398 26f6          	jrne	L714
1983                     ; 315 	I2C_SendData(20);
1985  039a a614          	ld	a,#20
1986  039c cd0000        	call	_I2C_SendData
1989  039f               L524:
1990                     ; 316 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) {}
1992  039f ae0784        	ldw	x,#1924
1993  03a2 cd0000        	call	_I2C_CheckEvent
1995  03a5 a101          	cp	a,#1
1996  03a7 26f6          	jrne	L524
1997                     ; 317 	I2C_GenerateSTOP(ENABLE);
1999  03a9 a601          	ld	a,#1
2000  03ab cd0000        	call	_I2C_GenerateSTOP
2002                     ; 318 }
2005  03ae 81            	ret
2040                     ; 331 void assert_failed(u8* file, u32 line)
2040                     ; 332 {
2041                     	switch	.text
2042  03af               _assert_failed:
2046  03af               L744:
2047  03af 20fe          	jra	L744
2173                     	xdef	_I2C_SendPacket
2174                     	xdef	_main
2175                     	xdef	_LED_SetColor
2176                     	xdef	_LED_SetColor_Int
2177                     	xdef	_TIMER_Configuration
2178                     	xdef	_I2C_Configuration
2179                     	xdef	_received2
2180                     	xdef	_received
2181                     	xdef	_velocity
2182                     	switch	.ubsct
2183  0000               _TxBuffer:
2184  0000 000000000000  	ds.b	7
2185                     	xdef	_TxBuffer
2186                     	xdef	_next_case
2187                     	xdef	_NumOfBytes
2188                     	xdef	_i
2189                     	xdef	_PeriodNumber
2190  0007               _Counter:
2191  0007 00            	ds.b	1
2192                     	xdef	_Counter
2193                     	xdef	_button_state
2194                     	xdef	_previous_button_state
2195                     	xdef	_User_Key_Pressed
2196                     	xdef	_assert_failed
2197                     	xref	_TIM4_ITConfig
2198                     	xref	_TIM4_TimeBaseInit
2199                     	xref	_TIM4_DeInit
2200                     	xref	_I2C_CheckEvent
2201                     	xref	_I2C_SendData
2202                     	xref	_I2C_Send7bitAddress
2203                     	xref	_I2C_ReceiveData
2204                     	xref	_I2C_ITConfig
2205                     	xref	_I2C_GenerateSTOP
2206                     	xref	_I2C_GenerateSTART
2207                     	xref	_I2C_GeneralCallCmd
2208                     	xref	_I2C_Init
2209                     	xref	_I2C_DeInit
2210                     	xref	_GPIO_WriteLow
2211                     	xref	_GPIO_WriteHigh
2212                     	xref	_GPIO_Init
2213                     	xref	_EXTI_SetExtIntSensitivity
2214                     	xref	_CLK_SYSCLKConfig
2215                     	xref	_CLK_HSIPrescalerConfig
2216                     	xref	_CLK_PeripheralClockConfig
2217                     	xref	_CLK_FastHaltWakeUpCmd
2218                     	xref	_CLK_HSICmd
2219                     	xref	_CLK_DeInit
2239                     	end
