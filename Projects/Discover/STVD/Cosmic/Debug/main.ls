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
  23  0003               _note_playing:
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
 220                     ; 154 void main(void)
 220                     ; 155 {
 222                     	switch	.text
 223  0000               _main:
 225  0000 5206          	subw	sp,#6
 226       00000006      OFST:	set	6
 229                     ; 159 	CLK_DeInit();  
 231  0002 cd0000        	call	_CLK_DeInit
 233                     ; 160   CLK_HSICmd(ENABLE);
 235  0005 a601          	ld	a,#1
 236  0007 cd0000        	call	_CLK_HSICmd
 238                     ; 161   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 240  000a 4f            	clr	a
 241  000b cd0000        	call	_CLK_HSIPrescalerConfig
 243                     ; 162   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 245  000e a680          	ld	a,#128
 246  0010 cd0000        	call	_CLK_SYSCLKConfig
 248                     ; 165   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 250  0013 4be0          	push	#224
 251  0015 4b02          	push	#2
 252  0017 ae5000        	ldw	x,#20480
 253  001a cd0000        	call	_GPIO_Init
 255  001d 85            	popw	x
 256                     ; 166 	LED_SetColor_Int(30, 70, 100, FALSE);
 258  001e 4b00          	push	#0
 259  0020 4b64          	push	#100
 260  0022 ae1e46        	ldw	x,#7750
 261  0025 cd01f9        	call	_LED_SetColor_Int
 263  0028 85            	popw	x
 264                     ; 168 	for(startDelay = 900000; startDelay > 0; startDelay--){
 266  0029 aebba0        	ldw	x,#48032
 267  002c 1f05          	ldw	(OFST-1,sp),x
 268  002e               L34:
 269                     ; 169 				nop(); nop(); nop(); nop(); nop();
 272  002e 9d            nop
 278  002f 9d            nop
 284  0030 9d            nop
 290  0031 9d            nop
 296  0032 9d            nop
 298                     ; 170 				nop(); nop(); nop(); nop(); nop();
 302  0033 9d            nop
 308  0034 9d            nop
 314  0035 9d            nop
 320  0036 9d            nop
 326  0037 9d            nop
 328                     ; 171 				nop(); nop(); nop(); nop(); nop();
 332  0038 9d            nop
 338  0039 9d            nop
 344  003a 9d            nop
 350  003b 9d            nop
 356  003c 9d            nop
 358                     ; 172 				nop(); nop(); nop(); nop(); nop();
 362  003d 9d            nop
 368  003e 9d            nop
 374  003f 9d            nop
 380  0040 9d            nop
 386  0041 9d            nop
 388                     ; 173 				nop(); nop(); nop(); nop(); nop();
 392  0042 9d            nop
 398  0043 9d            nop
 404  0044 9d            nop
 410  0045 9d            nop
 416  0046 9d            nop
 418                     ; 174 				nop(); nop(); nop(); nop(); nop();
 422  0047 9d            nop
 428  0048 9d            nop
 434  0049 9d            nop
 440  004a 9d            nop
 446  004b 9d            nop
 448                     ; 175 				nop(); nop(); nop(); nop(); nop();
 452  004c 9d            nop
 458  004d 9d            nop
 464  004e 9d            nop
 470  004f 9d            nop
 476  0050 9d            nop
 478                     ; 176 				nop(); nop(); nop(); nop(); nop();
 482  0051 9d            nop
 488  0052 9d            nop
 494  0053 9d            nop
 500  0054 9d            nop
 506  0055 9d            nop
 508                     ; 177 				nop(); nop(); nop(); nop(); nop();
 512  0056 9d            nop
 518  0057 9d            nop
 524  0058 9d            nop
 530  0059 9d            nop
 536  005a 9d            nop
 538                     ; 178 				nop(); nop(); nop(); nop(); nop();
 542  005b 9d            nop
 548  005c 9d            nop
 554  005d 9d            nop
 560  005e 9d            nop
 566  005f 9d            nop
 568                     ; 179 				nop(); nop(); nop(); nop(); nop();
 572  0060 9d            nop
 578  0061 9d            nop
 584  0062 9d            nop
 590  0063 9d            nop
 596  0064 9d            nop
 598                     ; 180 				nop(); nop(); nop(); nop(); nop();
 602  0065 9d            nop
 608  0066 9d            nop
 614  0067 9d            nop
 620  0068 9d            nop
 626  0069 9d            nop
 628                     ; 181 				nop(); nop(); nop(); nop(); nop();
 632  006a 9d            nop
 638  006b 9d            nop
 644  006c 9d            nop
 650  006d 9d            nop
 656  006e 9d            nop
 658                     ; 182 				nop(); nop(); nop(); nop(); nop();
 662  006f 9d            nop
 668  0070 9d            nop
 674  0071 9d            nop
 680  0072 9d            nop
 686  0073 9d            nop
 688                     ; 183 				nop(); nop(); nop(); nop(); nop();
 692  0074 9d            nop
 698  0075 9d            nop
 704  0076 9d            nop
 710  0077 9d            nop
 716  0078 9d            nop
 718                     ; 184 				nop(); nop(); nop(); nop(); nop();
 722  0079 9d            nop
 728  007a 9d            nop
 734  007b 9d            nop
 740  007c 9d            nop
 746  007d 9d            nop
 748                     ; 185 				nop(); nop(); nop(); nop(); nop();
 752  007e 9d            nop
 758  007f 9d            nop
 764  0080 9d            nop
 770  0081 9d            nop
 776  0082 9d            nop
 778                     ; 186 				nop();
 782  0083 9d            nop
 784                     ; 168 	for(startDelay = 900000; startDelay > 0; startDelay--){
 787  0084 1e05          	ldw	x,(OFST-1,sp)
 788  0086 1d0001        	subw	x,#1
 789  0089 1f05          	ldw	(OFST-1,sp),x
 792  008b 1e05          	ldw	x,(OFST-1,sp)
 793  008d 2702          	jreq	L6
 794  008f 209d          	jp	L34
 795  0091               L6:
 796                     ; 190 	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 798  0091 4bd0          	push	#208
 799  0093 4b04          	push	#4
 800  0095 ae5000        	ldw	x,#20480
 801  0098 cd0000        	call	_GPIO_Init
 803  009b 85            	popw	x
 804                     ; 191 	GPIO_WriteHigh(TRIGGER_PORT, TRIGGER_PIN);
 806  009c 4b04          	push	#4
 807  009e ae5000        	ldw	x,#20480
 808  00a1 cd0000        	call	_GPIO_WriteHigh
 810  00a4 84            	pop	a
 811                     ; 213 	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
 813  00a5 4b60          	push	#96
 814  00a7 4b20          	push	#32
 815  00a9 ae500a        	ldw	x,#20490
 816  00ac cd0000        	call	_GPIO_Init
 818  00af 85            	popw	x
 819                     ; 214 	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
 821  00b0 4b60          	push	#96
 822  00b2 4b08          	push	#8
 823  00b4 ae500a        	ldw	x,#20490
 824  00b7 cd0000        	call	_GPIO_Init
 826  00ba 85            	popw	x
 827                     ; 220 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);
 829  00bb ae0203        	ldw	x,#515
 830  00be cd0000        	call	_EXTI_SetExtIntSensitivity
 832                     ; 222 	LED_SetColor_Int(100, 0, 0, FALSE);
 834  00c1 4b00          	push	#0
 835  00c3 4b00          	push	#0
 836  00c5 ae6400        	ldw	x,#25600
 837  00c8 cd01f9        	call	_LED_SetColor_Int
 839  00cb 85            	popw	x
 840                     ; 224   TIMER_Configuration();
 842  00cc cd03a9        	call	_TIMER_Configuration
 844                     ; 225 	I2C_Configuration();
 846  00cf cd01c4        	call	_I2C_Configuration
 848                     ; 226 	LED_SetColor_Int(100, 100, 0, FALSE);
 850  00d2 4b00          	push	#0
 851  00d4 4b00          	push	#0
 852  00d6 ae6464        	ldw	x,#25700
 853  00d9 cd01f9        	call	_LED_SetColor_Int
 855  00dc 85            	popw	x
 856                     ; 229 	I2C_GenerateSTART(ENABLE);
 858  00dd a601          	ld	a,#1
 859  00df cd0000        	call	_I2C_GenerateSTART
 862  00e2               L35:
 863                     ; 230 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
 865  00e2 ae0301        	ldw	x,#769
 866  00e5 cd0000        	call	_I2C_CheckEvent
 868  00e8 4d            	tnz	a
 869  00e9 27f7          	jreq	L35
 870                     ; 231 	LED_SetColor_Int(80, 80, 20, FALSE);
 872  00eb 4b00          	push	#0
 873  00ed 4b14          	push	#20
 874  00ef ae5050        	ldw	x,#20560
 875  00f2 cd01f9        	call	_LED_SetColor_Int
 877  00f5 85            	popw	x
 878                     ; 233 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
 880  00f6 ae1000        	ldw	x,#4096
 881  00f9 cd0000        	call	_I2C_Send7bitAddress
 884  00fc               L16:
 885                     ; 234 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
 887  00fc ae0782        	ldw	x,#1922
 888  00ff cd0000        	call	_I2C_CheckEvent
 890  0102 a101          	cp	a,#1
 891  0104 26f6          	jrne	L16
 892                     ; 235 	LED_SetColor_Int(60, 60, 40, FALSE);
 894  0106 4b00          	push	#0
 895  0108 4b28          	push	#40
 896  010a ae3c3c        	ldw	x,#15420
 897  010d cd01f9        	call	_LED_SetColor_Int
 899  0110 85            	popw	x
 900                     ; 238 	I2C_SendData(0x01);
 902  0111 a601          	ld	a,#1
 903  0113 cd0000        	call	_I2C_SendData
 906  0116               L76:
 907                     ; 239 	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
 909  0116 ae0784        	ldw	x,#1924
 910  0119 cd0000        	call	_I2C_CheckEvent
 912  011c a101          	cp	a,#1
 913  011e 26f6          	jrne	L76
 914                     ; 240 	LED_SetColor_Int(40, 40, 60, FALSE);
 916  0120 4b00          	push	#0
 917  0122 4b3c          	push	#60
 918  0124 ae2828        	ldw	x,#10280
 919  0127 cd01f9        	call	_LED_SetColor_Int
 921  012a 85            	popw	x
 922                     ; 242 	I2C_GeneralCallCmd(ENABLE);
 924  012b a601          	ld	a,#1
 925  012d cd0000        	call	_I2C_GeneralCallCmd
 927                     ; 243 	I2C_GenerateSTOP(ENABLE);
 929  0130 a601          	ld	a,#1
 930  0132 cd0000        	call	_I2C_GenerateSTOP
 933  0135               L57:
 934                     ; 246 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
 936  0135 ae1200        	ldw	x,#4608
 937  0138 cd0000        	call	_I2C_CheckEvent
 939  013b a101          	cp	a,#1
 940  013d 26f6          	jrne	L57
 941                     ; 247 	received = I2C_ReceiveData();
 943  013f cd0000        	call	_I2C_ReceiveData
 945  0142 b708          	ld	_received,a
 947  0144               L501:
 948                     ; 248 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
 950  0144 ae0240        	ldw	x,#576
 951  0147 cd0000        	call	_I2C_CheckEvent
 953  014a a101          	cp	a,#1
 954  014c 26f6          	jrne	L501
 955                     ; 249 	received2 = I2C_ReceiveData();
 957  014e cd0000        	call	_I2C_ReceiveData
 959  0151 b709          	ld	_received2,a
 960                     ; 250 	I2C_GeneralCallCmd(DISABLE);
 962  0153 4f            	clr	a
 963  0154 cd0000        	call	_I2C_GeneralCallCmd
 965                     ; 251 	LED_SetColor_Int(20, 20, 80, FALSE);
 967  0157 4b00          	push	#0
 968  0159 4b50          	push	#80
 969  015b ae1414        	ldw	x,#5140
 970  015e cd01f9        	call	_LED_SetColor_Int
 972  0161 85            	popw	x
 973                     ; 254 	I2C_Configuration();
 975  0162 ad60          	call	_I2C_Configuration
 977                     ; 255 	LED_SetColor_Int(0, 0, 100, FALSE);
 979  0164 4b00          	push	#0
 980  0166 4b64          	push	#100
 981  0168 5f            	clrw	x
 982  0169 cd01f9        	call	_LED_SetColor_Int
 984  016c 85            	popw	x
 985                     ; 256 	enableInterrupts();
 988  016d 9a            rim
 990                     ; 258 	GPIO_WriteLow(TRIGGER_PORT,  TRIGGER_PIN);
 993  016e 4b04          	push	#4
 994  0170 ae5000        	ldw	x,#20480
 995  0173 cd0000        	call	_GPIO_WriteLow
 997  0176 84            	pop	a
 998                     ; 259 	for (i = 500; i >= 0; i--) {
1000  0177 ae01f4        	ldw	x,#500
1001  017a 1f01          	ldw	(OFST-5,sp),x
1002  017c               L111:
1003                     ; 260 		for (j = 1; j >= 0; j--) {
1005  017c ae0001        	ldw	x,#1
1006  017f 1f05          	ldw	(OFST-1,sp),x
1007  0181               L711:
1008                     ; 261 		  for (k = 1; k >= 0; k--) {
1010  0181 ae0001        	ldw	x,#1
1011  0184 1f03          	ldw	(OFST-3,sp),x
1012  0186               L521:
1013                     ; 262 			  nop();nop();nop();nop();nop();
1016  0186 9d            nop
1022  0187 9d            nop
1028  0188 9d            nop
1034  0189 9d            nop
1040  018a 9d            nop
1042                     ; 261 		  for (k = 1; k >= 0; k--) {
1045  018b 1e03          	ldw	x,(OFST-3,sp)
1046  018d 1d0001        	subw	x,#1
1047  0190 1f03          	ldw	(OFST-3,sp),x
1050  0192 9c            	rvf
1051  0193 1e03          	ldw	x,(OFST-3,sp)
1052  0195 2eef          	jrsge	L521
1053                     ; 260 		for (j = 1; j >= 0; j--) {
1055  0197 1e05          	ldw	x,(OFST-1,sp)
1056  0199 1d0001        	subw	x,#1
1057  019c 1f05          	ldw	(OFST-1,sp),x
1060  019e 9c            	rvf
1061  019f 1e05          	ldw	x,(OFST-1,sp)
1062  01a1 2ede          	jrsge	L711
1063                     ; 259 	for (i = 500; i >= 0; i--) {
1065  01a3 1e01          	ldw	x,(OFST-5,sp)
1066  01a5 1d0001        	subw	x,#1
1067  01a8 1f01          	ldw	(OFST-5,sp),x
1070  01aa 9c            	rvf
1071  01ab 1e01          	ldw	x,(OFST-5,sp)
1072  01ad 2ecd          	jrsge	L111
1073                     ; 266 	GPIO_WriteHigh(TRIGGER_PORT,  TRIGGER_PIN);
1075  01af 4b04          	push	#4
1076  01b1 ae5000        	ldw	x,#20480
1077  01b4 cd0000        	call	_GPIO_WriteHigh
1079  01b7 84            	pop	a
1080                     ; 269 	LED_SetColor_Int(0, 0, 0, FALSE);
1082  01b8 4b00          	push	#0
1083  01ba 4b00          	push	#0
1084  01bc 5f            	clrw	x
1085  01bd ad3a          	call	_LED_SetColor_Int
1087  01bf 85            	popw	x
1088                     ; 272 	wfi();
1091  01c0 8f            wfi
1093                     ; 279 }
1097  01c1 5b06          	addw	sp,#6
1098  01c3 81            	ret
1125                     ; 281 void I2C_Configuration(void) {
1126                     	switch	.text
1127  01c4               _I2C_Configuration:
1131                     ; 282 	I2C_DeInit();
1133  01c4 cd0000        	call	_I2C_DeInit
1135                     ; 283   I2C_Init(I2C_MAX_STANDARD_FREQ,
1135                     ; 284      (received2<<1),// Self address 
1135                     ; 285      I2C_DUTYCYCLE_2, 
1135                     ; 286      I2C_ACK_CURR,
1135                     ; 287      I2C_ADDMODE_7BIT, 
1135                     ; 288      I2C_MAX_INPUT_FREQ
1135                     ; 289   );
1137  01c7 4b10          	push	#16
1138  01c9 4b00          	push	#0
1139  01cb 4b01          	push	#1
1140  01cd 4b00          	push	#0
1141  01cf b609          	ld	a,_received2
1142  01d1 5f            	clrw	x
1143  01d2 97            	ld	xl,a
1144  01d3 58            	sllw	x
1145  01d4 89            	pushw	x
1146  01d5 ae86a0        	ldw	x,#34464
1147  01d8 89            	pushw	x
1148  01d9 ae0001        	ldw	x,#1
1149  01dc 89            	pushw	x
1150  01dd cd0000        	call	_I2C_Init
1152  01e0 5b0a          	addw	sp,#10
1153                     ; 290 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
1153                     ; 291 	ENABLE);
1155  01e2 ae0601        	ldw	x,#1537
1156  01e5 cd0000        	call	_I2C_ITConfig
1158                     ; 294 }
1161  01e8 81            	ret
1214                     ; 305 void LED_SetColor(u8 r, u8 g, u8 b) {
1215                     	switch	.text
1216  01e9               _LED_SetColor:
1218  01e9 89            	pushw	x
1219       00000000      OFST:	set	0
1222                     ; 306 	LED_SetColor_Int(r, g, b, TRUE);
1224  01ea 4b01          	push	#1
1225  01ec 7b06          	ld	a,(OFST+6,sp)
1226  01ee 88            	push	a
1227  01ef 9f            	ld	a,xl
1228  01f0 97            	ld	xl,a
1229  01f1 7b03          	ld	a,(OFST+3,sp)
1230  01f3 95            	ld	xh,a
1231  01f4 ad03          	call	_LED_SetColor_Int
1233  01f6 85            	popw	x
1234                     ; 307 }
1237  01f7 85            	popw	x
1238  01f8 81            	ret
1538                     ; 310 void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
1539                     	switch	.text
1540  01f9               _LED_SetColor_Int:
1542  01f9 89            	pushw	x
1543  01fa 5206          	subw	sp,#6
1544       00000006      OFST:	set	6
1547                     ; 311 	r = r > 100 ? 100 : r;
1549  01fc 7b07          	ld	a,(OFST+1,sp)
1550  01fe a165          	cp	a,#101
1551  0200 2504          	jrult	L61
1552  0202 a664          	ld	a,#100
1553  0204 2002          	jra	L02
1554  0206               L61:
1555  0206 7b07          	ld	a,(OFST+1,sp)
1556  0208               L02:
1557  0208 6b07          	ld	(OFST+1,sp),a
1558                     ; 312 	g = g > 100 ? 100 : g;
1560  020a 7b08          	ld	a,(OFST+2,sp)
1561  020c a165          	cp	a,#101
1562  020e 2504          	jrult	L22
1563  0210 a664          	ld	a,#100
1564  0212 2002          	jra	L42
1565  0214               L22:
1566  0214 7b08          	ld	a,(OFST+2,sp)
1567  0216               L42:
1568  0216 6b08          	ld	(OFST+2,sp),a
1569                     ; 313 	b = b > 100 ? 100 : b;
1571  0218 7b0b          	ld	a,(OFST+5,sp)
1572  021a a165          	cp	a,#101
1573  021c 2504          	jrult	L62
1574  021e a664          	ld	a,#100
1575  0220 2002          	jra	L03
1576  0222               L62:
1577  0222 7b0b          	ld	a,(OFST+5,sp)
1578  0224               L03:
1579  0224 6b0b          	ld	(OFST+5,sp),a
1580                     ; 314 	if (changeInterrupts) disableInterrupts();
1582  0226 0d0c          	tnz	(OFST+6,sp)
1583  0228 2701          	jreq	L533
1587  022a 9b            sim
1589  022b               L533:
1590                     ; 297 	int i = 0;
1594                     ; 298 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1596  022b 72135000      	bres	20480,#1
1597                     ; 300 	for (i = 1280; i >= 0; i--) {
1599  022f ae0500        	ldw	x,#1280
1600  0232 1f05          	ldw	(OFST-1,sp),x
1601  0234               L733:
1602                     ; 301 		nop();
1605  0234 9d            nop
1607                     ; 300 	for (i = 1280; i >= 0; i--) {
1610  0235 1e05          	ldw	x,(OFST-1,sp)
1611  0237 1d0001        	subw	x,#1
1612  023a 1f05          	ldw	(OFST-1,sp),x
1615  023c 9c            	rvf
1616  023d 1e05          	ldw	x,(OFST-1,sp)
1617  023f 2ef3          	jrsge	L733
1618                     ; 316 	LED_SendByte(g);
1621  0241 7b08          	ld	a,(OFST+2,sp)
1622  0243 6b04          	ld	(OFST-2,sp),a
1623                     ; 110 	int i = 0;
1625                     ; 112 	for (i = 7; i >= 0; i--) {
1627  0245 ae0007        	ldw	x,#7
1628  0248 1f05          	ldw	(OFST-1,sp),x
1629  024a               L543:
1630                     ; 113 		bool bit = (1<<i & data);
1632  024a 7b04          	ld	a,(OFST-2,sp)
1633  024c 5f            	clrw	x
1634  024d 97            	ld	xl,a
1635  024e 1f01          	ldw	(OFST-5,sp),x
1636  0250 ae0001        	ldw	x,#1
1637  0253 7b06          	ld	a,(OFST+0,sp)
1638  0255 4d            	tnz	a
1639  0256 2704          	jreq	L23
1640  0258               L43:
1641  0258 58            	sllw	x
1642  0259 4a            	dec	a
1643  025a 26fc          	jrne	L43
1644  025c               L23:
1645  025c 01            	rrwa	x,a
1646  025d 1402          	and	a,(OFST-4,sp)
1647  025f 01            	rrwa	x,a
1648  0260 1401          	and	a,(OFST-5,sp)
1649  0262 01            	rrwa	x,a
1650  0263 01            	rrwa	x,a
1651  0264 6b03          	ld	(OFST-3,sp),a
1652  0266 02            	rlwa	x,a
1653                     ; 114 		if (bit != 0) {
1655  0267 0d03          	tnz	(OFST-3,sp)
1656  0269 271c          	jreq	L353
1657                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1660  026b 72125000      	bset	20480,#1
1661                     ; 65 	nop();
1664  026f 9d            nop
1666                     ; 66 	nop();
1670  0270 9d            nop
1672                     ; 67 	nop();
1676  0271 9d            nop
1678                     ; 68 	nop();
1682  0272 9d            nop
1684                     ; 69 	nop();
1688  0273 9d            nop
1690                     ; 70 	nop();
1694  0274 9d            nop
1696                     ; 71 	nop();
1700  0275 9d            nop
1702                     ; 72 	nop();
1706  0276 9d            nop
1708                     ; 73 	nop();
1712  0277 9d            nop
1714                     ; 74 	nop();
1718  0278 9d            nop
1720                     ; 75 	nop();
1724  0279 9d            nop
1726                     ; 76 	nop();
1730  027a 9d            nop
1732                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1735  027b 72135000      	bres	20480,#1
1736                     ; 78 	nop();
1739  027f 9d            nop
1741                     ; 79 	nop();
1745  0280 9d            nop
1747                     ; 80 	nop();
1751  0281 9d            nop
1753                     ; 81 	nop();
1757  0282 9d            nop
1759                     ; 82 	nop();
1763  0283 9d            nop
1765                     ; 83 	nop();
1769  0284 9d            nop
1772  0285 201a          	jra	L553
1773  0287               L353:
1774                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1777  0287 72125000      	bset	20480,#1
1778                     ; 88 	nop();
1781  028b 9d            nop
1783                     ; 89 	nop();
1787  028c 9d            nop
1789                     ; 90 	nop();
1793  028d 9d            nop
1795                     ; 91 	nop();
1799  028e 9d            nop
1801                     ; 92 	nop();
1805  028f 9d            nop
1807                     ; 93 	nop();
1811  0290 9d            nop
1813                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1816  0291 72135000      	bres	20480,#1
1817                     ; 95 	nop();
1820  0295 9d            nop
1822                     ; 96 	nop();
1826  0296 9d            nop
1828                     ; 97 	nop();
1832  0297 9d            nop
1834                     ; 98 	nop();
1838  0298 9d            nop
1840                     ; 99 	nop();
1844  0299 9d            nop
1846                     ; 100 	nop();
1850  029a 9d            nop
1852                     ; 101 	nop();
1856  029b 9d            nop
1858                     ; 102 	nop();
1862  029c 9d            nop
1864                     ; 103 	nop();
1868  029d 9d            nop
1870                     ; 104 	nop();
1874  029e 9d            nop
1876                     ; 105 	nop();
1880  029f 9d            nop
1882                     ; 106 	nop();
1886  02a0 9d            nop
1888  02a1               L553:
1889                     ; 112 	for (i = 7; i >= 0; i--) {
1891  02a1 1e05          	ldw	x,(OFST-1,sp)
1892  02a3 1d0001        	subw	x,#1
1893  02a6 1f05          	ldw	(OFST-1,sp),x
1896  02a8 9c            	rvf
1897  02a9 1e05          	ldw	x,(OFST-1,sp)
1898  02ab 2f02          	jrslt	L64
1899  02ad 209b          	jp	L543
1900  02af               L64:
1901                     ; 317 	LED_SendByte(r);
1904  02af 7b07          	ld	a,(OFST+1,sp)
1905  02b1 6b04          	ld	(OFST-2,sp),a
1906                     ; 110 	int i = 0;
1908                     ; 112 	for (i = 7; i >= 0; i--) {
1910  02b3 ae0007        	ldw	x,#7
1911  02b6 1f05          	ldw	(OFST-1,sp),x
1912  02b8               L753:
1913                     ; 113 		bool bit = (1<<i & data);
1915  02b8 7b04          	ld	a,(OFST-2,sp)
1916  02ba 5f            	clrw	x
1917  02bb 97            	ld	xl,a
1918  02bc 1f01          	ldw	(OFST-5,sp),x
1919  02be ae0001        	ldw	x,#1
1920  02c1 7b06          	ld	a,(OFST+0,sp)
1921  02c3 4d            	tnz	a
1922  02c4 2704          	jreq	L63
1923  02c6               L04:
1924  02c6 58            	sllw	x
1925  02c7 4a            	dec	a
1926  02c8 26fc          	jrne	L04
1927  02ca               L63:
1928  02ca 01            	rrwa	x,a
1929  02cb 1402          	and	a,(OFST-4,sp)
1930  02cd 01            	rrwa	x,a
1931  02ce 1401          	and	a,(OFST-5,sp)
1932  02d0 01            	rrwa	x,a
1933  02d1 01            	rrwa	x,a
1934  02d2 6b03          	ld	(OFST-3,sp),a
1935  02d4 02            	rlwa	x,a
1936                     ; 114 		if (bit != 0) {
1938  02d5 0d03          	tnz	(OFST-3,sp)
1939  02d7 271c          	jreq	L563
1940                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1943  02d9 72125000      	bset	20480,#1
1944                     ; 65 	nop();
1947  02dd 9d            nop
1949                     ; 66 	nop();
1953  02de 9d            nop
1955                     ; 67 	nop();
1959  02df 9d            nop
1961                     ; 68 	nop();
1965  02e0 9d            nop
1967                     ; 69 	nop();
1971  02e1 9d            nop
1973                     ; 70 	nop();
1977  02e2 9d            nop
1979                     ; 71 	nop();
1983  02e3 9d            nop
1985                     ; 72 	nop();
1989  02e4 9d            nop
1991                     ; 73 	nop();
1995  02e5 9d            nop
1997                     ; 74 	nop();
2001  02e6 9d            nop
2003                     ; 75 	nop();
2007  02e7 9d            nop
2009                     ; 76 	nop();
2013  02e8 9d            nop
2015                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2018  02e9 72135000      	bres	20480,#1
2019                     ; 78 	nop();
2022  02ed 9d            nop
2024                     ; 79 	nop();
2028  02ee 9d            nop
2030                     ; 80 	nop();
2034  02ef 9d            nop
2036                     ; 81 	nop();
2040  02f0 9d            nop
2042                     ; 82 	nop();
2046  02f1 9d            nop
2048                     ; 83 	nop();
2052  02f2 9d            nop
2055  02f3 201a          	jra	L763
2056  02f5               L563:
2057                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2060  02f5 72125000      	bset	20480,#1
2061                     ; 88 	nop();
2064  02f9 9d            nop
2066                     ; 89 	nop();
2070  02fa 9d            nop
2072                     ; 90 	nop();
2076  02fb 9d            nop
2078                     ; 91 	nop();
2082  02fc 9d            nop
2084                     ; 92 	nop();
2088  02fd 9d            nop
2090                     ; 93 	nop();
2094  02fe 9d            nop
2096                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2099  02ff 72135000      	bres	20480,#1
2100                     ; 95 	nop();
2103  0303 9d            nop
2105                     ; 96 	nop();
2109  0304 9d            nop
2111                     ; 97 	nop();
2115  0305 9d            nop
2117                     ; 98 	nop();
2121  0306 9d            nop
2123                     ; 99 	nop();
2127  0307 9d            nop
2129                     ; 100 	nop();
2133  0308 9d            nop
2135                     ; 101 	nop();
2139  0309 9d            nop
2141                     ; 102 	nop();
2145  030a 9d            nop
2147                     ; 103 	nop();
2151  030b 9d            nop
2153                     ; 104 	nop();
2157  030c 9d            nop
2159                     ; 105 	nop();
2163  030d 9d            nop
2165                     ; 106 	nop();
2169  030e 9d            nop
2171  030f               L763:
2172                     ; 112 	for (i = 7; i >= 0; i--) {
2174  030f 1e05          	ldw	x,(OFST-1,sp)
2175  0311 1d0001        	subw	x,#1
2176  0314 1f05          	ldw	(OFST-1,sp),x
2179  0316 9c            	rvf
2180  0317 1e05          	ldw	x,(OFST-1,sp)
2181  0319 2f02          	jrslt	L05
2182  031b 209b          	jp	L753
2183  031d               L05:
2184                     ; 318 	LED_SendByte(b);
2187  031d 7b0b          	ld	a,(OFST+5,sp)
2188  031f 6b04          	ld	(OFST-2,sp),a
2189                     ; 110 	int i = 0;
2191                     ; 112 	for (i = 7; i >= 0; i--) {
2193  0321 ae0007        	ldw	x,#7
2194  0324 1f05          	ldw	(OFST-1,sp),x
2195  0326               L173:
2196                     ; 113 		bool bit = (1<<i & data);
2198  0326 7b04          	ld	a,(OFST-2,sp)
2199  0328 5f            	clrw	x
2200  0329 97            	ld	xl,a
2201  032a 1f01          	ldw	(OFST-5,sp),x
2202  032c ae0001        	ldw	x,#1
2203  032f 7b06          	ld	a,(OFST+0,sp)
2204  0331 4d            	tnz	a
2205  0332 2704          	jreq	L24
2206  0334               L44:
2207  0334 58            	sllw	x
2208  0335 4a            	dec	a
2209  0336 26fc          	jrne	L44
2210  0338               L24:
2211  0338 01            	rrwa	x,a
2212  0339 1402          	and	a,(OFST-4,sp)
2213  033b 01            	rrwa	x,a
2214  033c 1401          	and	a,(OFST-5,sp)
2215  033e 01            	rrwa	x,a
2216  033f 01            	rrwa	x,a
2217  0340 6b03          	ld	(OFST-3,sp),a
2218  0342 02            	rlwa	x,a
2219                     ; 114 		if (bit != 0) {
2221  0343 0d03          	tnz	(OFST-3,sp)
2222  0345 271c          	jreq	L773
2223                     ; 64 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2226  0347 72125000      	bset	20480,#1
2227                     ; 65 	nop();
2230  034b 9d            nop
2232                     ; 66 	nop();
2236  034c 9d            nop
2238                     ; 67 	nop();
2242  034d 9d            nop
2244                     ; 68 	nop();
2248  034e 9d            nop
2250                     ; 69 	nop();
2254  034f 9d            nop
2256                     ; 70 	nop();
2260  0350 9d            nop
2262                     ; 71 	nop();
2266  0351 9d            nop
2268                     ; 72 	nop();
2272  0352 9d            nop
2274                     ; 73 	nop();
2278  0353 9d            nop
2280                     ; 74 	nop();
2284  0354 9d            nop
2286                     ; 75 	nop();
2290  0355 9d            nop
2292                     ; 76 	nop();
2296  0356 9d            nop
2298                     ; 77 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2301  0357 72135000      	bres	20480,#1
2302                     ; 78 	nop();
2305  035b 9d            nop
2307                     ; 79 	nop();
2311  035c 9d            nop
2313                     ; 80 	nop();
2317  035d 9d            nop
2319                     ; 81 	nop();
2323  035e 9d            nop
2325                     ; 82 	nop();
2329  035f 9d            nop
2331                     ; 83 	nop();
2335  0360 9d            nop
2338  0361 201a          	jra	L104
2339  0363               L773:
2340                     ; 87 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2343  0363 72125000      	bset	20480,#1
2344                     ; 88 	nop();
2347  0367 9d            nop
2349                     ; 89 	nop();
2353  0368 9d            nop
2355                     ; 90 	nop();
2359  0369 9d            nop
2361                     ; 91 	nop();
2365  036a 9d            nop
2367                     ; 92 	nop();
2371  036b 9d            nop
2373                     ; 93 	nop();
2377  036c 9d            nop
2379                     ; 94 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2382  036d 72135000      	bres	20480,#1
2383                     ; 95 	nop();
2386  0371 9d            nop
2388                     ; 96 	nop();
2392  0372 9d            nop
2394                     ; 97 	nop();
2398  0373 9d            nop
2400                     ; 98 	nop();
2404  0374 9d            nop
2406                     ; 99 	nop();
2410  0375 9d            nop
2412                     ; 100 	nop();
2416  0376 9d            nop
2418                     ; 101 	nop();
2422  0377 9d            nop
2424                     ; 102 	nop();
2428  0378 9d            nop
2430                     ; 103 	nop();
2434  0379 9d            nop
2436                     ; 104 	nop();
2440  037a 9d            nop
2442                     ; 105 	nop();
2446  037b 9d            nop
2448                     ; 106 	nop();
2452  037c 9d            nop
2454  037d               L104:
2455                     ; 112 	for (i = 7; i >= 0; i--) {
2457  037d 1e05          	ldw	x,(OFST-1,sp)
2458  037f 1d0001        	subw	x,#1
2459  0382 1f05          	ldw	(OFST-1,sp),x
2462  0384 9c            	rvf
2463  0385 1e05          	ldw	x,(OFST-1,sp)
2464  0387 2f02          	jrslt	L25
2465  0389 209b          	jp	L173
2466  038b               L25:
2467                     ; 297 	int i = 0;
2470                     ; 298 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2472  038b 72135000      	bres	20480,#1
2473                     ; 300 	for (i = 1280; i >= 0; i--) {
2475  038f ae0500        	ldw	x,#1280
2476  0392 1f05          	ldw	(OFST-1,sp),x
2477  0394               L304:
2478                     ; 301 		nop();
2481  0394 9d            nop
2483                     ; 300 	for (i = 1280; i >= 0; i--) {
2486  0395 1e05          	ldw	x,(OFST-1,sp)
2487  0397 1d0001        	subw	x,#1
2488  039a 1f05          	ldw	(OFST-1,sp),x
2491  039c 9c            	rvf
2492  039d 1e05          	ldw	x,(OFST-1,sp)
2493  039f 2ef3          	jrsge	L304
2494                     ; 320 	if (changeInterrupts) enableInterrupts();
2496  03a1 0d0c          	tnz	(OFST+6,sp)
2497  03a3 2701          	jreq	L114
2501  03a5 9a            rim
2503  03a6               L114:
2504                     ; 325 }
2508  03a6 5b08          	addw	sp,#8
2509  03a8 81            	ret
2536                     ; 327 void TIMER_Configuration(void)
2536                     ; 328 {
2537                     	switch	.text
2538  03a9               _TIMER_Configuration:
2542                     ; 329   TIM4_DeInit();
2544  03a9 cd0000        	call	_TIM4_DeInit
2546                     ; 332   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124 );
2548  03ac ae077c        	ldw	x,#1916
2549  03af cd0000        	call	_TIM4_TimeBaseInit
2551                     ; 335   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2553  03b2 ae0101        	ldw	x,#257
2554  03b5 cd0000        	call	_TIM4_ITConfig
2556                     ; 336 }
2559  03b8 81            	ret
2599                     ; 338 void I2C_SendPacket(u8 data) {
2600                     	switch	.text
2601  03b9               _I2C_SendPacket:
2603  03b9 88            	push	a
2604       00000000      OFST:	set	0
2607                     ; 339 	I2C_GenerateSTART(ENABLE);	
2609  03ba a601          	ld	a,#1
2610  03bc cd0000        	call	_I2C_GenerateSTART
2613  03bf               L344:
2614                     ; 340 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
2616  03bf ae0301        	ldw	x,#769
2617  03c2 cd0000        	call	_I2C_CheckEvent
2619  03c5 4d            	tnz	a
2620  03c6 27f7          	jreq	L344
2621                     ; 342 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
2623  03c8 ae1000        	ldw	x,#4096
2624  03cb cd0000        	call	_I2C_Send7bitAddress
2627  03ce               L154:
2628                     ; 344 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) ) {}
2630  03ce ae0782        	ldw	x,#1922
2631  03d1 cd0000        	call	_I2C_CheckEvent
2633  03d4 4d            	tnz	a
2634  03d5 27f7          	jreq	L154
2635                     ; 346 	I2C_SendData(received2);
2637  03d7 b609          	ld	a,_received2
2638  03d9 cd0000        	call	_I2C_SendData
2641  03dc               L754:
2642                     ; 347 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS ) {}
2644  03dc ae0784        	ldw	x,#1924
2645  03df cd0000        	call	_I2C_CheckEvent
2647  03e2 a101          	cp	a,#1
2648  03e4 26f6          	jrne	L754
2649                     ; 348 	I2C_SendData(0x01);
2651  03e6 a601          	ld	a,#1
2652  03e8 cd0000        	call	_I2C_SendData
2655  03eb               L564:
2656                     ; 349 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS ) {}
2658  03eb ae0784        	ldw	x,#1924
2659  03ee cd0000        	call	_I2C_CheckEvent
2661  03f1 a101          	cp	a,#1
2662  03f3 26f6          	jrne	L564
2663                     ; 350 	I2C_SendData(data);
2665  03f5 7b01          	ld	a,(OFST+1,sp)
2666  03f7 cd0000        	call	_I2C_SendData
2669  03fa               L374:
2670                     ; 351 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) {}
2672  03fa ae0784        	ldw	x,#1924
2673  03fd cd0000        	call	_I2C_CheckEvent
2675  0400 a101          	cp	a,#1
2676  0402 26f6          	jrne	L374
2677                     ; 352 	I2C_GenerateSTOP(ENABLE);
2679  0404 a601          	ld	a,#1
2680  0406 cd0000        	call	_I2C_GenerateSTOP
2682                     ; 353 }
2685  0409 84            	pop	a
2686  040a 81            	ret
2709                     ; 355 void Core_Ping_Reply(){
2710                     	switch	.text
2711  040b               _Core_Ping_Reply:
2715                     ; 357 }
2718  040b 81            	ret
2753                     ; 369 void assert_failed(u8* file, u32 line)
2753                     ; 370 {
2754                     	switch	.text
2755  040c               _assert_failed:
2759  040c               L525:
2760  040c 20fe          	jra	L525
2887                     	xdef	_Core_Ping_Reply
2888                     	xdef	_I2C_SendPacket
2889                     	xdef	_main
2890                     	xdef	_LED_SetColor
2891                     	xdef	_LED_SetColor_Int
2892                     	xdef	_TIMER_Configuration
2893                     	xdef	_I2C_Configuration
2894                     	xdef	_ping_received
2895                     	xdef	_received2
2896                     	xdef	_received
2897                     	xdef	_velocity
2898                     	switch	.ubsct
2899  0000               _TxBuffer:
2900  0000 000000000000  	ds.b	7
2901                     	xdef	_TxBuffer
2902                     	xdef	_next_case
2903                     	xdef	_NumOfBytes
2904                     	xdef	_i
2905                     	xdef	_note_playing
2906                     	xdef	_button_state
2907                     	xdef	_previous_button_state
2908                     	xdef	_User_Key_Pressed
2909                     	xdef	_assert_failed
2910                     	xref	_TIM4_ITConfig
2911                     	xref	_TIM4_TimeBaseInit
2912                     	xref	_TIM4_DeInit
2913                     	xref	_I2C_CheckEvent
2914                     	xref	_I2C_SendData
2915                     	xref	_I2C_Send7bitAddress
2916                     	xref	_I2C_ReceiveData
2917                     	xref	_I2C_ITConfig
2918                     	xref	_I2C_GenerateSTOP
2919                     	xref	_I2C_GenerateSTART
2920                     	xref	_I2C_GeneralCallCmd
2921                     	xref	_I2C_Init
2922                     	xref	_I2C_DeInit
2923                     	xref	_GPIO_WriteLow
2924                     	xref	_GPIO_WriteHigh
2925                     	xref	_GPIO_Init
2926                     	xref	_EXTI_SetExtIntSensitivity
2927                     	xref	_CLK_SYSCLKConfig
2928                     	xref	_CLK_HSIPrescalerConfig
2929                     	xref	_CLK_HSICmd
2930                     	xref	_CLK_DeInit
2950                     	end
