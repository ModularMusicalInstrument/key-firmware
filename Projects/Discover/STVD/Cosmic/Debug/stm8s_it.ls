   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _stopDelay:
  18  0000 0000          	dc.w	0
  48                     ; 58 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  48                     ; 59 {
  49                     	switch	.text
  50  0000               f_NonHandledInterrupt:
  54                     ; 63 }
  57  0000 80            	iret
  79                     ; 71 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  79                     ; 72 {
  80                     	switch	.text
  81  0001               f_TRAP_IRQHandler:
  85                     ; 76 }
  88  0001 80            	iret
 110                     ; 83 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 110                     ; 84 
 110                     ; 85 {
 111                     	switch	.text
 112  0002               f_TLI_IRQHandler:
 116                     ; 89 }
 119  0002 80            	iret
 141                     ; 96 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 141                     ; 97 {
 142                     	switch	.text
 143  0003               f_AWU_IRQHandler:
 147                     ; 101 }
 150  0003 80            	iret
 172                     ; 108 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 172                     ; 109 {
 173                     	switch	.text
 174  0004               f_CLK_IRQHandler:
 178                     ; 113 }
 181  0004 80            	iret
 204                     ; 120 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 204                     ; 121 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTA_IRQHandler:
 210                     ; 125 }
 213  0005 80            	iret
 236                     ; 132 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 236                     ; 133 {
 237                     	switch	.text
 238  0006               f_EXTI_PORTB_IRQHandler:
 242                     ; 137 }
 245  0006 80            	iret
 412                     ; 144 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 412                     ; 145 {
 413                     	switch	.text
 414  0007               f_EXTI_PORTC_IRQHandler:
 416  0007 8a            	push	cc
 417  0008 84            	pop	a
 418  0009 a4bf          	and	a,#191
 419  000b 88            	push	a
 420  000c 86            	pop	cc
 421       00000003      OFST:	set	3
 422  000d 3b0002        	push	c_x+2
 423  0010 be00          	ldw	x,c_x
 424  0012 89            	pushw	x
 425  0013 3b0002        	push	c_y+2
 426  0016 be00          	ldw	x,c_y
 427  0018 89            	pushw	x
 428  0019 5203          	subw	sp,#3
 431                     ; 149 	const bool top_pressed = (GPIOC->IDR & TOP_BUTTON) == 0;
 433  001b c6500b        	ld	a,20491
 434  001e a520          	bcp	a,#32
 435  0020 2605          	jrne	L42
 436  0022 ae0001        	ldw	x,#1
 437  0025 2001          	jra	L62
 438  0027               L42:
 439  0027 5f            	clrw	x
 440  0028               L62:
 441  0028 01            	rrwa	x,a
 442  0029 6b02          	ld	(OFST-1,sp),a
 443  002b 02            	rlwa	x,a
 444                     ; 150 	const bool bottom_pressed = (GPIOC->IDR & BOTTOM_BUTTON) == 0;
 446  002c c6500b        	ld	a,20491
 447  002f a508          	bcp	a,#8
 448  0031 2605          	jrne	L03
 449  0033 ae0001        	ldw	x,#1
 450  0036 2001          	jra	L23
 451  0038               L03:
 452  0038 5f            	clrw	x
 453  0039               L23:
 454  0039 01            	rrwa	x,a
 455  003a 6b03          	ld	(OFST+0,sp),a
 456  003c 02            	rlwa	x,a
 457                     ; 151 	volatile u8 velocity = 0;
 459  003d 0f01          	clr	(OFST-2,sp)
 460                     ; 152 	button_state = GPIOC->IDR;
 462  003f 55500b0000    	mov	_button_state,20491
 463                     ; 153 	if (button_state != previous_button_state) {
 465  0044 b600          	ld	a,_button_state
 466  0046 b100          	cp	a,_previous_button_state
 467  0048 2604          	jrne	L43
 468  004a ace800e8      	jpf	L731
 469  004e               L43:
 470                     ; 154 		if (top_pressed && bottom_pressed) {
 472  004e 0d02          	tnz	(OFST-1,sp)
 473  0050 2602          	jrne	L63
 474  0052 207c          	jpf	L141
 475  0054               L63:
 477  0054 0d03          	tnz	(OFST+0,sp)
 478  0056 2602          	jrne	L04
 479  0058 2076          	jpf	L141
 480  005a               L04:
 481                     ; 156 			velocity = TIM4_GetCounter();
 483  005a cd0000        	call	_TIM4_GetCounter
 485  005d 6b01          	ld	(OFST-2,sp),a
 486                     ; 158 				I2C_SendPacket(0x45);
 488  005f a645          	ld	a,#69
 489  0061 cd0000        	call	_I2C_SendPacket
 491                     ; 159 				for(stopDelay = 900000; stopDelay > 0; stopDelay--){
 493  0064 aebba0        	ldw	x,#48032
 494  0067 bf00          	ldw	_stopDelay,x
 495  0069               L341:
 496                     ; 160 					nop(); nop(); nop(); nop(); nop();
 499  0069 9d            nop
 505  006a 9d            nop
 511  006b 9d            nop
 517  006c 9d            nop
 523  006d 9d            nop
 525                     ; 161 					nop(); nop(); nop(); nop(); nop();
 529  006e 9d            nop
 535  006f 9d            nop
 541  0070 9d            nop
 547  0071 9d            nop
 553  0072 9d            nop
 555                     ; 162 					nop(); nop(); nop(); nop(); nop();
 559  0073 9d            nop
 565  0074 9d            nop
 571  0075 9d            nop
 577  0076 9d            nop
 583  0077 9d            nop
 585                     ; 163 					nop(); nop(); nop(); nop(); nop();
 589  0078 9d            nop
 595  0079 9d            nop
 601  007a 9d            nop
 607  007b 9d            nop
 613  007c 9d            nop
 615                     ; 164 					nop(); nop(); nop(); nop(); nop();
 619  007d 9d            nop
 625  007e 9d            nop
 631  007f 9d            nop
 637  0080 9d            nop
 643  0081 9d            nop
 645                     ; 165 					nop(); nop(); nop(); nop(); nop();
 649  0082 9d            nop
 655  0083 9d            nop
 661  0084 9d            nop
 667  0085 9d            nop
 673  0086 9d            nop
 675                     ; 166 					nop(); nop(); nop(); nop(); nop();
 679  0087 9d            nop
 685  0088 9d            nop
 691  0089 9d            nop
 697  008a 9d            nop
 703  008b 9d            nop
 705                     ; 167 					nop(); nop(); nop(); nop(); nop();
 709  008c 9d            nop
 715  008d 9d            nop
 721  008e 9d            nop
 727  008f 9d            nop
 733  0090 9d            nop
 735                     ; 168 					nop(); nop(); nop(); nop(); nop();
 739  0091 9d            nop
 745  0092 9d            nop
 751  0093 9d            nop
 757  0094 9d            nop
 763  0095 9d            nop
 765                     ; 169 					nop(); nop(); nop(); nop(); nop();
 769  0096 9d            nop
 775  0097 9d            nop
 781  0098 9d            nop
 787  0099 9d            nop
 793  009a 9d            nop
 795                     ; 170 					nop(); nop(); nop(); nop(); nop();
 799  009b 9d            nop
 805  009c 9d            nop
 811  009d 9d            nop
 817  009e 9d            nop
 823  009f 9d            nop
 825                     ; 171 					nop(); nop(); nop(); nop(); nop();
 829  00a0 9d            nop
 835  00a1 9d            nop
 841  00a2 9d            nop
 847  00a3 9d            nop
 853  00a4 9d            nop
 855                     ; 172 					nop(); nop(); nop(); nop(); nop();
 859  00a5 9d            nop
 865  00a6 9d            nop
 871  00a7 9d            nop
 877  00a8 9d            nop
 883  00a9 9d            nop
 885                     ; 173 					nop(); nop(); nop(); nop(); nop();
 889  00aa 9d            nop
 895  00ab 9d            nop
 901  00ac 9d            nop
 907  00ad 9d            nop
 913  00ae 9d            nop
 915                     ; 174 					nop(); nop(); nop(); nop(); nop();
 919  00af 9d            nop
 925  00b0 9d            nop
 931  00b1 9d            nop
 937  00b2 9d            nop
 943  00b3 9d            nop
 945                     ; 175 					nop(); nop(); nop(); nop(); nop();
 949  00b4 9d            nop
 955  00b5 9d            nop
 961  00b6 9d            nop
 967  00b7 9d            nop
 973  00b8 9d            nop
 975                     ; 176 					nop(); nop(); nop(); nop(); nop();
 979  00b9 9d            nop
 985  00ba 9d            nop
 991  00bb 9d            nop
 997  00bc 9d            nop
1003  00bd 9d            nop
1005                     ; 177 					nop();
1009  00be 9d            nop
1011                     ; 159 				for(stopDelay = 900000; stopDelay > 0; stopDelay--){
1014  00bf be00          	ldw	x,_stopDelay
1015  00c1 1d0001        	subw	x,#1
1016  00c4 bf00          	ldw	_stopDelay,x
1019  00c6 be00          	ldw	x,_stopDelay
1020  00c8 2702          	jreq	L24
1021  00ca 209d          	jpf	L341
1022  00cc               L24:
1023                     ; 179 				I2C_SendPacket(0);
1025  00cc 4f            	clr	a
1026  00cd cd0000        	call	_I2C_SendPacket
1028  00d0               L141:
1029                     ; 182 		TIM4_Cmd(DISABLE);
1031  00d0 4f            	clr	a
1032  00d1 cd0000        	call	_TIM4_Cmd
1034                     ; 183 		TIM4_SetCounter(0);
1036  00d4 4f            	clr	a
1037  00d5 cd0000        	call	_TIM4_SetCounter
1039                     ; 186 		if (top_pressed && !bottom_pressed) {
1041  00d8 0d02          	tnz	(OFST-1,sp)
1042  00da 2709          	jreq	L151
1044  00dc 0d03          	tnz	(OFST+0,sp)
1045  00de 2605          	jrne	L151
1046                     ; 188 			TIM4_Cmd(ENABLE);
1048  00e0 a601          	ld	a,#1
1049  00e2 cd0000        	call	_TIM4_Cmd
1051  00e5               L151:
1052                     ; 190 		previous_button_state = button_state;
1054  00e5 450000        	mov	_previous_button_state,_button_state
1055  00e8               L731:
1056                     ; 192 }
1059  00e8 5b03          	addw	sp,#3
1060  00ea 85            	popw	x
1061  00eb bf00          	ldw	c_y,x
1062  00ed 320002        	pop	c_y+2
1063  00f0 85            	popw	x
1064  00f1 bf00          	ldw	c_x,x
1065  00f3 320002        	pop	c_x+2
1066  00f6 80            	iret
1089                     ; 199 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
1089                     ; 200 {
1090                     	switch	.text
1091  00f7               f_EXTI_PORTD_IRQHandler:
1095                     ; 204 }
1098  00f7 80            	iret
1121                     ; 211 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
1121                     ; 212 {
1122                     	switch	.text
1123  00f8               f_EXTI_PORTE_IRQHandler:
1127                     ; 216 }
1130  00f8 80            	iret
1152                     ; 263 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
1152                     ; 264 {
1153                     	switch	.text
1154  00f9               f_SPI_IRQHandler:
1158                     ; 268 }
1161  00f9 80            	iret
1184                     ; 275 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
1184                     ; 276 {
1185                     	switch	.text
1186  00fa               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
1190                     ; 280 }
1193  00fa 80            	iret
1216                     ; 287 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
1216                     ; 288 {
1217                     	switch	.text
1218  00fb               f_TIM1_CAP_COM_IRQHandler:
1222                     ; 292 }
1225  00fb 80            	iret
1248                     ; 325 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
1248                     ; 326 {
1249                     	switch	.text
1250  00fc               f_TIM2_UPD_OVF_BRK_IRQHandler:
1254                     ; 330 }
1257  00fc 80            	iret
1280                     ; 337 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
1280                     ; 338 {
1281                     	switch	.text
1282  00fd               f_TIM2_CAP_COM_IRQHandler:
1286                     ; 342 }
1289  00fd 80            	iret
1312                     ; 379 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
1312                     ; 380 {
1313                     	switch	.text
1314  00fe               f_UART1_TX_IRQHandler:
1318                     ; 384 }
1321  00fe 80            	iret
1344                     ; 391 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
1344                     ; 392 {
1345                     	switch	.text
1346  00ff               f_UART1_RX_IRQHandler:
1350                     ; 396 }
1353  00ff 80            	iret
1387                     ; 404 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
1387                     ; 405 {
1388                     	switch	.text
1389  0100               f_I2C_IRQHandler:
1391  0100 8a            	push	cc
1392  0101 84            	pop	a
1393  0102 a4bf          	and	a,#191
1394  0104 88            	push	a
1395  0105 86            	pop	cc
1396       00000002      OFST:	set	2
1397  0106 3b0002        	push	c_x+2
1398  0109 be00          	ldw	x,c_x
1399  010b 89            	pushw	x
1400  010c 3b0002        	push	c_y+2
1401  010f be00          	ldw	x,c_y
1402  0111 89            	pushw	x
1403  0112 89            	pushw	x
1406                     ; 411 	int x = 1 + 1;
1408  0113 ae0002        	ldw	x,#2
1409  0116 1f01          	ldw	(OFST-1,sp),x
1410                     ; 413 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_WAKEUPFROMHALT) == SET ) {
1412  0118 ae2220        	ldw	x,#8736
1413  011b cd0000        	call	_I2C_GetITStatus
1415  011e a101          	cp	a,#1
1416  0120 2607          	jrne	L103
1417                     ; 414   x = x + 1;
1419  0122 1e01          	ldw	x,(OFST-1,sp)
1420  0124 1c0001        	addw	x,#1
1421  0127 1f01          	ldw	(OFST-1,sp),x
1422  0129               L103:
1423                     ; 416 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_OVERRUNUNDERRUN) == SET ) {
1425  0129 ae2108        	ldw	x,#8456
1426  012c cd0000        	call	_I2C_GetITStatus
1428  012f a101          	cp	a,#1
1429  0131 2607          	jrne	L303
1430                     ; 417   x = x + 1;
1432  0133 1e01          	ldw	x,(OFST-1,sp)
1433  0135 1c0001        	addw	x,#1
1434  0138 1f01          	ldw	(OFST-1,sp),x
1435  013a               L303:
1436                     ; 419 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) == SET ) {
1438  013a ae2104        	ldw	x,#8452
1439  013d cd0000        	call	_I2C_GetITStatus
1441  0140 a101          	cp	a,#1
1442  0142 2607          	jrne	L503
1443                     ; 420   x = x + 1;
1445  0144 1e01          	ldw	x,(OFST-1,sp)
1446  0146 1c0001        	addw	x,#1
1447  0149 1f01          	ldw	(OFST-1,sp),x
1448  014b               L503:
1449                     ; 422 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ARBITRATIONLOSS ) == SET ) {
1451  014b ae2102        	ldw	x,#8450
1452  014e cd0000        	call	_I2C_GetITStatus
1454  0151 a101          	cp	a,#1
1455  0153 2607          	jrne	L703
1456                     ; 423   x = x + 1;
1458  0155 1e01          	ldw	x,(OFST-1,sp)
1459  0157 1c0001        	addw	x,#1
1460  015a 1f01          	ldw	(OFST-1,sp),x
1461  015c               L703:
1462                     ; 425 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_BUSERROR ) == SET ) {
1464  015c ae2101        	ldw	x,#8449
1465  015f cd0000        	call	_I2C_GetITStatus
1467  0162 a101          	cp	a,#1
1468  0164 2607          	jrne	L113
1469                     ; 426   x = x + 1;
1471  0166 1e01          	ldw	x,(OFST-1,sp)
1472  0168 1c0001        	addw	x,#1
1473  016b 1f01          	ldw	(OFST-1,sp),x
1474  016d               L113:
1475                     ; 428 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TXEMPTY ) == SET ) {
1477  016d ae1680        	ldw	x,#5760
1478  0170 cd0000        	call	_I2C_GetITStatus
1480  0173 a101          	cp	a,#1
1481  0175 2607          	jrne	L313
1482                     ; 429   x = x + 1;
1484  0177 1e01          	ldw	x,(OFST-1,sp)
1485  0179 1c0001        	addw	x,#1
1486  017c 1f01          	ldw	(OFST-1,sp),x
1487  017e               L313:
1488                     ; 431 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STOPDETECTION ) == SET ) {
1490  017e ae1210        	ldw	x,#4624
1491  0181 cd0000        	call	_I2C_GetITStatus
1493  0184 a101          	cp	a,#1
1494  0186 2607          	jrne	L513
1495                     ; 432   x = x + 1;
1497  0188 1e01          	ldw	x,(OFST-1,sp)
1498  018a 1c0001        	addw	x,#1
1499  018d 1f01          	ldw	(OFST-1,sp),x
1500  018f               L513:
1501                     ; 434 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_HEADERSENT ) == SET ) {
1503  018f ae1208        	ldw	x,#4616
1504  0192 cd0000        	call	_I2C_GetITStatus
1506  0195 a101          	cp	a,#1
1507  0197 2607          	jrne	L713
1508                     ; 435   x = x + 1;
1510  0199 1e01          	ldw	x,(OFST-1,sp)
1511  019b 1c0001        	addw	x,#1
1512  019e 1f01          	ldw	(OFST-1,sp),x
1513  01a0               L713:
1514                     ; 437 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_RXNOTEMPTY ) == SET ) {
1516  01a0 ae1640        	ldw	x,#5696
1517  01a3 cd0000        	call	_I2C_GetITStatus
1519  01a6 a101          	cp	a,#1
1520  01a8 2607          	jrne	L123
1521                     ; 438   x = x + 1;
1523  01aa 1e01          	ldw	x,(OFST-1,sp)
1524  01ac 1c0001        	addw	x,#1
1525  01af 1f01          	ldw	(OFST-1,sp),x
1526  01b1               L123:
1527                     ; 440 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TRANSFERFINISHED ) == SET ) {
1529  01b1 ae1204        	ldw	x,#4612
1530  01b4 cd0000        	call	_I2C_GetITStatus
1532  01b7 a101          	cp	a,#1
1533  01b9 2607          	jrne	L323
1534                     ; 441   x = x + 1;
1536  01bb 1e01          	ldw	x,(OFST-1,sp)
1537  01bd 1c0001        	addw	x,#1
1538  01c0 1f01          	ldw	(OFST-1,sp),x
1539  01c2               L323:
1540                     ; 443 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ADDRESSSENTMATCHED ) == SET ) {
1542  01c2 ae1202        	ldw	x,#4610
1543  01c5 cd0000        	call	_I2C_GetITStatus
1545  01c8 a101          	cp	a,#1
1546  01ca 2607          	jrne	L523
1547                     ; 444   x = x + 1;
1549  01cc 1e01          	ldw	x,(OFST-1,sp)
1550  01ce 1c0001        	addw	x,#1
1551  01d1 1f01          	ldw	(OFST-1,sp),x
1552  01d3               L523:
1553                     ; 446 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STARTDETECTION ) == SET ) {
1555  01d3 ae1201        	ldw	x,#4609
1556  01d6 cd0000        	call	_I2C_GetITStatus
1558  01d9 a101          	cp	a,#1
1559  01db 2607          	jrne	L723
1560                     ; 447   x = x + 1;
1562  01dd 1e01          	ldw	x,(OFST-1,sp)
1563  01df 1c0001        	addw	x,#1
1564  01e2 1f01          	ldw	(OFST-1,sp),x
1565  01e4               L723:
1566                     ; 449 }
1569  01e4 5b02          	addw	sp,#2
1570  01e6 85            	popw	x
1571  01e7 bf00          	ldw	c_y,x
1572  01e9 320002        	pop	c_y+2
1573  01ec 85            	popw	x
1574  01ed bf00          	ldw	c_x,x
1575  01ef 320002        	pop	c_x+2
1576  01f2 80            	iret
1598                     ; 523 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1598                     ; 524 {
1599                     	switch	.text
1600  01f3               f_ADC1_IRQHandler:
1604                     ; 528 }
1607  01f3 80            	iret
1632                     ; 549 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1632                     ; 550 {
1633                     	switch	.text
1634  01f4               f_TIM4_UPD_OVF_IRQHandler:
1636  01f4 8a            	push	cc
1637  01f5 84            	pop	a
1638  01f6 a4bf          	and	a,#191
1639  01f8 88            	push	a
1640  01f9 86            	pop	cc
1641  01fa 3b0002        	push	c_x+2
1642  01fd be00          	ldw	x,c_x
1643  01ff 89            	pushw	x
1644  0200 3b0002        	push	c_y+2
1645  0203 be00          	ldw	x,c_y
1646  0205 89            	pushw	x
1649                     ; 554   Counter++;
1651  0206 3c00          	inc	_Counter
1652                     ; 555   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1654  0208 a601          	ld	a,#1
1655  020a cd0000        	call	_TIM4_ClearITPendingBit
1657                     ; 557 }
1660  020d 85            	popw	x
1661  020e bf00          	ldw	c_y,x
1662  0210 320002        	pop	c_y+2
1663  0213 85            	popw	x
1664  0214 bf00          	ldw	c_x,x
1665  0216 320002        	pop	c_x+2
1666  0219 80            	iret
1689                     ; 565 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1689                     ; 566 {
1690                     	switch	.text
1691  021a               f_EEPROM_EEC_IRQHandler:
1695                     ; 570 }
1698  021a 80            	iret
1721                     	xref	_I2C_SendPacket
1722                     	xdef	_stopDelay
1723                     	xref.b	_Counter
1724                     	xref.b	_previous_button_state
1725                     	xref.b	_button_state
1726                     	xdef	f_EEPROM_EEC_IRQHandler
1727                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1728                     	xdef	f_ADC1_IRQHandler
1729                     	xdef	f_I2C_IRQHandler
1730                     	xdef	f_UART1_RX_IRQHandler
1731                     	xdef	f_UART1_TX_IRQHandler
1732                     	xdef	f_TIM2_CAP_COM_IRQHandler
1733                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1734                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1735                     	xdef	f_TIM1_CAP_COM_IRQHandler
1736                     	xdef	f_SPI_IRQHandler
1737                     	xdef	f_EXTI_PORTE_IRQHandler
1738                     	xdef	f_EXTI_PORTD_IRQHandler
1739                     	xdef	f_EXTI_PORTC_IRQHandler
1740                     	xdef	f_EXTI_PORTB_IRQHandler
1741                     	xdef	f_EXTI_PORTA_IRQHandler
1742                     	xdef	f_CLK_IRQHandler
1743                     	xdef	f_AWU_IRQHandler
1744                     	xdef	f_TLI_IRQHandler
1745                     	xdef	f_TRAP_IRQHandler
1746                     	xdef	f_NonHandledInterrupt
1747                     	xref	_TIM4_ClearITPendingBit
1748                     	xref	_TIM4_GetCounter
1749                     	xref	_TIM4_SetCounter
1750                     	xref	_TIM4_Cmd
1751                     	xref	_I2C_GetITStatus
1752                     	xref.b	c_x
1753                     	xref.b	c_y
1772                     	end
