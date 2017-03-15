/**
  ******************************************************************************
  * @file main.c
  * @brief This file contains the main function for Discover example.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.0
  * @date 24/11/2011
  ******************************************************************************
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
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
/*#include "stm8s_i2c.h"
#include "stm8s_conf.h"*/


/**
  * @addtogroup TIM4_TimeBase_InterruptConfiguration
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile bool User_Key_Pressed = 0;
volatile u8 previous_button_state = 0b10101010;
volatile u8 button_state = 0;
volatile bool note_playing = FALSE;

u8 i = 0;
volatile u8 NumOfBytes = 7;
u8 next_case = 0;
volatile u8 TxBuffer[7];
volatile u8 velocity = 0;
volatile uint8_t received = 14;
volatile uint8_t received2 = 0x7c;
volatile uint8_t ping_received = 0;
//int _recieveddata;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void I2C_Configuration(void);
void TIMER_Configuration(void);
void Blinking_StateMachine(void);



@inline void WriteHigh(void)
{
	LED_PORT->ODR |= (uint8_t)LED_PIN;
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
}
@inline void WriteLow(void)
{
	LED_PORT->ODR |= (uint8_t)LED_PIN;
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
}

@inline void LED_SendByte(u8 data) {
	int i = 0;
	#pragma unroll(8)
	for (i = 7; i >= 0; i--) {
		bool bit = (1<<i & data);
		if (bit != 0) {
			WriteHigh();
		} else {
			WriteLow();
		}
	}
}

void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts);
void LED_SetColor(u8 r, u8 g, u8 b);

/* Public functions ----------------------------------------------------------*/
/**
  * @brief Example firmware main entry point.
  * @par Parameters:
  * None
  * @retval
  * None
  */

//added later not found in default code
/*void InitialiseSystemClock()
{
    CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
    CLK_ICKR_HSIEN = 1;                 //  Enable the HSI.
    CLK_ECKR = 0;                       //  Disable the external clock.
    while (CLK_ICKR_HSIRDY == 0);       //  Wait for the HSI to be ready for use.
    CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
    CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
    CLK_PCKENR2 = 0xff;                 //  Ditto.
    CLK_CCOR = 0;                       //  Turn off CCO.
    CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
    CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
    CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
    CLK_SWCR = 0;                       //  Reset the clock switch control register.
    CLK_SWCR_SWEN = 1;                  //  Enable switching.
    while (CLK_SWCR_SWBSY != 0);        //  Pause while the clock switch is busy.
}*/

	
void main(void)
{
	int i, j, k;
	u16 startDelay ;
	//Enable HSI mode
	CLK_DeInit();  
  CLK_HSICmd(ENABLE);
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	// Configure LED pin as push-pull output, defaulting to the 'reset' code.
  GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	LED_SetColor_Int(30, 70, 100, FALSE);
	
	for(startDelay = 900000; startDelay > 0; startDelay--){
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop(); nop(); nop(); nop(); nop();
				nop();
			}
	
	// Configure PA2 (VCC-Next Trigger) as push-pull output, defaulting to HIGH
	GPIO_Init(TRIGGER_PORT, TRIGGER_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_WriteHigh(TRIGGER_PORT, TRIGGER_PIN);
	

	//disabling unused pripherals
	/*CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_CAN, DISABLE);
	CLK_FastHaltWakeUpCmd(DISABLE);
	*/
	
	
	
	//Configure PC3 and PC5 (push buton) as input floating
	GPIO_Init(BUTTON_PORT, TOP_BUTTON, GPIO_MODE_IN_PU_IT);
	GPIO_Init(BUTTON_PORT, BOTTOM_BUTTON, GPIO_MODE_IN_PU_IT);
	
	
	/* Initialize the Interrupt sensitivity for key pcb buttons
	We use EXTI_PORT_GPIOC
	*/
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);
	
	LED_SetColor_Int(100, 0, 0, FALSE);
	
  TIMER_Configuration();
	I2C_Configuration();
	LED_SetColor_Int(100, 100, 0, FALSE);
	
	//I2C Request for new address
	I2C_GenerateSTART(ENABLE);
	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
	LED_SetColor_Int(80, 80, 20, FALSE);
	
	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
	while ( I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)!= SUCCESS ) {}
	LED_SetColor_Int(60, 60, 40, FALSE);
	
	
	I2C_SendData(0x01);
	while (I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED)!= SUCCESS);
	LED_SetColor_Int(40, 40, 60, FALSE);
	
	I2C_GeneralCallCmd(ENABLE);
	I2C_GenerateSTOP(ENABLE);
	
	// I2C general call
	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED)!= SUCCESS );
	received = I2C_ReceiveData();
	while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_RECEIVED)!= SUCCESS);
	received2 = I2C_ReceiveData();
	I2C_GeneralCallCmd(DISABLE);
	LED_SetColor_Int(20, 20, 80, FALSE);
	
	//I2C Reconfigure with new address
	I2C_Configuration();
	LED_SetColor_Int(0, 0, 100, FALSE);
	enableInterrupts();
	
	GPIO_WriteLow(TRIGGER_PORT,  TRIGGER_PIN);
	for (i = 500; i >= 0; i--) {
		for (j = 1; j >= 0; j--) {
		  for (k = 1; k >= 0; k--) {
			  nop();nop();nop();nop();nop();
			}
		}
	}       
	GPIO_WriteHigh(TRIGGER_PORT,  TRIGGER_PIN);
	
	
	LED_SetColor_Int(0, 0, 0, FALSE);
	
  
	wfi();
	/*while (1) {
	  //halt();
		while ( I2C_CheckEvent(I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED)!= SUCCESS );
		I2C_SendData(received2);
		while ( I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_TRANSMITTED)!= SUCCESS);
  }*/
}

void I2C_Configuration(void) {
	I2C_DeInit();
  I2C_Init(I2C_MAX_STANDARD_FREQ,
     (received2<<1),// Self address 
     I2C_DUTYCYCLE_2, 
     I2C_ACK_CURR,
     I2C_ADDMODE_7BIT, 
     I2C_MAX_INPUT_FREQ
  );
	I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_EVT | I2C_IT_BUF),
	ENABLE);
  //I2C_AcknowledgeConfig(I2C_ACK_CURR);

}

@inline void LED_SendReset(void) {
	int i = 0;
	LED_PORT->ODR &= (uint8_t)(~LED_PIN);
  #pragma unroll(1280)
	for (i = 1280; i >= 0; i--) {
		nop();
  }
}

void LED_SetColor(u8 r, u8 g, u8 b) {
	LED_SetColor_Int(r, g, b, TRUE);
}


void LED_SetColor_Int(u8 r, u8 g, u8 b, bool changeInterrupts) {
	r = r > 100 ? 100 : r;
	g = g > 100 ? 100 : g;
	b = b > 100 ? 100 : b;
	if (changeInterrupts) disableInterrupts();
	LED_SendReset();
	LED_SendByte(g);
	LED_SendByte(r);
	LED_SendByte(b);
	LED_SendReset();
	if (changeInterrupts) enableInterrupts();
	/*CLK_DeInit();  
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  CLK_HSICmd(DISABLE);*/
}

void TIMER_Configuration(void)
{
  TIM4_DeInit();

  /* Time base configuration */
  TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124 );

  /* Disable TIM4 IT UPDATE */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
}

void I2C_SendPacket(u8 velocity) {
	I2C_GenerateSTART(ENABLE);	
	while (! I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT) ) {}
	
	I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) )
	{
		if (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
				I2C_Send7bitAddress((0x08<<1), I2C_DIRECTION_TX);
		}
	}

	I2C_SendData(received2);
	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS )
	{
		if (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
				I2C_SendData(received2);
		}
	}
	I2C_SendData(velocity);
	while ( I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
	{
		if (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE))
		{
				I2C_SendData(velocity);
		}
	}

	I2C_GenerateSTOP(ENABLE);
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval
  * None
  */
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {}
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
