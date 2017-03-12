   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _stopDelay:
  18  0000 0000          	dc.w	0
  48                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  48                     ; 60 {
  49                     	switch	.text
  50  0000               f_NonHandledInterrupt:
  54                     ; 64 }
  57  0000 80            	iret
  79                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  79                     ; 73 {
  80                     	switch	.text
  81  0001               f_TRAP_IRQHandler:
  85                     ; 77 }
  88  0001 80            	iret
 110                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 110                     ; 85 
 110                     ; 86 {
 111                     	switch	.text
 112  0002               f_TLI_IRQHandler:
 116                     ; 90 }
 119  0002 80            	iret
 141                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 141                     ; 98 {
 142                     	switch	.text
 143  0003               f_AWU_IRQHandler:
 147                     ; 102 }
 150  0003 80            	iret
 172                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 172                     ; 110 {
 173                     	switch	.text
 174  0004               f_CLK_IRQHandler:
 178                     ; 114 }
 181  0004 80            	iret
 204                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 204                     ; 122 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTA_IRQHandler:
 210                     ; 126 }
 213  0005 80            	iret
 236                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 236                     ; 134 {
 237                     	switch	.text
 238  0006               f_EXTI_PORTB_IRQHandler:
 242                     ; 138 }
 245  0006 80            	iret
 412                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 412                     ; 146 {
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
 431                     ; 150 	const bool top_pressed = (GPIOC->IDR & TOP_BUTTON) == 0;
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
 444                     ; 151 	const bool bottom_pressed = (GPIOC->IDR & BOTTOM_BUTTON) == 0;
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
 457                     ; 152 	volatile u8 velocity = 0;
 459  003d 0f01          	clr	(OFST-2,sp)
 460                     ; 153 	button_state = GPIOC->IDR;
 462  003f 55500b0000    	mov	_button_state,20491
 463                     ; 154 	if (button_state != previous_button_state) {
 465  0044 b600          	ld	a,_button_state
 466  0046 b100          	cp	a,_previous_button_state
 467  0048 2604          	jrne	L43
 468  004a ace800e8      	jpf	L731
 469  004e               L43:
 470                     ; 155 		if (top_pressed && bottom_pressed) {
 472  004e 0d02          	tnz	(OFST-1,sp)
 473  0050 2602          	jrne	L63
 474  0052 207c          	jpf	L141
 475  0054               L63:
 477  0054 0d03          	tnz	(OFST+0,sp)
 478  0056 2602          	jrne	L04
 479  0058 2076          	jpf	L141
 480  005a               L04:
 481                     ; 157 			velocity = TIM4_GetCounter();
 483  005a cd0000        	call	_TIM4_GetCounter
 485  005d 6b01          	ld	(OFST-2,sp),a
 486                     ; 159 				I2C_SendPacket(0x45);
 488  005f a645          	ld	a,#69
 489  0061 cd0000        	call	_I2C_SendPacket
 491                     ; 160 				for(stopDelay = 900000; stopDelay > 0; stopDelay--){
 493  0064 aebba0        	ldw	x,#48032
 494  0067 bf00          	ldw	_stopDelay,x
 495  0069               L341:
 496                     ; 161 					nop(); nop(); nop(); nop(); nop();
 499  0069 9d            nop
 505  006a 9d            nop
 511  006b 9d            nop
 517  006c 9d            nop
 523  006d 9d            nop
 525                     ; 162 					nop(); nop(); nop(); nop(); nop();
 529  006e 9d            nop
 535  006f 9d            nop
 541  0070 9d            nop
 547  0071 9d            nop
 553  0072 9d            nop
 555                     ; 163 					nop(); nop(); nop(); nop(); nop();
 559  0073 9d            nop
 565  0074 9d            nop
 571  0075 9d            nop
 577  0076 9d            nop
 583  0077 9d            nop
 585                     ; 164 					nop(); nop(); nop(); nop(); nop();
 589  0078 9d            nop
 595  0079 9d            nop
 601  007a 9d            nop
 607  007b 9d            nop
 613  007c 9d            nop
 615                     ; 165 					nop(); nop(); nop(); nop(); nop();
 619  007d 9d            nop
 625  007e 9d            nop
 631  007f 9d            nop
 637  0080 9d            nop
 643  0081 9d            nop
 645                     ; 166 					nop(); nop(); nop(); nop(); nop();
 649  0082 9d            nop
 655  0083 9d            nop
 661  0084 9d            nop
 667  0085 9d            nop
 673  0086 9d            nop
 675                     ; 167 					nop(); nop(); nop(); nop(); nop();
 679  0087 9d            nop
 685  0088 9d            nop
 691  0089 9d            nop
 697  008a 9d            nop
 703  008b 9d            nop
 705                     ; 168 					nop(); nop(); nop(); nop(); nop();
 709  008c 9d            nop
 715  008d 9d            nop
 721  008e 9d            nop
 727  008f 9d            nop
 733  0090 9d            nop
 735                     ; 169 					nop(); nop(); nop(); nop(); nop();
 739  0091 9d            nop
 745  0092 9d            nop
 751  0093 9d            nop
 757  0094 9d            nop
 763  0095 9d            nop
 765                     ; 170 					nop(); nop(); nop(); nop(); nop();
 769  0096 9d            nop
 775  0097 9d            nop
 781  0098 9d            nop
 787  0099 9d            nop
 793  009a 9d            nop
 795                     ; 171 					nop(); nop(); nop(); nop(); nop();
 799  009b 9d            nop
 805  009c 9d            nop
 811  009d 9d            nop
 817  009e 9d            nop
 823  009f 9d            nop
 825                     ; 172 					nop(); nop(); nop(); nop(); nop();
 829  00a0 9d            nop
 835  00a1 9d            nop
 841  00a2 9d            nop
 847  00a3 9d            nop
 853  00a4 9d            nop
 855                     ; 173 					nop(); nop(); nop(); nop(); nop();
 859  00a5 9d            nop
 865  00a6 9d            nop
 871  00a7 9d            nop
 877  00a8 9d            nop
 883  00a9 9d            nop
 885                     ; 174 					nop(); nop(); nop(); nop(); nop();
 889  00aa 9d            nop
 895  00ab 9d            nop
 901  00ac 9d            nop
 907  00ad 9d            nop
 913  00ae 9d            nop
 915                     ; 175 					nop(); nop(); nop(); nop(); nop();
 919  00af 9d            nop
 925  00b0 9d            nop
 931  00b1 9d            nop
 937  00b2 9d            nop
 943  00b3 9d            nop
 945                     ; 176 					nop(); nop(); nop(); nop(); nop();
 949  00b4 9d            nop
 955  00b5 9d            nop
 961  00b6 9d            nop
 967  00b7 9d            nop
 973  00b8 9d            nop
 975                     ; 177 					nop(); nop(); nop(); nop(); nop();
 979  00b9 9d            nop
 985  00ba 9d            nop
 991  00bb 9d            nop
 997  00bc 9d            nop
1003  00bd 9d            nop
1005                     ; 178 					nop();
1009  00be 9d            nop
1011                     ; 160 				for(stopDelay = 900000; stopDelay > 0; stopDelay--){
1014  00bf be00          	ldw	x,_stopDelay
1015  00c1 1d0001        	subw	x,#1
1016  00c4 bf00          	ldw	_stopDelay,x
1019  00c6 be00          	ldw	x,_stopDelay
1020  00c8 2702          	jreq	L24
1021  00ca 209d          	jpf	L341
1022  00cc               L24:
1023                     ; 180 				I2C_SendPacket(0);
1025  00cc 4f            	clr	a
1026  00cd cd0000        	call	_I2C_SendPacket
1028  00d0               L141:
1029                     ; 183 		TIM4_Cmd(DISABLE);
1031  00d0 4f            	clr	a
1032  00d1 cd0000        	call	_TIM4_Cmd
1034                     ; 184 		TIM4_SetCounter(0);
1036  00d4 4f            	clr	a
1037  00d5 cd0000        	call	_TIM4_SetCounter
1039                     ; 187 		if (top_pressed && !bottom_pressed) {
1041  00d8 0d02          	tnz	(OFST-1,sp)
1042  00da 2709          	jreq	L151
1044  00dc 0d03          	tnz	(OFST+0,sp)
1045  00de 2605          	jrne	L151
1046                     ; 189 			TIM4_Cmd(ENABLE);
1048  00e0 a601          	ld	a,#1
1049  00e2 cd0000        	call	_TIM4_Cmd
1051  00e5               L151:
1052                     ; 191 		previous_button_state = button_state;
1054  00e5 450000        	mov	_previous_button_state,_button_state
1055  00e8               L731:
1056                     ; 193 }
1059  00e8 5b03          	addw	sp,#3
1060  00ea 85            	popw	x
1061  00eb bf00          	ldw	c_y,x
1062  00ed 320002        	pop	c_y+2
1063  00f0 85            	popw	x
1064  00f1 bf00          	ldw	c_x,x
1065  00f3 320002        	pop	c_x+2
1066  00f6 80            	iret
1089                     ; 200 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
1089                     ; 201 {
1090                     	switch	.text
1091  00f7               f_EXTI_PORTD_IRQHandler:
1095                     ; 205 }
1098  00f7 80            	iret
1121                     ; 212 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
1121                     ; 213 {
1122                     	switch	.text
1123  00f8               f_EXTI_PORTE_IRQHandler:
1127                     ; 217 }
1130  00f8 80            	iret
1152                     ; 264 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
1152                     ; 265 {
1153                     	switch	.text
1154  00f9               f_SPI_IRQHandler:
1158                     ; 269 }
1161  00f9 80            	iret
1184                     ; 276 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
1184                     ; 277 {
1185                     	switch	.text
1186  00fa               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
1190                     ; 281 }
1193  00fa 80            	iret
1216                     ; 288 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
1216                     ; 289 {
1217                     	switch	.text
1218  00fb               f_TIM1_CAP_COM_IRQHandler:
1222                     ; 293 }
1225  00fb 80            	iret
1248                     ; 326 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
1248                     ; 327 {
1249                     	switch	.text
1250  00fc               f_TIM2_UPD_OVF_BRK_IRQHandler:
1254                     ; 331 }
1257  00fc 80            	iret
1280                     ; 338 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
1280                     ; 339 {
1281                     	switch	.text
1282  00fd               f_TIM2_CAP_COM_IRQHandler:
1286                     ; 343 }
1289  00fd 80            	iret
1312                     ; 380 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
1312                     ; 381 {
1313                     	switch	.text
1314  00fe               f_UART1_TX_IRQHandler:
1318                     ; 385 }
1321  00fe 80            	iret
1344                     ; 392 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
1344                     ; 393 {
1345                     	switch	.text
1346  00ff               f_UART1_RX_IRQHandler:
1350                     ; 397 }
1353  00ff 80            	iret
1388                     ; 405 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
1388                     ; 406 {
1389                     	switch	.text
1390  0100               f_I2C_IRQHandler:
1392  0100 8a            	push	cc
1393  0101 84            	pop	a
1394  0102 a4bf          	and	a,#191
1395  0104 88            	push	a
1396  0105 86            	pop	cc
1397       00000002      OFST:	set	2
1398  0106 3b0002        	push	c_x+2
1399  0109 be00          	ldw	x,c_x
1400  010b 89            	pushw	x
1401  010c 3b0002        	push	c_y+2
1402  010f be00          	ldw	x,c_y
1403  0111 89            	pushw	x
1404  0112 89            	pushw	x
1407                     ; 412 	int x = 1 + 1;
1409  0113 ae0002        	ldw	x,#2
1410  0116 1f01          	ldw	(OFST-1,sp),x
1411                     ; 414 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_WAKEUPFROMHALT) == SET ) {
1413  0118 ae2220        	ldw	x,#8736
1414  011b cd0000        	call	_I2C_GetITStatus
1416  011e a101          	cp	a,#1
1417  0120 2607          	jrne	L103
1418                     ; 415 		x = x + 1;
1420  0122 1e01          	ldw	x,(OFST-1,sp)
1421  0124 1c0001        	addw	x,#1
1422  0127 1f01          	ldw	(OFST-1,sp),x
1423  0129               L103:
1424                     ; 417 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_OVERRUNUNDERRUN) == SET ) {
1426  0129 ae2108        	ldw	x,#8456
1427  012c cd0000        	call	_I2C_GetITStatus
1429  012f a101          	cp	a,#1
1430  0131 2607          	jrne	L303
1431                     ; 418 		x = x + 1;
1433  0133 1e01          	ldw	x,(OFST-1,sp)
1434  0135 1c0001        	addw	x,#1
1435  0138 1f01          	ldw	(OFST-1,sp),x
1436  013a               L303:
1437                     ; 420 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) == SET ) {
1439  013a ae2104        	ldw	x,#8452
1440  013d cd0000        	call	_I2C_GetITStatus
1442  0140 a101          	cp	a,#1
1443  0142 2607          	jrne	L503
1444                     ; 421 		x = x + 1;
1446  0144 1e01          	ldw	x,(OFST-1,sp)
1447  0146 1c0001        	addw	x,#1
1448  0149 1f01          	ldw	(OFST-1,sp),x
1449  014b               L503:
1450                     ; 423 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ARBITRATIONLOSS ) == SET ) {
1452  014b ae2102        	ldw	x,#8450
1453  014e cd0000        	call	_I2C_GetITStatus
1455  0151 a101          	cp	a,#1
1456  0153 2607          	jrne	L703
1457                     ; 424 		x = x + 1;
1459  0155 1e01          	ldw	x,(OFST-1,sp)
1460  0157 1c0001        	addw	x,#1
1461  015a 1f01          	ldw	(OFST-1,sp),x
1462  015c               L703:
1463                     ; 426 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_BUSERROR ) == SET ) {
1465  015c ae2101        	ldw	x,#8449
1466  015f cd0000        	call	_I2C_GetITStatus
1468  0162 a101          	cp	a,#1
1469  0164 2607          	jrne	L113
1470                     ; 427 		x = x + 1;
1472  0166 1e01          	ldw	x,(OFST-1,sp)
1473  0168 1c0001        	addw	x,#1
1474  016b 1f01          	ldw	(OFST-1,sp),x
1475  016d               L113:
1476                     ; 429 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TXEMPTY ) == SET ) {
1478  016d ae1680        	ldw	x,#5760
1479  0170 cd0000        	call	_I2C_GetITStatus
1481  0173 a101          	cp	a,#1
1482  0175 2607          	jrne	L313
1483                     ; 430 		x = x + 1;
1485  0177 1e01          	ldw	x,(OFST-1,sp)
1486  0179 1c0001        	addw	x,#1
1487  017c 1f01          	ldw	(OFST-1,sp),x
1488  017e               L313:
1489                     ; 432 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STOPDETECTION ) == SET ) {
1491  017e ae1210        	ldw	x,#4624
1492  0181 cd0000        	call	_I2C_GetITStatus
1494  0184 a101          	cp	a,#1
1495  0186 2607          	jrne	L513
1496                     ; 433 		x = x + 1;
1498  0188 1e01          	ldw	x,(OFST-1,sp)
1499  018a 1c0001        	addw	x,#1
1500  018d 1f01          	ldw	(OFST-1,sp),x
1501  018f               L513:
1502                     ; 435 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_HEADERSENT ) == SET ) {
1504  018f ae1208        	ldw	x,#4616
1505  0192 cd0000        	call	_I2C_GetITStatus
1507  0195 a101          	cp	a,#1
1508  0197 2607          	jrne	L713
1509                     ; 436 		x = x + 1;
1511  0199 1e01          	ldw	x,(OFST-1,sp)
1512  019b 1c0001        	addw	x,#1
1513  019e 1f01          	ldw	(OFST-1,sp),x
1514  01a0               L713:
1515                     ; 438 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_RXNOTEMPTY ) == SET ) {
1517  01a0 ae1640        	ldw	x,#5696
1518  01a3 cd0000        	call	_I2C_GetITStatus
1520  01a6 a101          	cp	a,#1
1521  01a8 2607          	jrne	L123
1522                     ; 439 		x = x + 1;
1524  01aa 1e01          	ldw	x,(OFST-1,sp)
1525  01ac 1c0001        	addw	x,#1
1526  01af 1f01          	ldw	(OFST-1,sp),x
1527  01b1               L123:
1528                     ; 441 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TRANSFERFINISHED ) == SET ) {
1530  01b1 ae1204        	ldw	x,#4612
1531  01b4 cd0000        	call	_I2C_GetITStatus
1533  01b7 a101          	cp	a,#1
1534  01b9 2607          	jrne	L323
1535                     ; 442 		x = x + 1;
1537  01bb 1e01          	ldw	x,(OFST-1,sp)
1538  01bd 1c0001        	addw	x,#1
1539  01c0 1f01          	ldw	(OFST-1,sp),x
1540  01c2               L323:
1541                     ; 444 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ADDRESSSENTMATCHED ) == SET ) {
1543  01c2 ae1202        	ldw	x,#4610
1544  01c5 cd0000        	call	_I2C_GetITStatus
1546  01c8 a101          	cp	a,#1
1547  01ca 2607          	jrne	L523
1548                     ; 445 		x = x + 1;
1550  01cc 1e01          	ldw	x,(OFST-1,sp)
1551  01ce 1c0001        	addw	x,#1
1552  01d1 1f01          	ldw	(OFST-1,sp),x
1553  01d3               L523:
1554                     ; 447 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STARTDETECTION ) == SET ) {
1556  01d3 ae1201        	ldw	x,#4609
1557  01d6 cd0000        	call	_I2C_GetITStatus
1559  01d9 a101          	cp	a,#1
1560  01db 2607          	jrne	L723
1561                     ; 448 		x = x + 1;
1563  01dd 1e01          	ldw	x,(OFST-1,sp)
1564  01df 1c0001        	addw	x,#1
1565  01e2 1f01          	ldw	(OFST-1,sp),x
1566  01e4               L723:
1567                     ; 451 	if ( I2C_CheckEvent(I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED)== SUCCESS ){
1569  01e4 ae0202        	ldw	x,#514
1570  01e7 cd0000        	call	_I2C_CheckEvent
1572  01ea a101          	cp	a,#1
1573                     ; 455 }
1576  01ec 5b02          	addw	sp,#2
1577  01ee 85            	popw	x
1578  01ef bf00          	ldw	c_y,x
1579  01f1 320002        	pop	c_y+2
1580  01f4 85            	popw	x
1581  01f5 bf00          	ldw	c_x,x
1582  01f7 320002        	pop	c_x+2
1583  01fa 80            	iret
1605                     ; 529 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1605                     ; 530 {
1606                     	switch	.text
1607  01fb               f_ADC1_IRQHandler:
1611                     ; 534 }
1614  01fb 80            	iret
1639                     ; 555 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1639                     ; 556 {
1640                     	switch	.text
1641  01fc               f_TIM4_UPD_OVF_IRQHandler:
1643  01fc 8a            	push	cc
1644  01fd 84            	pop	a
1645  01fe a4bf          	and	a,#191
1646  0200 88            	push	a
1647  0201 86            	pop	cc
1648  0202 3b0002        	push	c_x+2
1649  0205 be00          	ldw	x,c_x
1650  0207 89            	pushw	x
1651  0208 3b0002        	push	c_y+2
1652  020b be00          	ldw	x,c_y
1653  020d 89            	pushw	x
1656                     ; 560   Counter++;
1658  020e 3c00          	inc	_Counter
1659                     ; 561   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1661  0210 a601          	ld	a,#1
1662  0212 cd0000        	call	_TIM4_ClearITPendingBit
1664                     ; 563 }
1667  0215 85            	popw	x
1668  0216 bf00          	ldw	c_y,x
1669  0218 320002        	pop	c_y+2
1670  021b 85            	popw	x
1671  021c bf00          	ldw	c_x,x
1672  021e 320002        	pop	c_x+2
1673  0221 80            	iret
1696                     ; 571 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1696                     ; 572 {
1697                     	switch	.text
1698  0222               f_EEPROM_EEC_IRQHandler:
1702                     ; 576 }
1705  0222 80            	iret
1728                     	xref	_I2C_SendPacket
1729                     	xdef	_stopDelay
1730                     	xref.b	_Counter
1731                     	xref.b	_previous_button_state
1732                     	xref.b	_button_state
1733                     	xdef	f_EEPROM_EEC_IRQHandler
1734                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1735                     	xdef	f_ADC1_IRQHandler
1736                     	xdef	f_I2C_IRQHandler
1737                     	xdef	f_UART1_RX_IRQHandler
1738                     	xdef	f_UART1_TX_IRQHandler
1739                     	xdef	f_TIM2_CAP_COM_IRQHandler
1740                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1741                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1742                     	xdef	f_TIM1_CAP_COM_IRQHandler
1743                     	xdef	f_SPI_IRQHandler
1744                     	xdef	f_EXTI_PORTE_IRQHandler
1745                     	xdef	f_EXTI_PORTD_IRQHandler
1746                     	xdef	f_EXTI_PORTC_IRQHandler
1747                     	xdef	f_EXTI_PORTB_IRQHandler
1748                     	xdef	f_EXTI_PORTA_IRQHandler
1749                     	xdef	f_CLK_IRQHandler
1750                     	xdef	f_AWU_IRQHandler
1751                     	xdef	f_TLI_IRQHandler
1752                     	xdef	f_TRAP_IRQHandler
1753                     	xdef	f_NonHandledInterrupt
1754                     	xref	_TIM4_ClearITPendingBit
1755                     	xref	_TIM4_GetCounter
1756                     	xref	_TIM4_SetCounter
1757                     	xref	_TIM4_Cmd
1758                     	xref	_I2C_GetITStatus
1759                     	xref	_I2C_CheckEvent
1760                     	xref.b	c_x
1761                     	xref.b	c_y
1780                     	end
