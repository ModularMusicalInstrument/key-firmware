   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 57 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 58 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 62 }
  54  0000 80            	iret
  76                     ; 70 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 71 {
  77                     	switch	.text
  78  0001               f_TRAP_IRQHandler:
  82                     ; 75 }
  85  0001 80            	iret
 107                     ; 82 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 83 
 107                     ; 84 {
 108                     	switch	.text
 109  0002               f_TLI_IRQHandler:
 113                     ; 88 }
 116  0002 80            	iret
 138                     ; 95 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 96 {
 139                     	switch	.text
 140  0003               f_AWU_IRQHandler:
 144                     ; 100 }
 147  0003 80            	iret
 169                     ; 107 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 108 {
 170                     	switch	.text
 171  0004               f_CLK_IRQHandler:
 175                     ; 112 }
 178  0004 80            	iret
 201                     ; 119 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 120 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTA_IRQHandler:
 207                     ; 124 }
 210  0005 80            	iret
 233                     ; 131 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 132 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTB_IRQHandler:
 239                     ; 136 }
 242  0006 80            	iret
 322                     ; 143 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 322                     ; 144 {
 323                     	switch	.text
 324  0007               f_EXTI_PORTC_IRQHandler:
 326  0007 8a            	push	cc
 327  0008 84            	pop	a
 328  0009 a4bf          	and	a,#191
 329  000b 88            	push	a
 330  000c 86            	pop	cc
 331       00000003      OFST:	set	3
 332  000d 3b0002        	push	c_x+2
 333  0010 be00          	ldw	x,c_x
 334  0012 89            	pushw	x
 335  0013 3b0002        	push	c_y+2
 336  0016 be00          	ldw	x,c_y
 337  0018 89            	pushw	x
 338  0019 5203          	subw	sp,#3
 341                     ; 148 	const bool top_pressed = (GPIOC->IDR & TOP_BUTTON) == 0;
 343  001b c6500b        	ld	a,20491
 344  001e a520          	bcp	a,#32
 345  0020 2605          	jrne	L42
 346  0022 ae0001        	ldw	x,#1
 347  0025 2001          	jra	L62
 348  0027               L42:
 349  0027 5f            	clrw	x
 350  0028               L62:
 351  0028 01            	rrwa	x,a
 352  0029 6b02          	ld	(OFST-1,sp),a
 353  002b 02            	rlwa	x,a
 354                     ; 149 	const bool bottom_pressed = (GPIOC->IDR & BOTTOM_BUTTON) == 0;
 356  002c c6500b        	ld	a,20491
 357  002f a508          	bcp	a,#8
 358  0031 2605          	jrne	L03
 359  0033 ae0001        	ldw	x,#1
 360  0036 2001          	jra	L23
 361  0038               L03:
 362  0038 5f            	clrw	x
 363  0039               L23:
 364  0039 01            	rrwa	x,a
 365  003a 6b03          	ld	(OFST+0,sp),a
 366  003c 02            	rlwa	x,a
 367                     ; 150 	volatile u8 velocity = 0;
 369  003d 0f01          	clr	(OFST-2,sp)
 370                     ; 151 	button_state = GPIOC->IDR;
 372  003f 55500b0000    	mov	_button_state,20491
 373                     ; 152 	if (button_state != previous_button_state) {
 375  0044 b600          	ld	a,_button_state
 376  0046 b100          	cp	a,_previous_button_state
 377  0048 272a          	jreq	L731
 378                     ; 153 		if (top_pressed && bottom_pressed) {
 380  004a 0d02          	tnz	(OFST-1,sp)
 381  004c 270e          	jreq	L141
 383  004e 0d03          	tnz	(OFST+0,sp)
 384  0050 270a          	jreq	L141
 385                     ; 155 			velocity = TIM4_GetCounter();
 387  0052 cd0000        	call	_TIM4_GetCounter
 389  0055 6b01          	ld	(OFST-2,sp),a
 390                     ; 156 			I2C_SendPacket(1);
 392  0057 a601          	ld	a,#1
 393  0059 cd0000        	call	_I2C_SendPacket
 395  005c               L141:
 396                     ; 159 		TIM4_Cmd(DISABLE);
 398  005c 4f            	clr	a
 399  005d cd0000        	call	_TIM4_Cmd
 401                     ; 160 		TIM4_SetCounter(0);
 403  0060 4f            	clr	a
 404  0061 cd0000        	call	_TIM4_SetCounter
 406                     ; 163 		if (top_pressed && !bottom_pressed) {
 408  0064 0d02          	tnz	(OFST-1,sp)
 409  0066 2709          	jreq	L341
 411  0068 0d03          	tnz	(OFST+0,sp)
 412  006a 2605          	jrne	L341
 413                     ; 165 			TIM4_Cmd(ENABLE);
 415  006c a601          	ld	a,#1
 416  006e cd0000        	call	_TIM4_Cmd
 418  0071               L341:
 419                     ; 167 		previous_button_state = button_state;
 421  0071 450000        	mov	_previous_button_state,_button_state
 422  0074               L731:
 423                     ; 169 }
 426  0074 5b03          	addw	sp,#3
 427  0076 85            	popw	x
 428  0077 bf00          	ldw	c_y,x
 429  0079 320002        	pop	c_y+2
 430  007c 85            	popw	x
 431  007d bf00          	ldw	c_x,x
 432  007f 320002        	pop	c_x+2
 433  0082 80            	iret
 456                     ; 176 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 456                     ; 177 {
 457                     	switch	.text
 458  0083               f_EXTI_PORTD_IRQHandler:
 462                     ; 181 }
 465  0083 80            	iret
 488                     ; 188 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 488                     ; 189 {
 489                     	switch	.text
 490  0084               f_EXTI_PORTE_IRQHandler:
 494                     ; 193 }
 497  0084 80            	iret
 519                     ; 240 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 519                     ; 241 {
 520                     	switch	.text
 521  0085               f_SPI_IRQHandler:
 525                     ; 245 }
 528  0085 80            	iret
 551                     ; 252 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 551                     ; 253 {
 552                     	switch	.text
 553  0086               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 557                     ; 257 }
 560  0086 80            	iret
 583                     ; 264 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 583                     ; 265 {
 584                     	switch	.text
 585  0087               f_TIM1_CAP_COM_IRQHandler:
 589                     ; 269 }
 592  0087 80            	iret
 615                     ; 302 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 615                     ; 303 {
 616                     	switch	.text
 617  0088               f_TIM2_UPD_OVF_BRK_IRQHandler:
 621                     ; 307 }
 624  0088 80            	iret
 647                     ; 314 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 647                     ; 315 {
 648                     	switch	.text
 649  0089               f_TIM2_CAP_COM_IRQHandler:
 653                     ; 319 }
 656  0089 80            	iret
 679                     ; 356 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 679                     ; 357 {
 680                     	switch	.text
 681  008a               f_UART1_TX_IRQHandler:
 685                     ; 361 }
 688  008a 80            	iret
 711                     ; 368 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 711                     ; 369 {
 712                     	switch	.text
 713  008b               f_UART1_RX_IRQHandler:
 717                     ; 373 }
 720  008b 80            	iret
 754                     ; 381 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 754                     ; 382 {
 755                     	switch	.text
 756  008c               f_I2C_IRQHandler:
 758  008c 8a            	push	cc
 759  008d 84            	pop	a
 760  008e a4bf          	and	a,#191
 761  0090 88            	push	a
 762  0091 86            	pop	cc
 763       00000002      OFST:	set	2
 764  0092 3b0002        	push	c_x+2
 765  0095 be00          	ldw	x,c_x
 766  0097 89            	pushw	x
 767  0098 3b0002        	push	c_y+2
 768  009b be00          	ldw	x,c_y
 769  009d 89            	pushw	x
 770  009e 89            	pushw	x
 773                     ; 388 	int x = 1 + 1;
 775  009f ae0002        	ldw	x,#2
 776  00a2 1f01          	ldw	(OFST-1,sp),x
 777                     ; 390 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_WAKEUPFROMHALT) == SET ) {
 779  00a4 ae2220        	ldw	x,#8736
 780  00a7 cd0000        	call	_I2C_GetITStatus
 782  00aa a101          	cp	a,#1
 783  00ac 2607          	jrne	L372
 784                     ; 391   x = x + 1;
 786  00ae 1e01          	ldw	x,(OFST-1,sp)
 787  00b0 1c0001        	addw	x,#1
 788  00b3 1f01          	ldw	(OFST-1,sp),x
 789  00b5               L372:
 790                     ; 393 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_OVERRUNUNDERRUN) == SET ) {
 792  00b5 ae2108        	ldw	x,#8456
 793  00b8 cd0000        	call	_I2C_GetITStatus
 795  00bb a101          	cp	a,#1
 796  00bd 2607          	jrne	L572
 797                     ; 394   x = x + 1;
 799  00bf 1e01          	ldw	x,(OFST-1,sp)
 800  00c1 1c0001        	addw	x,#1
 801  00c4 1f01          	ldw	(OFST-1,sp),x
 802  00c6               L572:
 803                     ; 396 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) == SET ) {
 805  00c6 ae2104        	ldw	x,#8452
 806  00c9 cd0000        	call	_I2C_GetITStatus
 808  00cc a101          	cp	a,#1
 809  00ce 2607          	jrne	L772
 810                     ; 397   x = x + 1;
 812  00d0 1e01          	ldw	x,(OFST-1,sp)
 813  00d2 1c0001        	addw	x,#1
 814  00d5 1f01          	ldw	(OFST-1,sp),x
 815  00d7               L772:
 816                     ; 399 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ARBITRATIONLOSS ) == SET ) {
 818  00d7 ae2102        	ldw	x,#8450
 819  00da cd0000        	call	_I2C_GetITStatus
 821  00dd a101          	cp	a,#1
 822  00df 2607          	jrne	L103
 823                     ; 400   x = x + 1;
 825  00e1 1e01          	ldw	x,(OFST-1,sp)
 826  00e3 1c0001        	addw	x,#1
 827  00e6 1f01          	ldw	(OFST-1,sp),x
 828  00e8               L103:
 829                     ; 402 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_BUSERROR ) == SET ) {
 831  00e8 ae2101        	ldw	x,#8449
 832  00eb cd0000        	call	_I2C_GetITStatus
 834  00ee a101          	cp	a,#1
 835  00f0 2607          	jrne	L303
 836                     ; 403   x = x + 1;
 838  00f2 1e01          	ldw	x,(OFST-1,sp)
 839  00f4 1c0001        	addw	x,#1
 840  00f7 1f01          	ldw	(OFST-1,sp),x
 841  00f9               L303:
 842                     ; 405 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TXEMPTY ) == SET ) {
 844  00f9 ae1680        	ldw	x,#5760
 845  00fc cd0000        	call	_I2C_GetITStatus
 847  00ff a101          	cp	a,#1
 848  0101 2607          	jrne	L503
 849                     ; 406   x = x + 1;
 851  0103 1e01          	ldw	x,(OFST-1,sp)
 852  0105 1c0001        	addw	x,#1
 853  0108 1f01          	ldw	(OFST-1,sp),x
 854  010a               L503:
 855                     ; 408 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STOPDETECTION ) == SET ) {
 857  010a ae1210        	ldw	x,#4624
 858  010d cd0000        	call	_I2C_GetITStatus
 860  0110 a101          	cp	a,#1
 861  0112 2607          	jrne	L703
 862                     ; 409   x = x + 1;
 864  0114 1e01          	ldw	x,(OFST-1,sp)
 865  0116 1c0001        	addw	x,#1
 866  0119 1f01          	ldw	(OFST-1,sp),x
 867  011b               L703:
 868                     ; 411 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_HEADERSENT ) == SET ) {
 870  011b ae1208        	ldw	x,#4616
 871  011e cd0000        	call	_I2C_GetITStatus
 873  0121 a101          	cp	a,#1
 874  0123 2607          	jrne	L113
 875                     ; 412   x = x + 1;
 877  0125 1e01          	ldw	x,(OFST-1,sp)
 878  0127 1c0001        	addw	x,#1
 879  012a 1f01          	ldw	(OFST-1,sp),x
 880  012c               L113:
 881                     ; 414 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_RXNOTEMPTY ) == SET ) {
 883  012c ae1640        	ldw	x,#5696
 884  012f cd0000        	call	_I2C_GetITStatus
 886  0132 a101          	cp	a,#1
 887  0134 2607          	jrne	L313
 888                     ; 415   x = x + 1;
 890  0136 1e01          	ldw	x,(OFST-1,sp)
 891  0138 1c0001        	addw	x,#1
 892  013b 1f01          	ldw	(OFST-1,sp),x
 893  013d               L313:
 894                     ; 417 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_TRANSFERFINISHED ) == SET ) {
 896  013d ae1204        	ldw	x,#4612
 897  0140 cd0000        	call	_I2C_GetITStatus
 899  0143 a101          	cp	a,#1
 900  0145 2607          	jrne	L513
 901                     ; 418   x = x + 1;
 903  0147 1e01          	ldw	x,(OFST-1,sp)
 904  0149 1c0001        	addw	x,#1
 905  014c 1f01          	ldw	(OFST-1,sp),x
 906  014e               L513:
 907                     ; 420 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_ADDRESSSENTMATCHED ) == SET ) {
 909  014e ae1202        	ldw	x,#4610
 910  0151 cd0000        	call	_I2C_GetITStatus
 912  0154 a101          	cp	a,#1
 913  0156 2607          	jrne	L713
 914                     ; 421   x = x + 1;
 916  0158 1e01          	ldw	x,(OFST-1,sp)
 917  015a 1c0001        	addw	x,#1
 918  015d 1f01          	ldw	(OFST-1,sp),x
 919  015f               L713:
 920                     ; 423 if ( I2C_GetITStatus( I2C_ITPENDINGBIT_STARTDETECTION ) == SET ) {
 922  015f ae1201        	ldw	x,#4609
 923  0162 cd0000        	call	_I2C_GetITStatus
 925  0165 a101          	cp	a,#1
 926  0167 2607          	jrne	L123
 927                     ; 424   x = x + 1;
 929  0169 1e01          	ldw	x,(OFST-1,sp)
 930  016b 1c0001        	addw	x,#1
 931  016e 1f01          	ldw	(OFST-1,sp),x
 932  0170               L123:
 933                     ; 426 }
 936  0170 5b02          	addw	sp,#2
 937  0172 85            	popw	x
 938  0173 bf00          	ldw	c_y,x
 939  0175 320002        	pop	c_y+2
 940  0178 85            	popw	x
 941  0179 bf00          	ldw	c_x,x
 942  017b 320002        	pop	c_x+2
 943  017e 80            	iret
 965                     ; 500 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 965                     ; 501 {
 966                     	switch	.text
 967  017f               f_ADC1_IRQHandler:
 971                     ; 505 }
 974  017f 80            	iret
 999                     ; 526 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 999                     ; 527 {
1000                     	switch	.text
1001  0180               f_TIM4_UPD_OVF_IRQHandler:
1003  0180 8a            	push	cc
1004  0181 84            	pop	a
1005  0182 a4bf          	and	a,#191
1006  0184 88            	push	a
1007  0185 86            	pop	cc
1008  0186 3b0002        	push	c_x+2
1009  0189 be00          	ldw	x,c_x
1010  018b 89            	pushw	x
1011  018c 3b0002        	push	c_y+2
1012  018f be00          	ldw	x,c_y
1013  0191 89            	pushw	x
1016                     ; 531   Counter++;
1018  0192 3c00          	inc	_Counter
1019                     ; 532   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1021  0194 a601          	ld	a,#1
1022  0196 cd0000        	call	_TIM4_ClearITPendingBit
1024                     ; 534 }
1027  0199 85            	popw	x
1028  019a bf00          	ldw	c_y,x
1029  019c 320002        	pop	c_y+2
1030  019f 85            	popw	x
1031  01a0 bf00          	ldw	c_x,x
1032  01a2 320002        	pop	c_x+2
1033  01a5 80            	iret
1056                     ; 542 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1056                     ; 543 {
1057                     	switch	.text
1058  01a6               f_EEPROM_EEC_IRQHandler:
1062                     ; 547 }
1065  01a6 80            	iret
1077                     	xref	_I2C_SendPacket
1078                     	xref.b	_Counter
1079                     	xref.b	_previous_button_state
1080                     	xref.b	_button_state
1081                     	xdef	f_EEPROM_EEC_IRQHandler
1082                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1083                     	xdef	f_ADC1_IRQHandler
1084                     	xdef	f_I2C_IRQHandler
1085                     	xdef	f_UART1_RX_IRQHandler
1086                     	xdef	f_UART1_TX_IRQHandler
1087                     	xdef	f_TIM2_CAP_COM_IRQHandler
1088                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1089                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1090                     	xdef	f_TIM1_CAP_COM_IRQHandler
1091                     	xdef	f_SPI_IRQHandler
1092                     	xdef	f_EXTI_PORTE_IRQHandler
1093                     	xdef	f_EXTI_PORTD_IRQHandler
1094                     	xdef	f_EXTI_PORTC_IRQHandler
1095                     	xdef	f_EXTI_PORTB_IRQHandler
1096                     	xdef	f_EXTI_PORTA_IRQHandler
1097                     	xdef	f_CLK_IRQHandler
1098                     	xdef	f_AWU_IRQHandler
1099                     	xdef	f_TLI_IRQHandler
1100                     	xdef	f_TRAP_IRQHandler
1101                     	xdef	f_NonHandledInterrupt
1102                     	xref	_TIM4_ClearITPendingBit
1103                     	xref	_TIM4_GetCounter
1104                     	xref	_TIM4_SetCounter
1105                     	xref	_TIM4_Cmd
1106                     	xref	_I2C_GetITStatus
1107                     	xref.b	c_x
1108                     	xref.b	c_y
1127                     	end
