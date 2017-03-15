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
  39  000b               _nack_count:
  40  000b 00            	dc.b	0
 222                     ; 155 void main(void)
 222                     ; 156 {
 224                     	switch	.text
 225  0000               _main:
 227  0000 5206          	subw	sp,#6
 228       00000006      OFST:	set	6
 231                     ; 160 	CLK_DeInit();  
 233  0002 cd0000        	call	_CLK_DeInit
 235                     ; 161   CLK_HSICmd(ENABLE);
 237  0005 a601          	ld	a,#1
 238  0007 cd0000        	call	_CLK_HSICmd
 240                     ; 162   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 242  000a 4f            	clr	a
 243  000b cd0000        	call	_CLK_HSIPrescalerConfig
 245                     ; 163   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 247  000e a680          	ld	a,#128
 248  0010 cd0000        	call	_CLK_SYSCLKConfig
 250                     ; 166   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 252  0013 4be0          	push	#224
 253  0015 4b02          	push	#2
 254  0017 ae5000        	ldw	x,#20480
 255  001a cd0000        	call	_GPIO_Init
 257  001d 85            	popw	x
 258                     ; 167 	LED_SetColor_Int(30, 70, 100, FALSE);
 260  001e 4b00          	push	#0
 261  0020 4b64          	push	#100
 262  0022 ae1e46        	ldw	x,#7750
 263  0025 cd01f9        	call	_LED_SetColor_Int
 265  0028 85            	popw	x
 266                     ; 169 	for(startDelay = 900000; startDelay > 0; startDelay--){
 268  0029 aebba0        	ldw	x,#48032
 269  002c 1f05          	ldw	(OFST-1,sp),x
 270  002e               L34:
 271                     ; 170 				nop(); nop(); nop(); nop(); nop();
 274  002e 9d            nop
 280  002f 9d            nop
 286  0030 9d            nop
 292  0031 9d            nop
 298  0032 9d            nop
 300                     ; 171 				nop(); nop(); nop(); nop(); nop();
 304  0033 9d            nop
 310  0034 9d            nop
 316  0035 9d            nop
 322  0036 9d            nop
 328  0037 9d            nop
 330                     ; 172 				nop(); nop(); nop(); nop(); nop();
 334  0038 9d            nop
 340  0039 9d            nop
 346  003a 9d            nop
 352  003b 9d            nop
 358  003c 9d            nop
 360                     ; 173 				nop(); nop(); nop(); nop(); nop();
 364  003d 9d            nop
 370  003e 9d            nop
 376  003f 9d            nop
 382  0040 9d            nop
 388  0041 9d            nop
 390                     ; 174 				nop(); nop(); nop(); nop(); nop();
 394  0042 9d            nop
 400  0043 9d            nop
 406  0044 9d            nop
 412  0045 9d            nop
 418  0046 9d            nop
 420                     ; 175 				nop(); nop(); nop(); nop(); nop();
 424  0047 9d            nop
 430  0048 9d            nop
 436  0049 9d            nop
 442  004a 9d            nop
 448  004b 9d            nop
 450                     ; 176 				nop(); nop(); nop(); nop(); nop();
 454  004c 9d            nop
 460  004d 9d            nop
 466  004e 9d            nop
 472  004f 9d            nop
 478  0050 9d            nop
 480                     ; 177 				nop(); nop(); nop(); nop(); nop();
 484  0051 9d            nop
 490  0052 9d            nop
 496  0053 9d            nop
 502  0054 9d            nop
 508  0055 9d            nop
 510                     ; 178 				nop(); nop(); nop(); nop(); nop();
 514  0056 9d            nop
 520  0057 9d            nop
 526  0058 9d            nop
 532  0059 9d            nop
 538  005a 9d            nop
 540                     ; 179 				nop(); nop(); nop(); nop(); nop();
 544  005b 9d            nop
 550  005c 9d            nop
 556  005d 9d            nop
 562  005e 9d            nop
 568  005f 9d            nop
 570                     ; 180 				nop(); nop(); nop(); nop(); nop();
 574  0060 9d            nop
 580  0061 9d            nop
 586  0062 9d            nop
 592  0063 9d            nop
 598  0064 9d            nop
 600                     ; 181 				nop(); nop(); nop(); nop(); nop();
 604  0065 9d            nop
 610  0066 9d            nop
 616  0067 9d            nop
 622  0068 9d            nop
 628  0069 9d            nop
 630                     ; 182 				nop(); nop(); nop(); nop(); nop();
 634  006a 9d            nop
 640  006b 9d            nop
 646  006c 9d            nop
 652  006d 9d            nop
 658  006e 9d            nop
 660                     ; 183 				nop(); nop(); nop(); nop(); nop();
 664  006f 9d            nop
 670  0070 9d            nop
 676  0071 9d            nop
 682  0072 9d            nop
 688  0073 9d            nop
 690                     ; 184 				nop(); nop(); nop(); nop(); nop();
 694  0074 9d            nop
 700  0075 9d            nop
 706  0076 9d            nop
 712  0077 9d            nop
 718  0078 9d            nop
 720                     ; 185 				nop(); nop(); nop(); nop(); nop();
 724  0079 9d            nop
 730  007a 9d            nop
 736  007b 9d            nop
 742  007c 9d            nop
 748  007d 9d            nop
 750                     ; 186 				nop(); nop(); nop(); nop(); nop();
 754  007e 9d            nop
 760  007f 9d            nop
 766  0080 9d            nop
 772  0081 9d            nop
 778  0082 9d            nop
 780                     ; 187 				nop();
 784  0083 9d            nop
 786                     ; 169 	for(startDelay = 900000; startDelay > 0; startDelay--){
 789  0084 1e05          	ldw	x,(OFST-1,sp)
 790  0086 1d0001        	subw	x,#1
 791  0089 1f05          	ldw	(OFST-1,sp),x
 794  008b 1e05          	ldw	x,(OFST-1,sp)
 795  008d 2702          	jreq	L6
 796  008f 209d          	jp	L34
 797  0091               L6:
 798                     ; 191 	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 800  0091 4bd0          	push	#208
 801  0093 4b04          	push	#4
 802  0095 ae5000        	ldw	x,#20480
 803  0098 cd0000        	call	_GPIO_Init
 805  009b 85            	popw	x
 806                     ; 192 	GPIO_WriteHigh(TRIGGER_PORT, TRIGGER_PIN);
 808  009c 4b04          	push	#4
 809  009e ae5000        	ldw	x,#20480
 810  00a1 cd0000        	call	_GPIO_WriteHigh
 812  00a4 84            	pop	a
 813                     ; 214 	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
 815  00a5 4b60          	push	#96
 816  00a7 4b20          	push	#32
 817  00a9 ae500a        	ldw	x,#20490
 818  00ac cd0000        	call	_GPIO_Init
 820  00af 85            	popw	x
 821                     ; 215 	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
 823  00b0 4b60          	push	#96
 824  00b2 4b08          	push	#8
 825  00b4 ae500a        	ldw	x,#20490
 826  00b7 cd0000        	call	_GPIO_Init
 828  00ba 85            	popw	x
 829                     ; 221 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);
 831  00bb ae0203        	ldw	x,#515
 832  00be cd0000        	call	_EXTI_SetExtIntSensitivity
 834                     ; 223 	LED_SetColor_Int(100, 0, 0, FALSE);
 836  00c1 4b00          	push	#0
 837  00c3 4b00          	push	#0
 838  00c5 ae6400        	ldw	x,#25600
 839  00c8 cd01f9        	call	_LED_SetColor_Int
 841  00cb 85            	popw	x
 842                     ; 225   TIMER_Configuration();
 844  00cc cd03a9        	call	_TIMER_Configuration
 846                     ; 226 	I2C_Configuration();
 848  00cf cd01c4        	call	_I2C_Configuration
 850                     ; 227 	LED_SetColor_Int(100, 100, 0, FALSE);
 852  00d2 4b00          	push	#0
 853  00d4 4b00          	push	#0
 854  00d6 ae6464        	ldw	x,#25700
 855  00d9 cd01f9        	call	_LED_SetColor_Int
 857  00dc 85            	popw	x
 858                     ; 230 	I2C_GenerateSTART(ENABLE);
 860  00dd a601          	ld	a,#1
 861  00df cd0000        	call	_I2C_GenerateSTART
 864  00e2               L35:
 865                     ; 231 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
 867  00e2 ae0301        	ldw	x,#769
 868  00e5 cd0000        	call	_I2C_CheckEvent
 870  00e8 4d            	tnz	a
 871  00e9 27f7          	jreq	L35
 872                     ; 232 	LED_SetColor_Int(80, 80, 20, FALSE);
 874  00eb 4b00          	push	#0
 875  00ed 4b14          	push	#20
 876  00ef ae5050        	ldw	x,#20560
 877  00f2 cd01f9        	call	_LED_SetColor_Int
 879  00f5 85            	popw	x
 880                     ; 234 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
 882  00f6 ae1000        	ldw	x,#4096
 883  00f9 cd0000        	call	_I2C_Send7bitAddress
 886  00fc               L16:
 887                     ; 235 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
 889  00fc ae0782        	ldw	x,#1922
 890  00ff cd0000        	call	_I2C_CheckEvent
 892  0102 a101          	cp	a,#1
 893  0104 26f6          	jrne	L16
 894                     ; 236 	LED_SetColor_Int(60, 60, 40, FALSE);
 896  0106 4b00          	push	#0
 897  0108 4b28          	push	#40
 898  010a ae3c3c        	ldw	x,#15420
 899  010d cd01f9        	call	_LED_SetColor_Int
 901  0110 85            	popw	x
 902                     ; 239 	I2C_SendData(0x01);
 904  0111 a601          	ld	a,#1
 905  0113 cd0000        	call	_I2C_SendData
 908  0116               L76:
 909                     ; 240 	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
 911  0116 ae0784        	ldw	x,#1924
 912  0119 cd0000        	call	_I2C_CheckEvent
 914  011c a101          	cp	a,#1
 915  011e 26f6          	jrne	L76
 916                     ; 241 	LED_SetColor_Int(40, 40, 60, FALSE);
 918  0120 4b00          	push	#0
 919  0122 4b3c          	push	#60
 920  0124 ae2828        	ldw	x,#10280
 921  0127 cd01f9        	call	_LED_SetColor_Int
 923  012a 85            	popw	x
 924                     ; 243 	I2C_GeneralCallCmd(ENABLE);
 926  012b a601          	ld	a,#1
 927  012d cd0000        	call	_I2C_GeneralCallCmd
 929                     ; 244 	I2C_GenerateSTOP(ENABLE);
 931  0130 a601          	ld	a,#1
 932  0132 cd0000        	call	_I2C_GenerateSTOP
 935  0135               L57:
 936                     ; 247 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
 938  0135 ae1200        	ldw	x,#4608
 939  0138 cd0000        	call	_I2C_CheckEvent
 941  013b a101          	cp	a,#1
 942  013d 26f6          	jrne	L57
 943                     ; 248 	received = I2C_ReceiveData();
 945  013f cd0000        	call	_I2C_ReceiveData
 947  0142 b708          	ld	_received,a
 949  0144               L501:
 950                     ; 249 	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
 952  0144 ae0240        	ldw	x,#576
 953  0147 cd0000        	call	_I2C_CheckEvent
 955  014a a101          	cp	a,#1
 956  014c 26f6          	jrne	L501
 957                     ; 250 	received2 = I2C_ReceiveData();
 959  014e cd0000        	call	_I2C_ReceiveData
 961  0151 b709          	ld	_received2,a
 962                     ; 251 	I2C_GeneralCallCmd(DISABLE);
 964  0153 4f            	clr	a
 965  0154 cd0000        	call	_I2C_GeneralCallCmd
 967                     ; 252 	LED_SetColor_Int(20, 20, 80, FALSE);
 969  0157 4b00          	push	#0
 970  0159 4b50          	push	#80
 971  015b ae1414        	ldw	x,#5140
 972  015e cd01f9        	call	_LED_SetColor_Int
 974  0161 85            	popw	x
 975                     ; 255 	I2C_Configuration();
 977  0162 ad60          	call	_I2C_Configuration
 979                     ; 256 	LED_SetColor_Int(0, 0, 100, FALSE);
 981  0164 4b00          	push	#0
 982  0166 4b64          	push	#100
 983  0168 5f            	clrw	x
 984  0169 cd01f9        	call	_LED_SetColor_Int
 986  016c 85            	popw	x
 987                     ; 257 	enableInterrupts();
 990  016d 9a            rim
 992                     ; 259 	GPIO_WriteLow(TRIGGER_PORT,  TRIGGER_PIN);
 995  016e 4b04          	push	#4
 996  0170 ae5000        	ldw	x,#20480
 997  0173 cd0000        	call	_GPIO_WriteLow
 999  0176 84            	pop	a
1000                     ; 260 	for (i = 500; i >= 0; i--) {
1002  0177 ae01f4        	ldw	x,#500
1003  017a 1f01          	ldw	(OFST-5,sp),x
1004  017c               L111:
1005                     ; 261 		for (j = 1; j >= 0; j--) {
1007  017c ae0001        	ldw	x,#1
1008  017f 1f05          	ldw	(OFST-1,sp),x
1009  0181               L711:
1010                     ; 262 		  for (k = 1; k >= 0; k--) {
1012  0181 ae0001        	ldw	x,#1
1013  0184 1f03          	ldw	(OFST-3,sp),x
1014  0186               L521:
1015                     ; 263 			  nop();nop();nop();nop();nop();
1018  0186 9d            nop
1024  0187 9d            nop
1030  0188 9d            nop
1036  0189 9d            nop
1042  018a 9d            nop
1044                     ; 262 		  for (k = 1; k >= 0; k--) {
1047  018b 1e03          	ldw	x,(OFST-3,sp)
1048  018d 1d0001        	subw	x,#1
1049  0190 1f03          	ldw	(OFST-3,sp),x
1052  0192 9c            	rvf
1053  0193 1e03          	ldw	x,(OFST-3,sp)
1054  0195 2eef          	jrsge	L521
1055                     ; 261 		for (j = 1; j >= 0; j--) {
1057  0197 1e05          	ldw	x,(OFST-1,sp)
1058  0199 1d0001        	subw	x,#1
1059  019c 1f05          	ldw	(OFST-1,sp),x
1062  019e 9c            	rvf
1063  019f 1e05          	ldw	x,(OFST-1,sp)
1064  01a1 2ede          	jrsge	L711
1065                     ; 260 	for (i = 500; i >= 0; i--) {
1067  01a3 1e01          	ldw	x,(OFST-5,sp)
1068  01a5 1d0001        	subw	x,#1
1069  01a8 1f01          	ldw	(OFST-5,sp),x
1072  01aa 9c            	rvf
1073  01ab 1e01          	ldw	x,(OFST-5,sp)
1074  01ad 2ecd          	jrsge	L111
1075                     ; 267 	GPIO_WriteHigh(TRIGGER_PORT,  TRIGGER_PIN);
1077  01af 4b04          	push	#4
1078  01b1 ae5000        	ldw	x,#20480
1079  01b4 cd0000        	call	_GPIO_WriteHigh
1081  01b7 84            	pop	a
1082                     ; 270 	LED_SetColor_Int(0, 0, 0, FALSE);
1084  01b8 4b00          	push	#0
1085  01ba 4b00          	push	#0
1086  01bc 5f            	clrw	x
1087  01bd ad3a          	call	_LED_SetColor_Int
1089  01bf 85            	popw	x
1090                     ; 273 	wfi();
1093  01c0 8f            wfi
1095                     ; 280 }
1099  01c1 5b06          	addw	sp,#6
1100  01c3 81            	ret
1127                     ; 282 void I2C_Configuration(void) {
1128                     	switch	.text
1129  01c4               _I2C_Configuration:
1133                     ; 283 	I2C_DeInit();
1135  01c4 cd0000        	call	_I2C_DeInit
1137                     ; 284   I2C_Init(I2C_MAX_STANDARD_FREQ,
1137                     ; 285      (received2<<1),// Self address 
1137                     ; 286      I2C_DUTYCYCLE_2, 
1137                     ; 287      I2C_ACK_CURR,
1137                     ; 288      I2C_ADDMODE_7BIT, 
1137                     ; 289      I2C_MAX_INPUT_FREQ
1137                     ; 290   );
1139  01c7 4b10          	push	#16
1140  01c9 4b00          	push	#0
1141  01cb 4b01          	push	#1
1142  01cd 4b00          	push	#0
1143  01cf b609          	ld	a,_received2
1144  01d1 5f            	clrw	x
1145  01d2 97            	ld	xl,a
1146  01d3 58            	sllw	x
1147  01d4 89            	pushw	x
1148  01d5 ae86a0        	ldw	x,#34464
1149  01d8 89            	pushw	x
1150  01d9 ae0001        	ldw	x,#1
1151  01dc 89            	pushw	x
1152  01dd cd0000        	call	_I2C_Init
1154  01e0 5b0a          	addw	sp,#10
1155                     ; 291 	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
1155                     ; 292 	ENABLE);
1157  01e2 ae0601        	ldw	x,#1537
1158  01e5 cd0000        	call	_I2C_ITConfig
1160                     ; 295 }
1163  01e8 81            	ret
1216                     ; 306 void LED_SetColor(u8 r, u8 g, u8 b) {
1217                     	switch	.text
1218  01e9               _LED_SetColor:
1220  01e9 89            	pushw	x
1221       00000000      OFST:	set	0
1224                     ; 307 	LED_SetColor_Int(r, g, b, TRUE);
1226  01ea 4b01          	push	#1
1227  01ec 7b06          	ld	a,(OFST+6,sp)
1228  01ee 88            	push	a
1229  01ef 9f            	ld	a,xl
1230  01f0 97            	ld	xl,a
1231  01f1 7b03          	ld	a,(OFST+3,sp)
1232  01f3 95            	ld	xh,a
1233  01f4 ad03          	call	_LED_SetColor_Int
1235  01f6 85            	popw	x
1236                     ; 308 }
1239  01f7 85            	popw	x
1240  01f8 81            	ret
1540                     ; 311 void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
1541                     	switch	.text
1542  01f9               _LED_SetColor_Int:
1544  01f9 89            	pushw	x
1545  01fa 5206          	subw	sp,#6
1546       00000006      OFST:	set	6
1549                     ; 312 	r = r > 100 ? 100 : r;
1551  01fc 7b07          	ld	a,(OFST+1,sp)
1552  01fe a165          	cp	a,#101
1553  0200 2504          	jrult	L61
1554  0202 a664          	ld	a,#100
1555  0204 2002          	jra	L02
1556  0206               L61:
1557  0206 7b07          	ld	a,(OFST+1,sp)
1558  0208               L02:
1559  0208 6b07          	ld	(OFST+1,sp),a
1560                     ; 313 	g = g > 100 ? 100 : g;
1562  020a 7b08          	ld	a,(OFST+2,sp)
1563  020c a165          	cp	a,#101
1564  020e 2504          	jrult	L22
1565  0210 a664          	ld	a,#100
1566  0212 2002          	jra	L42
1567  0214               L22:
1568  0214 7b08          	ld	a,(OFST+2,sp)
1569  0216               L42:
1570  0216 6b08          	ld	(OFST+2,sp),a
1571                     ; 314 	b = b > 100 ? 100 : b;
1573  0218 7b0b          	ld	a,(OFST+5,sp)
1574  021a a165          	cp	a,#101
1575  021c 2504          	jrult	L62
1576  021e a664          	ld	a,#100
1577  0220 2002          	jra	L03
1578  0222               L62:
1579  0222 7b0b          	ld	a,(OFST+5,sp)
1580  0224               L03:
1581  0224 6b0b          	ld	(OFST+5,sp),a
1582                     ; 315 	if (changeInterrupts) disableInterrupts();
1584  0226 0d0c          	tnz	(OFST+6,sp)
1585  0228 2701          	jreq	L533
1589  022a 9b            sim
1591  022b               L533:
1592                     ; 298 	int i = 0;
1596                     ; 299 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1598  022b 72135000      	bres	20480,#1
1599                     ; 301 	for (i = 1280; i >= 0; i--) {
1601  022f ae0500        	ldw	x,#1280
1602  0232 1f05          	ldw	(OFST-1,sp),x
1603  0234               L733:
1604                     ; 302 		nop();
1607  0234 9d            nop
1609                     ; 301 	for (i = 1280; i >= 0; i--) {
1612  0235 1e05          	ldw	x,(OFST-1,sp)
1613  0237 1d0001        	subw	x,#1
1614  023a 1f05          	ldw	(OFST-1,sp),x
1617  023c 9c            	rvf
1618  023d 1e05          	ldw	x,(OFST-1,sp)
1619  023f 2ef3          	jrsge	L733
1620                     ; 317 	LED_SendByte(g);
1623  0241 7b08          	ld	a,(OFST+2,sp)
1624  0243 6b04          	ld	(OFST-2,sp),a
1625                     ; 111 	int i = 0;
1627                     ; 113 	for (i = 7; i >= 0; i--) {
1629  0245 ae0007        	ldw	x,#7
1630  0248 1f05          	ldw	(OFST-1,sp),x
1631  024a               L543:
1632                     ; 114 		bool bit = (1<<i & data);
1634  024a 7b04          	ld	a,(OFST-2,sp)
1635  024c 5f            	clrw	x
1636  024d 97            	ld	xl,a
1637  024e 1f01          	ldw	(OFST-5,sp),x
1638  0250 ae0001        	ldw	x,#1
1639  0253 7b06          	ld	a,(OFST+0,sp)
1640  0255 4d            	tnz	a
1641  0256 2704          	jreq	L23
1642  0258               L43:
1643  0258 58            	sllw	x
1644  0259 4a            	dec	a
1645  025a 26fc          	jrne	L43
1646  025c               L23:
1647  025c 01            	rrwa	x,a
1648  025d 1402          	and	a,(OFST-4,sp)
1649  025f 01            	rrwa	x,a
1650  0260 1401          	and	a,(OFST-5,sp)
1651  0262 01            	rrwa	x,a
1652  0263 01            	rrwa	x,a
1653  0264 6b03          	ld	(OFST-3,sp),a
1654  0266 02            	rlwa	x,a
1655                     ; 115 		if (bit != 0) {
1657  0267 0d03          	tnz	(OFST-3,sp)
1658  0269 271c          	jreq	L353
1659                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1662  026b 72125000      	bset	20480,#1
1663                     ; 66 	nop();
1666  026f 9d            nop
1668                     ; 67 	nop();
1672  0270 9d            nop
1674                     ; 68 	nop();
1678  0271 9d            nop
1680                     ; 69 	nop();
1684  0272 9d            nop
1686                     ; 70 	nop();
1690  0273 9d            nop
1692                     ; 71 	nop();
1696  0274 9d            nop
1698                     ; 72 	nop();
1702  0275 9d            nop
1704                     ; 73 	nop();
1708  0276 9d            nop
1710                     ; 74 	nop();
1714  0277 9d            nop
1716                     ; 75 	nop();
1720  0278 9d            nop
1722                     ; 76 	nop();
1726  0279 9d            nop
1728                     ; 77 	nop();
1732  027a 9d            nop
1734                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1737  027b 72135000      	bres	20480,#1
1738                     ; 79 	nop();
1741  027f 9d            nop
1743                     ; 80 	nop();
1747  0280 9d            nop
1749                     ; 81 	nop();
1753  0281 9d            nop
1755                     ; 82 	nop();
1759  0282 9d            nop
1761                     ; 83 	nop();
1765  0283 9d            nop
1767                     ; 84 	nop();
1771  0284 9d            nop
1774  0285 201a          	jra	L553
1775  0287               L353:
1776                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1779  0287 72125000      	bset	20480,#1
1780                     ; 89 	nop();
1783  028b 9d            nop
1785                     ; 90 	nop();
1789  028c 9d            nop
1791                     ; 91 	nop();
1795  028d 9d            nop
1797                     ; 92 	nop();
1801  028e 9d            nop
1803                     ; 93 	nop();
1807  028f 9d            nop
1809                     ; 94 	nop();
1813  0290 9d            nop
1815                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
1818  0291 72135000      	bres	20480,#1
1819                     ; 96 	nop();
1822  0295 9d            nop
1824                     ; 97 	nop();
1828  0296 9d            nop
1830                     ; 98 	nop();
1834  0297 9d            nop
1836                     ; 99 	nop();
1840  0298 9d            nop
1842                     ; 100 	nop();
1846  0299 9d            nop
1848                     ; 101 	nop();
1852  029a 9d            nop
1854                     ; 102 	nop();
1858  029b 9d            nop
1860                     ; 103 	nop();
1864  029c 9d            nop
1866                     ; 104 	nop();
1870  029d 9d            nop
1872                     ; 105 	nop();
1876  029e 9d            nop
1878                     ; 106 	nop();
1882  029f 9d            nop
1884                     ; 107 	nop();
1888  02a0 9d            nop
1890  02a1               L553:
1891                     ; 113 	for (i = 7; i >= 0; i--) {
1893  02a1 1e05          	ldw	x,(OFST-1,sp)
1894  02a3 1d0001        	subw	x,#1
1895  02a6 1f05          	ldw	(OFST-1,sp),x
1898  02a8 9c            	rvf
1899  02a9 1e05          	ldw	x,(OFST-1,sp)
1900  02ab 2f02          	jrslt	L64
1901  02ad 209b          	jp	L543
1902  02af               L64:
1903                     ; 318 	LED_SendByte(r);
1906  02af 7b07          	ld	a,(OFST+1,sp)
1907  02b1 6b04          	ld	(OFST-2,sp),a
1908                     ; 111 	int i = 0;
1910                     ; 113 	for (i = 7; i >= 0; i--) {
1912  02b3 ae0007        	ldw	x,#7
1913  02b6 1f05          	ldw	(OFST-1,sp),x
1914  02b8               L753:
1915                     ; 114 		bool bit = (1<<i & data);
1917  02b8 7b04          	ld	a,(OFST-2,sp)
1918  02ba 5f            	clrw	x
1919  02bb 97            	ld	xl,a
1920  02bc 1f01          	ldw	(OFST-5,sp),x
1921  02be ae0001        	ldw	x,#1
1922  02c1 7b06          	ld	a,(OFST+0,sp)
1923  02c3 4d            	tnz	a
1924  02c4 2704          	jreq	L63
1925  02c6               L04:
1926  02c6 58            	sllw	x
1927  02c7 4a            	dec	a
1928  02c8 26fc          	jrne	L04
1929  02ca               L63:
1930  02ca 01            	rrwa	x,a
1931  02cb 1402          	and	a,(OFST-4,sp)
1932  02cd 01            	rrwa	x,a
1933  02ce 1401          	and	a,(OFST-5,sp)
1934  02d0 01            	rrwa	x,a
1935  02d1 01            	rrwa	x,a
1936  02d2 6b03          	ld	(OFST-3,sp),a
1937  02d4 02            	rlwa	x,a
1938                     ; 115 		if (bit != 0) {
1940  02d5 0d03          	tnz	(OFST-3,sp)
1941  02d7 271c          	jreq	L563
1942                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
1945  02d9 72125000      	bset	20480,#1
1946                     ; 66 	nop();
1949  02dd 9d            nop
1951                     ; 67 	nop();
1955  02de 9d            nop
1957                     ; 68 	nop();
1961  02df 9d            nop
1963                     ; 69 	nop();
1967  02e0 9d            nop
1969                     ; 70 	nop();
1973  02e1 9d            nop
1975                     ; 71 	nop();
1979  02e2 9d            nop
1981                     ; 72 	nop();
1985  02e3 9d            nop
1987                     ; 73 	nop();
1991  02e4 9d            nop
1993                     ; 74 	nop();
1997  02e5 9d            nop
1999                     ; 75 	nop();
2003  02e6 9d            nop
2005                     ; 76 	nop();
2009  02e7 9d            nop
2011                     ; 77 	nop();
2015  02e8 9d            nop
2017                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2020  02e9 72135000      	bres	20480,#1
2021                     ; 79 	nop();
2024  02ed 9d            nop
2026                     ; 80 	nop();
2030  02ee 9d            nop
2032                     ; 81 	nop();
2036  02ef 9d            nop
2038                     ; 82 	nop();
2042  02f0 9d            nop
2044                     ; 83 	nop();
2048  02f1 9d            nop
2050                     ; 84 	nop();
2054  02f2 9d            nop
2057  02f3 201a          	jra	L763
2058  02f5               L563:
2059                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2062  02f5 72125000      	bset	20480,#1
2063                     ; 89 	nop();
2066  02f9 9d            nop
2068                     ; 90 	nop();
2072  02fa 9d            nop
2074                     ; 91 	nop();
2078  02fb 9d            nop
2080                     ; 92 	nop();
2084  02fc 9d            nop
2086                     ; 93 	nop();
2090  02fd 9d            nop
2092                     ; 94 	nop();
2096  02fe 9d            nop
2098                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2101  02ff 72135000      	bres	20480,#1
2102                     ; 96 	nop();
2105  0303 9d            nop
2107                     ; 97 	nop();
2111  0304 9d            nop
2113                     ; 98 	nop();
2117  0305 9d            nop
2119                     ; 99 	nop();
2123  0306 9d            nop
2125                     ; 100 	nop();
2129  0307 9d            nop
2131                     ; 101 	nop();
2135  0308 9d            nop
2137                     ; 102 	nop();
2141  0309 9d            nop
2143                     ; 103 	nop();
2147  030a 9d            nop
2149                     ; 104 	nop();
2153  030b 9d            nop
2155                     ; 105 	nop();
2159  030c 9d            nop
2161                     ; 106 	nop();
2165  030d 9d            nop
2167                     ; 107 	nop();
2171  030e 9d            nop
2173  030f               L763:
2174                     ; 113 	for (i = 7; i >= 0; i--) {
2176  030f 1e05          	ldw	x,(OFST-1,sp)
2177  0311 1d0001        	subw	x,#1
2178  0314 1f05          	ldw	(OFST-1,sp),x
2181  0316 9c            	rvf
2182  0317 1e05          	ldw	x,(OFST-1,sp)
2183  0319 2f02          	jrslt	L05
2184  031b 209b          	jp	L753
2185  031d               L05:
2186                     ; 319 	LED_SendByte(b);
2189  031d 7b0b          	ld	a,(OFST+5,sp)
2190  031f 6b04          	ld	(OFST-2,sp),a
2191                     ; 111 	int i = 0;
2193                     ; 113 	for (i = 7; i >= 0; i--) {
2195  0321 ae0007        	ldw	x,#7
2196  0324 1f05          	ldw	(OFST-1,sp),x
2197  0326               L173:
2198                     ; 114 		bool bit = (1<<i & data);
2200  0326 7b04          	ld	a,(OFST-2,sp)
2201  0328 5f            	clrw	x
2202  0329 97            	ld	xl,a
2203  032a 1f01          	ldw	(OFST-5,sp),x
2204  032c ae0001        	ldw	x,#1
2205  032f 7b06          	ld	a,(OFST+0,sp)
2206  0331 4d            	tnz	a
2207  0332 2704          	jreq	L24
2208  0334               L44:
2209  0334 58            	sllw	x
2210  0335 4a            	dec	a
2211  0336 26fc          	jrne	L44
2212  0338               L24:
2213  0338 01            	rrwa	x,a
2214  0339 1402          	and	a,(OFST-4,sp)
2215  033b 01            	rrwa	x,a
2216  033c 1401          	and	a,(OFST-5,sp)
2217  033e 01            	rrwa	x,a
2218  033f 01            	rrwa	x,a
2219  0340 6b03          	ld	(OFST-3,sp),a
2220  0342 02            	rlwa	x,a
2221                     ; 115 		if (bit != 0) {
2223  0343 0d03          	tnz	(OFST-3,sp)
2224  0345 271c          	jreq	L773
2225                     ; 65 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2228  0347 72125000      	bset	20480,#1
2229                     ; 66 	nop();
2232  034b 9d            nop
2234                     ; 67 	nop();
2238  034c 9d            nop
2240                     ; 68 	nop();
2244  034d 9d            nop
2246                     ; 69 	nop();
2250  034e 9d            nop
2252                     ; 70 	nop();
2256  034f 9d            nop
2258                     ; 71 	nop();
2262  0350 9d            nop
2264                     ; 72 	nop();
2268  0351 9d            nop
2270                     ; 73 	nop();
2274  0352 9d            nop
2276                     ; 74 	nop();
2280  0353 9d            nop
2282                     ; 75 	nop();
2286  0354 9d            nop
2288                     ; 76 	nop();
2292  0355 9d            nop
2294                     ; 77 	nop();
2298  0356 9d            nop
2300                     ; 78 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2303  0357 72135000      	bres	20480,#1
2304                     ; 79 	nop();
2307  035b 9d            nop
2309                     ; 80 	nop();
2313  035c 9d            nop
2315                     ; 81 	nop();
2319  035d 9d            nop
2321                     ; 82 	nop();
2325  035e 9d            nop
2327                     ; 83 	nop();
2331  035f 9d            nop
2333                     ; 84 	nop();
2337  0360 9d            nop
2340  0361 201a          	jra	L104
2341  0363               L773:
2342                     ; 88 	LED_PORT->ODR |= (uint8_t)LED_PIN;
2345  0363 72125000      	bset	20480,#1
2346                     ; 89 	nop();
2349  0367 9d            nop
2351                     ; 90 	nop();
2355  0368 9d            nop
2357                     ; 91 	nop();
2361  0369 9d            nop
2363                     ; 92 	nop();
2367  036a 9d            nop
2369                     ; 93 	nop();
2373  036b 9d            nop
2375                     ; 94 	nop();
2379  036c 9d            nop
2381                     ; 95 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2384  036d 72135000      	bres	20480,#1
2385                     ; 96 	nop();
2388  0371 9d            nop
2390                     ; 97 	nop();
2394  0372 9d            nop
2396                     ; 98 	nop();
2400  0373 9d            nop
2402                     ; 99 	nop();
2406  0374 9d            nop
2408                     ; 100 	nop();
2412  0375 9d            nop
2414                     ; 101 	nop();
2418  0376 9d            nop
2420                     ; 102 	nop();
2424  0377 9d            nop
2426                     ; 103 	nop();
2430  0378 9d            nop
2432                     ; 104 	nop();
2436  0379 9d            nop
2438                     ; 105 	nop();
2442  037a 9d            nop
2444                     ; 106 	nop();
2448  037b 9d            nop
2450                     ; 107 	nop();
2454  037c 9d            nop
2456  037d               L104:
2457                     ; 113 	for (i = 7; i >= 0; i--) {
2459  037d 1e05          	ldw	x,(OFST-1,sp)
2460  037f 1d0001        	subw	x,#1
2461  0382 1f05          	ldw	(OFST-1,sp),x
2464  0384 9c            	rvf
2465  0385 1e05          	ldw	x,(OFST-1,sp)
2466  0387 2f02          	jrslt	L25
2467  0389 209b          	jp	L173
2468  038b               L25:
2469                     ; 298 	int i = 0;
2472                     ; 299 	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
2474  038b 72135000      	bres	20480,#1
2475                     ; 301 	for (i = 1280; i >= 0; i--) {
2477  038f ae0500        	ldw	x,#1280
2478  0392 1f05          	ldw	(OFST-1,sp),x
2479  0394               L304:
2480                     ; 302 		nop();
2483  0394 9d            nop
2485                     ; 301 	for (i = 1280; i >= 0; i--) {
2488  0395 1e05          	ldw	x,(OFST-1,sp)
2489  0397 1d0001        	subw	x,#1
2490  039a 1f05          	ldw	(OFST-1,sp),x
2493  039c 9c            	rvf
2494  039d 1e05          	ldw	x,(OFST-1,sp)
2495  039f 2ef3          	jrsge	L304
2496                     ; 321 	if (changeInterrupts) enableInterrupts();
2498  03a1 0d0c          	tnz	(OFST+6,sp)
2499  03a3 2701          	jreq	L114
2503  03a5 9a            rim
2505  03a6               L114:
2506                     ; 326 }
2510  03a6 5b08          	addw	sp,#8
2511  03a8 81            	ret
2538                     ; 328 void TIMER_Configuration(void)
2538                     ; 329 {
2539                     	switch	.text
2540  03a9               _TIMER_Configuration:
2544                     ; 330   TIM4_DeInit();
2546  03a9 cd0000        	call	_TIM4_DeInit
2548                     ; 333   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124 );
2550  03ac ae077c        	ldw	x,#1916
2551  03af cd0000        	call	_TIM4_TimeBaseInit
2553                     ; 336   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2555  03b2 ae0101        	ldw	x,#257
2556  03b5 cd0000        	call	_TIM4_ITConfig
2558                     ; 337 }
2561  03b8 81            	ret
2603                     ; 339 void I2C_SendPacket(u8 velocity) {
2604                     	switch	.text
2605  03b9               _I2C_SendPacket:
2607  03b9 88            	push	a
2608       00000000      OFST:	set	0
2611                     ; 340 	I2C_GenerateSTART(ENABLE);	
2613  03ba a601          	ld	a,#1
2614  03bc cd0000        	call	_I2C_GenerateSTART
2617  03bf               L344:
2618                     ; 341 	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
2620  03bf ae0301        	ldw	x,#769
2621  03c2 cd0000        	call	_I2C_CheckEvent
2623  03c5 4d            	tnz	a
2624  03c6 27f7          	jreq	L344
2625                     ; 343 	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
2627  03c8 ae1000        	ldw	x,#4096
2628  03cb cd0000        	call	_I2C_Send7bitAddress
2630                     ; 344 	nack_count = 0;
2632  03ce 3f0b          	clr	_nack_count
2634  03d0 2019          	jra	L354
2635  03d2               L744:
2636                     ; 347 		if (nack_count > 10)
2638  03d2 b60b          	ld	a,_nack_count
2639  03d4 a10b          	cp	a,#11
2640  03d6 2502          	jrult	L754
2641                     ; 349 			return;
2644  03d8 84            	pop	a
2645  03d9 81            	ret
2646  03da               L754:
2647                     ; 351 		else if (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
2649  03da ae0204        	ldw	x,#516
2650  03dd cd0000        	call	_I2C_GetFlagStatus
2652  03e0 4d            	tnz	a
2653  03e1 2708          	jreq	L354
2654                     ; 353 			nack_count++;
2656  03e3 3c0b          	inc	_nack_count
2657                     ; 354 			I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
2659  03e5 ae1000        	ldw	x,#4096
2660  03e8 cd0000        	call	_I2C_Send7bitAddress
2662  03eb               L354:
2663                     ; 345 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
2665  03eb ae0782        	ldw	x,#1922
2666  03ee cd0000        	call	_I2C_CheckEvent
2668  03f1 4d            	tnz	a
2669  03f2 27de          	jreq	L744
2670                     ; 358 	I2C_SendData(received2);
2672  03f4 b609          	ld	a,_received2
2673  03f6 cd0000        	call	_I2C_SendData
2676  03f9               L764:
2677                     ; 359 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS ) {}
2679  03f9 ae0784        	ldw	x,#1924
2680  03fc cd0000        	call	_I2C_CheckEvent
2682  03ff a101          	cp	a,#1
2683  0401 26f6          	jrne	L764
2684                     ; 360 	I2C_SendData(velocity);
2686  0403 7b01          	ld	a,(OFST+1,sp)
2687  0405 cd0000        	call	_I2C_SendData
2690  0408               L574:
2691                     ; 361 	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) {}
2693  0408 ae0784        	ldw	x,#1924
2694  040b cd0000        	call	_I2C_CheckEvent
2696  040e a101          	cp	a,#1
2697  0410 26f6          	jrne	L574
2698                     ; 363 	I2C_GenerateSTOP(ENABLE);
2700  0412 a601          	ld	a,#1
2701  0414 cd0000        	call	_I2C_GenerateSTOP
2703                     ; 364 }
2706  0417 84            	pop	a
2707  0418 81            	ret
2742                     ; 376 void assert_failed(u8* file, u32 line)
2742                     ; 377 {
2743                     	switch	.text
2744  0419               _assert_failed:
2748  0419               L715:
2749  0419 20fe          	jra	L715
2885                     	xdef	_I2C_SendPacket
2886                     	xdef	_main
2887                     	xdef	_LED_SetColor
2888                     	xdef	_LED_SetColor_Int
2889                     	xdef	_TIMER_Configuration
2890                     	xdef	_I2C_Configuration
2891                     	xdef	_nack_count
2892                     	xdef	_ping_received
2893                     	xdef	_received2
2894                     	xdef	_received
2895                     	xdef	_velocity
2896                     	switch	.ubsct
2897  0000               _TxBuffer:
2898  0000 000000000000  	ds.b	7
2899                     	xdef	_TxBuffer
2900                     	xdef	_next_case
2901                     	xdef	_NumOfBytes
2902                     	xdef	_i
2903                     	xdef	_note_playing
2904                     	xdef	_button_state
2905                     	xdef	_previous_button_state
2906                     	xdef	_User_Key_Pressed
2907                     	xdef	_assert_failed
2908                     	xref	_TIM4_ITConfig
2909                     	xref	_TIM4_TimeBaseInit
2910                     	xref	_TIM4_DeInit
2911                     	xref	_I2C_GetFlagStatus
2912                     	xref	_I2C_CheckEvent
2913                     	xref	_I2C_SendData
2914                     	xref	_I2C_Send7bitAddress
2915                     	xref	_I2C_ReceiveData
2916                     	xref	_I2C_ITConfig
2917                     	xref	_I2C_GenerateSTOP
2918                     	xref	_I2C_GenerateSTART
2919                     	xref	_I2C_GeneralCallCmd
2920                     	xref	_I2C_Init
2921                     	xref	_I2C_DeInit
2922                     	xref	_GPIO_WriteLow
2923                     	xref	_GPIO_WriteHigh
2924                     	xref	_GPIO_Init
2925                     	xref	_EXTI_SetExtIntSensitivity
2926                     	xref	_CLK_SYSCLKConfig
2927                     	xref	_CLK_HSIPrescalerConfig
2928                     	xref	_CLK_HSICmd
2929                     	xref	_CLK_DeInit
2949                     	end
