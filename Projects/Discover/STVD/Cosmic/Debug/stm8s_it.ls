   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _Counter:
  18  0000 0000          	dc.w	0
  19  0002               _stopDelay:
  20  0002 0000          	dc.w	0
  50                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 60 {
  51                     	switch	.text
  52  0000               f_NonHandledInterrupt:
  56                     ; 64 }
  59  0000 80            	iret
  81                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 73 {
  82                     	switch	.text
  83  0001               f_TRAP_IRQHandler:
  87                     ; 77 }
  90  0001 80            	iret
 112                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 85 
 112                     ; 86 {
 113                     	switch	.text
 114  0002               f_TLI_IRQHandler:
 118                     ; 90 }
 121  0002 80            	iret
 143                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 98 {
 144                     	switch	.text
 145  0003               f_AWU_IRQHandler:
 149                     ; 102 }
 152  0003 80            	iret
 174                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 110 {
 175                     	switch	.text
 176  0004               f_CLK_IRQHandler:
 180                     ; 114 }
 183  0004 80            	iret
 206                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 122 {
 207                     	switch	.text
 208  0005               f_EXTI_PORTA_IRQHandler:
 212                     ; 126 }
 215  0005 80            	iret
 238                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 238                     ; 134 {
 239                     	switch	.text
 240  0006               f_EXTI_PORTB_IRQHandler:
 244                     ; 138 }
 247  0006 80            	iret
 327                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 327                     ; 146 {
 328                     	switch	.text
 329  0007               f_EXTI_PORTC_IRQHandler:
 331  0007 8a            	push	cc
 332  0008 84            	pop	a
 333  0009 a4bf          	and	a,#191
 334  000b 88            	push	a
 335  000c 86            	pop	cc
 336       00000003      OFST:	set	3
 337  000d 3b0002        	push	c_x+2
 338  0010 be00          	ldw	x,c_x
 339  0012 89            	pushw	x
 340  0013 3b0002        	push	c_y+2
 341  0016 be00          	ldw	x,c_y
 342  0018 89            	pushw	x
 343  0019 5203          	subw	sp,#3
 346                     ; 150 	const bool top_pressed = (GPIOC->IDR & TOP_BUTTON) == 0;
 348  001b c6500b        	ld	a,20491
 349  001e a520          	bcp	a,#32
 350  0020 2605          	jrne	L42
 351  0022 ae0001        	ldw	x,#1
 352  0025 2001          	jra	L62
 353  0027               L42:
 354  0027 5f            	clrw	x
 355  0028               L62:
 356  0028 01            	rrwa	x,a
 357  0029 6b02          	ld	(OFST-1,sp),a
 358  002b 02            	rlwa	x,a
 359                     ; 151 	const bool bottom_pressed = (GPIOC->IDR & BOTTOM_BUTTON) == 0;
 361  002c c6500b        	ld	a,20491
 362  002f a508          	bcp	a,#8
 363  0031 2605          	jrne	L03
 364  0033 ae0001        	ldw	x,#1
 365  0036 2001          	jra	L23
 366  0038               L03:
 367  0038 5f            	clrw	x
 368  0039               L23:
 369  0039 01            	rrwa	x,a
 370  003a 6b03          	ld	(OFST+0,sp),a
 371  003c 02            	rlwa	x,a
 372                     ; 152 	button_state = GPIOC->IDR;
 374  003d 55500b0000    	mov	_button_state,20491
 375                     ; 153 	if (button_state != previous_button_state) {
 377  0042 b600          	ld	a,_button_state
 378  0044 b100          	cp	a,_previous_button_state
 379  0046 2745          	jreq	L731
 380                     ; 154 		if (top_pressed && bottom_pressed) {
 382  0048 0d02          	tnz	(OFST-1,sp)
 383  004a 2727          	jreq	L141
 385  004c 0d03          	tnz	(OFST+0,sp)
 386  004e 2723          	jreq	L141
 387                     ; 156 			const u8 velocity = Counter*2 > 127 ? 127 : (u8)(Counter * 2);
 389  0050 be00          	ldw	x,_Counter
 390  0052 58            	sllw	x
 391  0053 a30080        	cpw	x,#128
 392  0056 2504          	jrult	L43
 393  0058 a67f          	ld	a,#127
 394  005a 2003          	jra	L63
 395  005c               L43:
 396  005c b601          	ld	a,_Counter+1
 397  005e 48            	sll	a
 398  005f               L63:
 399  005f 6b01          	ld	(OFST-2,sp),a
 400                     ; 157 			I2C_SendPacket(velocity);
 402  0061 7b01          	ld	a,(OFST-2,sp)
 403  0063 cd0000        	call	_I2C_SendPacket
 405                     ; 178 			note_playing = TRUE;
 407  0066 35010000      	mov	_note_playing,#1
 408                     ; 180 			TIM4_Cmd(DISABLE);
 410  006a 4f            	clr	a
 411  006b cd0000        	call	_TIM4_Cmd
 413                     ; 181 			Counter = 0;
 415  006e 5f            	clrw	x
 416  006f bf00          	ldw	_Counter,x
 418  0071 200a          	jra	L341
 419  0073               L141:
 420                     ; 182 	  } else if (note_playing) {
 422  0073 3d00          	tnz	_note_playing
 423  0075 2706          	jreq	L341
 424                     ; 183 			I2C_SendPacket(0);
 426  0077 4f            	clr	a
 427  0078 cd0000        	call	_I2C_SendPacket
 429                     ; 184 			note_playing = FALSE;
 431  007b 3f00          	clr	_note_playing
 432  007d               L341:
 433                     ; 189 		if (top_pressed && !bottom_pressed) {
 435  007d 0d02          	tnz	(OFST-1,sp)
 436  007f 2709          	jreq	L741
 438  0081 0d03          	tnz	(OFST+0,sp)
 439  0083 2605          	jrne	L741
 440                     ; 191 			TIM4_Cmd(ENABLE);
 442  0085 a601          	ld	a,#1
 443  0087 cd0000        	call	_TIM4_Cmd
 445  008a               L741:
 446                     ; 193 		previous_button_state = button_state;
 448  008a 450000        	mov	_previous_button_state,_button_state
 449  008d               L731:
 450                     ; 195 }
 453  008d 5b03          	addw	sp,#3
 454  008f 85            	popw	x
 455  0090 bf00          	ldw	c_y,x
 456  0092 320002        	pop	c_y+2
 457  0095 85            	popw	x
 458  0096 bf00          	ldw	c_x,x
 459  0098 320002        	pop	c_x+2
 460  009b 80            	iret
 483                     ; 202 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 483                     ; 203 {
 484                     	switch	.text
 485  009c               f_EXTI_PORTD_IRQHandler:
 489                     ; 207 }
 492  009c 80            	iret
 515                     ; 214 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 515                     ; 215 {
 516                     	switch	.text
 517  009d               f_EXTI_PORTE_IRQHandler:
 521                     ; 219 }
 524  009d 80            	iret
 546                     ; 266 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 546                     ; 267 {
 547                     	switch	.text
 548  009e               f_SPI_IRQHandler:
 552                     ; 271 }
 555  009e 80            	iret
 578                     ; 278 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 578                     ; 279 {
 579                     	switch	.text
 580  009f               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 584                     ; 283 }
 587  009f 80            	iret
 610                     ; 290 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 610                     ; 291 {
 611                     	switch	.text
 612  00a0               f_TIM1_CAP_COM_IRQHandler:
 616                     ; 295 }
 619  00a0 80            	iret
 642                     ; 328 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 642                     ; 329 {
 643                     	switch	.text
 644  00a1               f_TIM2_UPD_OVF_BRK_IRQHandler:
 648                     ; 333 }
 651  00a1 80            	iret
 674                     ; 340 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 674                     ; 341 {
 675                     	switch	.text
 676  00a2               f_TIM2_CAP_COM_IRQHandler:
 680                     ; 345 }
 683  00a2 80            	iret
 706                     ; 382 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 706                     ; 383 {
 707                     	switch	.text
 708  00a3               f_UART1_TX_IRQHandler:
 712                     ; 387 }
 715  00a3 80            	iret
 738                     ; 394 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 738                     ; 395 {
 739                     	switch	.text
 740  00a4               f_UART1_RX_IRQHandler:
 744                     ; 399 }
 747  00a4 80            	iret
 782                     ; 407 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 782                     ; 408 {
 783                     	switch	.text
 784  00a5               f_I2C_IRQHandler:
 786  00a5 8a            	push	cc
 787  00a6 84            	pop	a
 788  00a7 a4bf          	and	a,#191
 789  00a9 88            	push	a
 790  00aa 86            	pop	cc
 791       00000002      OFST:	set	2
 792  00ab 3b0002        	push	c_x+2
 793  00ae be00          	ldw	x,c_x
 794  00b0 89            	pushw	x
 795  00b1 3b0002        	push	c_y+2
 796  00b4 be00          	ldw	x,c_y
 797  00b6 89            	pushw	x
 798  00b7 89            	pushw	x
 801                     ; 414 	int x = 1 + 1;
 803  00b8 ae0002        	ldw	x,#2
 804  00bb 1f01          	ldw	(OFST-1,sp),x
 805                     ; 416 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_WAKEUPFROMHALT) == SET ) {
 807  00bd ae2220        	ldw	x,#8736
 808  00c0 cd0000        	call	_I2C_GetITStatus
 810  00c3 a101          	cp	a,#1
 811  00c5 2607          	jrne	L772
 812                     ; 417 		x = x + 1;
 814  00c7 1e01          	ldw	x,(OFST-1,sp)
 815  00c9 1c0001        	addw	x,#1
 816  00cc 1f01          	ldw	(OFST-1,sp),x
 817  00ce               L772:
 818                     ; 419 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_OVERRUNUNDERRUN) == SET ) {
 820  00ce ae2108        	ldw	x,#8456
 821  00d1 cd0000        	call	_I2C_GetITStatus
 823  00d4 a101          	cp	a,#1
 824  00d6 2607          	jrne	L103
 825                     ; 420 		x = x + 1;
 827  00d8 1e01          	ldw	x,(OFST-1,sp)
 828  00da 1c0001        	addw	x,#1
 829  00dd 1f01          	ldw	(OFST-1,sp),x
 830  00df               L103:
 831                     ; 422 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) == SET ) {
 833  00df ae2104        	ldw	x,#8452
 834  00e2 cd0000        	call	_I2C_GetITStatus
 836  00e5 a101          	cp	a,#1
 837  00e7 2607          	jrne	L303
 838                     ; 423 		x = x + 1;
 840  00e9 1e01          	ldw	x,(OFST-1,sp)
 841  00eb 1c0001        	addw	x,#1
 842  00ee 1f01          	ldw	(OFST-1,sp),x
 843  00f0               L303:
 844                     ; 425 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ARBITRATIONLOSS ) == SET ) {
 846  00f0 ae2102        	ldw	x,#8450
 847  00f3 cd0000        	call	_I2C_GetITStatus
 849  00f6 a101          	cp	a,#1
 850  00f8 2607          	jrne	L503
 851                     ; 426 		x = x + 1;
 853  00fa 1e01          	ldw	x,(OFST-1,sp)
 854  00fc 1c0001        	addw	x,#1
 855  00ff 1f01          	ldw	(OFST-1,sp),x
 856  0101               L503:
 857                     ; 428 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_BUSERROR ) == SET ) {
 859  0101 ae2101        	ldw	x,#8449
 860  0104 cd0000        	call	_I2C_GetITStatus
 862  0107 a101          	cp	a,#1
 863  0109 2607          	jrne	L703
 864                     ; 429 		x = x + 1;
 866  010b 1e01          	ldw	x,(OFST-1,sp)
 867  010d 1c0001        	addw	x,#1
 868  0110 1f01          	ldw	(OFST-1,sp),x
 869  0112               L703:
 870                     ; 431 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TXEMPTY ) == SET ) {
 872  0112 ae1680        	ldw	x,#5760
 873  0115 cd0000        	call	_I2C_GetITStatus
 875  0118 a101          	cp	a,#1
 876  011a 2607          	jrne	L113
 877                     ; 432 		x = x + 1;
 879  011c 1e01          	ldw	x,(OFST-1,sp)
 880  011e 1c0001        	addw	x,#1
 881  0121 1f01          	ldw	(OFST-1,sp),x
 882  0123               L113:
 883                     ; 434 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STOPDETECTION ) == SET ) {
 885  0123 ae1210        	ldw	x,#4624
 886  0126 cd0000        	call	_I2C_GetITStatus
 888  0129 a101          	cp	a,#1
 889  012b 2607          	jrne	L313
 890                     ; 435 		x = x + 1;
 892  012d 1e01          	ldw	x,(OFST-1,sp)
 893  012f 1c0001        	addw	x,#1
 894  0132 1f01          	ldw	(OFST-1,sp),x
 895  0134               L313:
 896                     ; 437 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_HEADERSENT ) == SET ) {
 898  0134 ae1208        	ldw	x,#4616
 899  0137 cd0000        	call	_I2C_GetITStatus
 901  013a a101          	cp	a,#1
 902  013c 2607          	jrne	L513
 903                     ; 438 		x = x + 1;
 905  013e 1e01          	ldw	x,(OFST-1,sp)
 906  0140 1c0001        	addw	x,#1
 907  0143 1f01          	ldw	(OFST-1,sp),x
 908  0145               L513:
 909                     ; 440 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_RXNOTEMPTY ) == SET ) {
 911  0145 ae1640        	ldw	x,#5696
 912  0148 cd0000        	call	_I2C_GetITStatus
 914  014b a101          	cp	a,#1
 915  014d 2607          	jrne	L713
 916                     ; 441 		x = x + 1;
 918  014f 1e01          	ldw	x,(OFST-1,sp)
 919  0151 1c0001        	addw	x,#1
 920  0154 1f01          	ldw	(OFST-1,sp),x
 921  0156               L713:
 922                     ; 443 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TRANSFERFINISHED ) == SET ) {
 924  0156 ae1204        	ldw	x,#4612
 925  0159 cd0000        	call	_I2C_GetITStatus
 927  015c a101          	cp	a,#1
 928  015e 2607          	jrne	L123
 929                     ; 444 		x = x + 1;
 931  0160 1e01          	ldw	x,(OFST-1,sp)
 932  0162 1c0001        	addw	x,#1
 933  0165 1f01          	ldw	(OFST-1,sp),x
 934  0167               L123:
 935                     ; 446 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ADDRESSSENTMATCHED ) == SET ) {
 937  0167 ae1202        	ldw	x,#4610
 938  016a cd0000        	call	_I2C_GetITStatus
 940  016d a101          	cp	a,#1
 941  016f 2607          	jrne	L323
 942                     ; 447 		x = x + 1;
 944  0171 1e01          	ldw	x,(OFST-1,sp)
 945  0173 1c0001        	addw	x,#1
 946  0176 1f01          	ldw	(OFST-1,sp),x
 947  0178               L323:
 948                     ; 449 	if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STARTDETECTION ) == SET ) {
 950  0178 ae1201        	ldw	x,#4609
 951  017b cd0000        	call	_I2C_GetITStatus
 953  017e a101          	cp	a,#1
 954  0180 2607          	jrne	L523
 955                     ; 450 		x = x + 1;
 957  0182 1e01          	ldw	x,(OFST-1,sp)
 958  0184 1c0001        	addw	x,#1
 959  0187 1f01          	ldw	(OFST-1,sp),x
 960  0189               L523:
 961                     ; 453 	if ( I2C_CheckEvent(I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED)== SUCCESS ){
 963  0189 ae0202        	ldw	x,#514
 964  018c cd0000        	call	_I2C_CheckEvent
 966  018f a101          	cp	a,#1
 967                     ; 457 }
 970  0191 5b02          	addw	sp,#2
 971  0193 85            	popw	x
 972  0194 bf00          	ldw	c_y,x
 973  0196 320002        	pop	c_y+2
 974  0199 85            	popw	x
 975  019a bf00          	ldw	c_x,x
 976  019c 320002        	pop	c_x+2
 977  019f 80            	iret
 999                     ; 531 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 999                     ; 532 {
1000                     	switch	.text
1001  01a0               f_ADC1_IRQHandler:
1005                     ; 536 }
1008  01a0 80            	iret
1045                     ; 557 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1045                     ; 558 {
1046                     	switch	.text
1047  01a1               f_TIM4_UPD_OVF_IRQHandler:
1049  01a1 8a            	push	cc
1050  01a2 84            	pop	a
1051  01a3 a4bf          	and	a,#191
1052  01a5 88            	push	a
1053  01a6 86            	pop	cc
1054       00000001      OFST:	set	1
1055  01a7 3b0002        	push	c_x+2
1056  01aa be00          	ldw	x,c_x
1057  01ac 89            	pushw	x
1058  01ad 3b0002        	push	c_y+2
1059  01b0 be00          	ldw	x,c_y
1060  01b2 89            	pushw	x
1061  01b3 88            	push	a
1064                     ; 562 	u8 v = TIM4_GetCounter();
1066  01b4 cd0000        	call	_TIM4_GetCounter
1068  01b7 6b01          	ld	(OFST+0,sp),a
1069                     ; 563   Counter++;
1071  01b9 be00          	ldw	x,_Counter
1072  01bb 1c0001        	addw	x,#1
1073  01be bf00          	ldw	_Counter,x
1074                     ; 564   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1076  01c0 a601          	ld	a,#1
1077  01c2 cd0000        	call	_TIM4_ClearITPendingBit
1079                     ; 566 }
1082  01c5 84            	pop	a
1083  01c6 85            	popw	x
1084  01c7 bf00          	ldw	c_y,x
1085  01c9 320002        	pop	c_y+2
1086  01cc 85            	popw	x
1087  01cd bf00          	ldw	c_x,x
1088  01cf 320002        	pop	c_x+2
1089  01d2 80            	iret
1112                     ; 574 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1112                     ; 575 {
1113                     	switch	.text
1114  01d3               f_EEPROM_EEC_IRQHandler:
1118                     ; 579 }
1121  01d3 80            	iret
1153                     	xref	_I2C_SendPacket
1154                     	xdef	_stopDelay
1155                     	xdef	_Counter
1156                     	xref.b	_note_playing
1157                     	xref.b	_previous_button_state
1158                     	xref.b	_button_state
1159                     	xdef	f_EEPROM_EEC_IRQHandler
1160                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1161                     	xdef	f_ADC1_IRQHandler
1162                     	xdef	f_I2C_IRQHandler
1163                     	xdef	f_UART1_RX_IRQHandler
1164                     	xdef	f_UART1_TX_IRQHandler
1165                     	xdef	f_TIM2_CAP_COM_IRQHandler
1166                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1167                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1168                     	xdef	f_TIM1_CAP_COM_IRQHandler
1169                     	xdef	f_SPI_IRQHandler
1170                     	xdef	f_EXTI_PORTE_IRQHandler
1171                     	xdef	f_EXTI_PORTD_IRQHandler
1172                     	xdef	f_EXTI_PORTC_IRQHandler
1173                     	xdef	f_EXTI_PORTB_IRQHandler
1174                     	xdef	f_EXTI_PORTA_IRQHandler
1175                     	xdef	f_CLK_IRQHandler
1176                     	xdef	f_AWU_IRQHandler
1177                     	xdef	f_TLI_IRQHandler
1178                     	xdef	f_TRAP_IRQHandler
1179                     	xdef	f_NonHandledInterrupt
1180                     	xref	_TIM4_ClearITPendingBit
1181                     	xref	_TIM4_GetCounter
1182                     	xref	_TIM4_Cmd
1183                     	xref	_I2C_GetITStatus
1184                     	xref	_I2C_CheckEvent
1185                     	xref.b	c_x
1186                     	xref.b	c_y
1205                     	end
