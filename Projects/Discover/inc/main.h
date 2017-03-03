/**
  ******************************************************************************
  * @file    icc_measure.h
  * @author  Microcontroller Division
  * @version V1.0.0
  * @date    11/2011
  * @brief   Current measurements defines
  ******************************************************************************
  * @copy
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  * FOR MORE INFORMATION PLEASE READ CAREFULLY THE LICENSE AGREEMENT FILE LOCATED 
  * IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
	*
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H


/* Private define ------------------------------------------------------------*/

// Clock speed in Hz
#define F_CPU 16000000

#define BUTTON_PORT GPIOC
#define BOTTOM_BUTTON GPIO_PIN_3
#define TOP_BUTTON GPIO_PIN_5


// VCC Next Trigger
#define TRIGGER_PORT GPIOA
#define TRIGGER_PIN GPIO_PIN_2

// LED Stuff
#define LED_PORT GPIOA
#define LED_PIN GPIO_PIN_1

// pulse widths in microseconds
#define LED_ZERO_PW 350
#define LED_ONE_PW 900
#define LED_PW 1250

#define LED_FIXED_LOW 2
#define LED_FIXED_HIGH 4
#define LED_FIXED_TOTAL 8

#define LED_ZERO_CYCLES    (((F_CPU/1000)*LED_ZERO_PW          )/1000000)
#define LED_ONE_CYCLES     (((F_CPU/1000)*LED_ONE_PW    +500000)/1000000)
#define LED_TOTAL_CYCLES   (((F_CPU/1000)*LED_PW        +500000)/1000000)

// w1 - nops between rising edge and falling edge - low
#define LED_W1 (LED_ZERO_CYCLES - LED_FIXED_LOW)
// w2   nops between fe low and fe high
#define LED_W2 (LED_ONE_CYCLES - LED_FIXED_HIGH - LED_W1)
// w3   nops to complete loop
#define LED_W3 (LED_TOTAL_CYCLES - LED_FIXED_TOTAL - LED_W1 - LED_W2)

#if LED_W1 > 0
  #define LED_W1_NOPS LED_W1
#else
  #define LED_W1_NOPS 0
#endif

#if LED_W2 > 0
  #define LED_W2_NOPS LED_W2
#else
  #define LED_W2_NOPS 0
#endif

#if LED_W3 > 0
  #define LED_W3_NOPS LED_W3
#else
  #define LED_W3_NOPS 0
#endif

#define LED_NOP_INSTR1 "nop \n\t"
#define LED_NOP_INSTR2 "jrt .+0 \n\t"
#define LED_NOP_INSTR4 LED_NOP_INSTR2 LED_NOP_INSTR2
#define LED_NOP_INSTR8 LED_NOP_INSTR4 LED_NOP_INSTR4
#define LED_NOP_INSTR16 LED_NOP_INSTR8 LED_NOP_INSTR8

#define LED_T0H 
#define LED_T1H
#define LED_T0L
#define LED_T1L


//added later
#define BUFFERSIE 7

#endif /* __MAIN_H*/

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
