#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"

#include <string.h>
#include <stdlib.h>
#include "Headers/Enums.h"

#define FLASH_0LAT_DELAY0LAT
#define SysCoreClock 48000000

#define DELAY_AFTER_ONE 0x127c00
#define DELAY_AFTER_ZERO 0x1a8c80
#define DELAY_AFTER_RESET 0x3fa5c50

#define EOSTR '\0'

#define MAX_BUFF_SIZE 255
#define MAX_SPACE_SIZE 15
#define MAX_SPACE_BUF_SIZE 3825


#define MORSE_CODE(LETTER, STR)					\
case LETTER:							\
{								\
	if(strncat(edited_buf, STR, sizeof(STR) - 1) == NULL)	\
		err = CAT_ERROR;				\
	break;							\
}

#define CODE_CASE(LETTER, STR)					\
case LETTER:							\
{								\
	if(strncat(edited_buf_binary, STR, sizeof(STR) - 1) == NULL)	\
		err = CAT_ERROR;				\
	break;							\
}

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */

static void rcc_config()
{
    /* Set FLASH latency */
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = SysCoreClock;
}

/*
 * Clock on GPIOC and set pin with Blue led connected
 */
static void gpio_config(uint32_t PIN)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, PIN, LL_GPIO_MODE_OUTPUT);
    return;
}

__attribute__((naked)) static void delay(uint32_t time)
{
    asm ("push {r7, lr}\n\t"
         "mov r6, %0\n"
         "loop: sub r6, #1\n\t"
         "cmp r6, #0\n\t"
	     "bne loop\n\t"
         "pop {r7, pc}\n\t"
         : 
         : "r" (time)
         : "r6"
         );
}



uint32_t loopa(char* binary_buf)
{
    size_t i = 0;
    while (binary_buf[i] != EOSTR) 
    {
    	switch(binary_buf[i])
    	{
    		case '1':
    		{
    			LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_8);
        		delay(DELAY_AFTER_ONE);
        		break;
    		}
    		case '0':
    		{
    			LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
        		delay(DELAY_AFTER_ZERO);
        		break;
    		}
    		default:
    		{
    			return SIGN_ERROR;
    		}
    	}
    	i++;
    }
    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);

    return 0;
}


uint32_t parse_str(char* str, char* edited_buf, size_t size)
{

	if(str == NULL)
		return PTR_ERROR;

	uint32_t err = 0;	
	size_t  i = 0;
	while(str[i] != EOSTR)
	{
		switch(str[i])
		{
			#include "Headers/MorseCodes.h"
			default:
			{
				err =  SIGN_ERROR;
			}
		}

		if((i < size - 1) && (str[i + 1] != ' ') && (str[i] != ' ') && (strncat(edited_buf, "*", 1) == NULL))
				return CAT_ERROR;
		i++;
	}
	return err;
}

uint32_t parse_binary(char* edited_buf, char* edited_buf_binary)
{
	if(edited_buf == NULL)
		return PTR_ERROR;

	uint32_t err = 0;
	size_t i = 0;

	while(edited_buf[i] != EOSTR)
	{
		switch(edited_buf[i])
		{
			#include "Headers/CodeCases.h"
			default:
			{
				return SIGN_ERROR;
			}
		}
		i++;
	}
	return err;
}


int RunReset(char* edited_binary_buf){
	while(1)
	{
		if (loopa(edited_binary_buf) != 0 )
		{
			return COMMONERROR;
			break;
		}
		
		LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
		delay(DELAY_AFTER_RESET);
	}
}


int main()
{
	//char str[] = "THE MORROWIND IS THE BEST GAME I HAVE EVER PLAYED";
	char str[] = "THE Y";
	char* edited_buf = (char*)calloc(MAX_BUFF_SIZE, sizeof(char));
	char* edited_binary_buf = (char*)calloc(MAX_SPACE_BUF_SIZE, sizeof(char));

	
	if (edited_buf == NULL)
		return NOTINIT;
	if (edited_binary_buf == NULL)
		return NOTINIT;

	if (parse_str(str, edited_buf, MAX_BUFF_SIZE) != 0)
		return COMMONERROR;
	if (parse_binary(edited_buf, edited_binary_buf) != 0)
		return COMMONERROR;

	free(edited_buf);

	rcc_config();
	gpio_config(LL_GPIO_PIN_8);

	RunReset(edited_binary_buf);

	free(edited_binary_buf);
	return 0;
}


