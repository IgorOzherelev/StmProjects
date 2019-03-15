
build/clock_control.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             0000063c  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000010  080006fc  080006fc  000106fc  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  0800070c  0800070c  0001070c  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08000714  08000714  00010714  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  08000718  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000040  20000434  08000b4c  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000474  08000b4c  00020474  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       00000952  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     0000030a  00000000  00000000  00020dae  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_loc        000004bc  00000000  00000000  000210b8  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_aranges    00000110  00000000  00000000  00021574  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_ranges     000000e0  00000000  00000000  00021684  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_line       00000440  00000000  00000000  00021764  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_str        000004a8  00000000  00000000  00021ba4  2**0  CONTENTS, READONLY, DEBUGGING
 16 .comment          0000007f  00000000  00000000  0002204c  2**0  CONTENTS, READONLY
 17 .debug_frame      000004d4  00000000  00000000  000220cc  2**2  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	080006e4 	.word	0x080006e4

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	20000438 	.word	0x20000438
 8000104:	080006e4 	.word	0x080006e4

08000108 <Reset_Handler>:
 8000108:	480d      	ldr	r0, [pc, #52]	; (8000140 <LoopForever+0x2>)
 800010a:	4685      	mov	sp, r0
 800010c:	480d      	ldr	r0, [pc, #52]	; (8000144 <LoopForever+0x6>)
 800010e:	490e      	ldr	r1, [pc, #56]	; (8000148 <LoopForever+0xa>)
 8000110:	4a0e      	ldr	r2, [pc, #56]	; (800014c <LoopForever+0xe>)
 8000112:	2300      	movs	r3, #0
 8000114:	e002      	b.n	800011c <LoopCopyDataInit>

08000116 <CopyDataInit>:
 8000116:	58d4      	ldr	r4, [r2, r3]
 8000118:	50c4      	str	r4, [r0, r3]
 800011a:	3304      	adds	r3, #4

0800011c <LoopCopyDataInit>:
 800011c:	18c4      	adds	r4, r0, r3
 800011e:	428c      	cmp	r4, r1
 8000120:	d3f9      	bcc.n	8000116 <CopyDataInit>
 8000122:	4a0b      	ldr	r2, [pc, #44]	; (8000150 <LoopForever+0x12>)
 8000124:	4c0b      	ldr	r4, [pc, #44]	; (8000154 <LoopForever+0x16>)
 8000126:	2300      	movs	r3, #0
 8000128:	e001      	b.n	800012e <LoopFillZerobss>

0800012a <FillZerobss>:
 800012a:	6013      	str	r3, [r2, #0]
 800012c:	3204      	adds	r2, #4

0800012e <LoopFillZerobss>:
 800012e:	42a2      	cmp	r2, r4
 8000130:	d3fb      	bcc.n	800012a <FillZerobss>
 8000132:	f000 f9b1 	bl	8000498 <SystemInit>
 8000136:	f000 fa05 	bl	8000544 <__libc_init_array>
 800013a:	f000 f97b 	bl	8000434 <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	20000434 	.word	0x20000434
 800014c:	08000718 	.word	0x08000718
 8000150:	20000434 	.word	0x20000434
 8000154:	20000474 	.word	0x20000474

08000158 <ADC1_COMP_IRQHandler>:
 8000158:	e7fe      	b.n	8000158 <ADC1_COMP_IRQHandler>
	...

0800015c <LL_RCC_HSI_Enable>:
 800015c:	b580      	push	{r7, lr}
 800015e:	af00      	add	r7, sp, #0
 8000160:	4b04      	ldr	r3, [pc, #16]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000162:	681a      	ldr	r2, [r3, #0]
 8000164:	4b03      	ldr	r3, [pc, #12]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000166:	2101      	movs	r1, #1
 8000168:	430a      	orrs	r2, r1
 800016a:	601a      	str	r2, [r3, #0]
 800016c:	46c0      	nop			; (mov r8, r8)
 800016e:	46bd      	mov	sp, r7
 8000170:	bd80      	pop	{r7, pc}
 8000172:	46c0      	nop			; (mov r8, r8)
 8000174:	40021000 	.word	0x40021000

08000178 <LL_RCC_HSI_IsReady>:
 8000178:	b580      	push	{r7, lr}
 800017a:	af00      	add	r7, sp, #0
 800017c:	4b05      	ldr	r3, [pc, #20]	; (8000194 <LL_RCC_HSI_IsReady+0x1c>)
 800017e:	681b      	ldr	r3, [r3, #0]
 8000180:	2202      	movs	r2, #2
 8000182:	4013      	ands	r3, r2
 8000184:	3b02      	subs	r3, #2
 8000186:	425a      	negs	r2, r3
 8000188:	4153      	adcs	r3, r2
 800018a:	b2db      	uxtb	r3, r3
 800018c:	0018      	movs	r0, r3
 800018e:	46bd      	mov	sp, r7
 8000190:	bd80      	pop	{r7, pc}
 8000192:	46c0      	nop			; (mov r8, r8)
 8000194:	40021000 	.word	0x40021000

08000198 <LL_RCC_SetSysClkSource>:
 8000198:	b580      	push	{r7, lr}
 800019a:	b082      	sub	sp, #8
 800019c:	af00      	add	r7, sp, #0
 800019e:	6078      	str	r0, [r7, #4]
 80001a0:	4b06      	ldr	r3, [pc, #24]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001a2:	685b      	ldr	r3, [r3, #4]
 80001a4:	2203      	movs	r2, #3
 80001a6:	4393      	bics	r3, r2
 80001a8:	0019      	movs	r1, r3
 80001aa:	4b04      	ldr	r3, [pc, #16]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001ac:	687a      	ldr	r2, [r7, #4]
 80001ae:	430a      	orrs	r2, r1
 80001b0:	605a      	str	r2, [r3, #4]
 80001b2:	46c0      	nop			; (mov r8, r8)
 80001b4:	46bd      	mov	sp, r7
 80001b6:	b002      	add	sp, #8
 80001b8:	bd80      	pop	{r7, pc}
 80001ba:	46c0      	nop			; (mov r8, r8)
 80001bc:	40021000 	.word	0x40021000

080001c0 <LL_RCC_GetSysClkSource>:
 80001c0:	b580      	push	{r7, lr}
 80001c2:	af00      	add	r7, sp, #0
 80001c4:	4b03      	ldr	r3, [pc, #12]	; (80001d4 <LL_RCC_GetSysClkSource+0x14>)
 80001c6:	685b      	ldr	r3, [r3, #4]
 80001c8:	220c      	movs	r2, #12
 80001ca:	4013      	ands	r3, r2
 80001cc:	0018      	movs	r0, r3
 80001ce:	46bd      	mov	sp, r7
 80001d0:	bd80      	pop	{r7, pc}
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	40021000 	.word	0x40021000

080001d8 <LL_RCC_SetAHBPrescaler>:
 80001d8:	b580      	push	{r7, lr}
 80001da:	b082      	sub	sp, #8
 80001dc:	af00      	add	r7, sp, #0
 80001de:	6078      	str	r0, [r7, #4]
 80001e0:	4b06      	ldr	r3, [pc, #24]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001e2:	685b      	ldr	r3, [r3, #4]
 80001e4:	22f0      	movs	r2, #240	; 0xf0
 80001e6:	4393      	bics	r3, r2
 80001e8:	0019      	movs	r1, r3
 80001ea:	4b04      	ldr	r3, [pc, #16]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001ec:	687a      	ldr	r2, [r7, #4]
 80001ee:	430a      	orrs	r2, r1
 80001f0:	605a      	str	r2, [r3, #4]
 80001f2:	46c0      	nop			; (mov r8, r8)
 80001f4:	46bd      	mov	sp, r7
 80001f6:	b002      	add	sp, #8
 80001f8:	bd80      	pop	{r7, pc}
 80001fa:	46c0      	nop			; (mov r8, r8)
 80001fc:	40021000 	.word	0x40021000

08000200 <LL_RCC_SetAPB1Prescaler>:
 8000200:	b580      	push	{r7, lr}
 8000202:	b082      	sub	sp, #8
 8000204:	af00      	add	r7, sp, #0
 8000206:	6078      	str	r0, [r7, #4]
 8000208:	4b06      	ldr	r3, [pc, #24]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 800020a:	685b      	ldr	r3, [r3, #4]
 800020c:	4a06      	ldr	r2, [pc, #24]	; (8000228 <LL_RCC_SetAPB1Prescaler+0x28>)
 800020e:	4013      	ands	r3, r2
 8000210:	0019      	movs	r1, r3
 8000212:	4b04      	ldr	r3, [pc, #16]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000214:	687a      	ldr	r2, [r7, #4]
 8000216:	430a      	orrs	r2, r1
 8000218:	605a      	str	r2, [r3, #4]
 800021a:	46c0      	nop			; (mov r8, r8)
 800021c:	46bd      	mov	sp, r7
 800021e:	b002      	add	sp, #8
 8000220:	bd80      	pop	{r7, pc}
 8000222:	46c0      	nop			; (mov r8, r8)
 8000224:	40021000 	.word	0x40021000
 8000228:	fffff8ff 	.word	0xfffff8ff

0800022c <LL_RCC_PLL_Enable>:
 800022c:	b580      	push	{r7, lr}
 800022e:	af00      	add	r7, sp, #0
 8000230:	4b04      	ldr	r3, [pc, #16]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000232:	681a      	ldr	r2, [r3, #0]
 8000234:	4b03      	ldr	r3, [pc, #12]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000236:	2180      	movs	r1, #128	; 0x80
 8000238:	0449      	lsls	r1, r1, #17
 800023a:	430a      	orrs	r2, r1
 800023c:	601a      	str	r2, [r3, #0]
 800023e:	46c0      	nop			; (mov r8, r8)
 8000240:	46bd      	mov	sp, r7
 8000242:	bd80      	pop	{r7, pc}
 8000244:	40021000 	.word	0x40021000

08000248 <LL_RCC_PLL_IsReady>:
 8000248:	b580      	push	{r7, lr}
 800024a:	af00      	add	r7, sp, #0
 800024c:	4b07      	ldr	r3, [pc, #28]	; (800026c <LL_RCC_PLL_IsReady+0x24>)
 800024e:	681a      	ldr	r2, [r3, #0]
 8000250:	2380      	movs	r3, #128	; 0x80
 8000252:	049b      	lsls	r3, r3, #18
 8000254:	4013      	ands	r3, r2
 8000256:	22fe      	movs	r2, #254	; 0xfe
 8000258:	0612      	lsls	r2, r2, #24
 800025a:	4694      	mov	ip, r2
 800025c:	4463      	add	r3, ip
 800025e:	425a      	negs	r2, r3
 8000260:	4153      	adcs	r3, r2
 8000262:	b2db      	uxtb	r3, r3
 8000264:	0018      	movs	r0, r3
 8000266:	46bd      	mov	sp, r7
 8000268:	bd80      	pop	{r7, pc}
 800026a:	46c0      	nop			; (mov r8, r8)
 800026c:	40021000 	.word	0x40021000

08000270 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000270:	b580      	push	{r7, lr}
 8000272:	b082      	sub	sp, #8
 8000274:	af00      	add	r7, sp, #0
 8000276:	6078      	str	r0, [r7, #4]
 8000278:	6039      	str	r1, [r7, #0]
 800027a:	4b0e      	ldr	r3, [pc, #56]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800027c:	685b      	ldr	r3, [r3, #4]
 800027e:	4a0e      	ldr	r2, [pc, #56]	; (80002b8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000280:	4013      	ands	r3, r2
 8000282:	0019      	movs	r1, r3
 8000284:	687a      	ldr	r2, [r7, #4]
 8000286:	2380      	movs	r3, #128	; 0x80
 8000288:	025b      	lsls	r3, r3, #9
 800028a:	401a      	ands	r2, r3
 800028c:	683b      	ldr	r3, [r7, #0]
 800028e:	431a      	orrs	r2, r3
 8000290:	4b08      	ldr	r3, [pc, #32]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000292:	430a      	orrs	r2, r1
 8000294:	605a      	str	r2, [r3, #4]
 8000296:	4b07      	ldr	r3, [pc, #28]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000298:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800029a:	220f      	movs	r2, #15
 800029c:	4393      	bics	r3, r2
 800029e:	0019      	movs	r1, r3
 80002a0:	687b      	ldr	r3, [r7, #4]
 80002a2:	220f      	movs	r2, #15
 80002a4:	401a      	ands	r2, r3
 80002a6:	4b03      	ldr	r3, [pc, #12]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a8:	430a      	orrs	r2, r1
 80002aa:	62da      	str	r2, [r3, #44]	; 0x2c
 80002ac:	46c0      	nop			; (mov r8, r8)
 80002ae:	46bd      	mov	sp, r7
 80002b0:	b002      	add	sp, #8
 80002b2:	bd80      	pop	{r7, pc}
 80002b4:	40021000 	.word	0x40021000
 80002b8:	ffc2ffff 	.word	0xffc2ffff

080002bc <LL_FLASH_SetLatency>:
 80002bc:	b580      	push	{r7, lr}
 80002be:	b082      	sub	sp, #8
 80002c0:	af00      	add	r7, sp, #0
 80002c2:	6078      	str	r0, [r7, #4]
 80002c4:	4b06      	ldr	r3, [pc, #24]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002c6:	681b      	ldr	r3, [r3, #0]
 80002c8:	2201      	movs	r2, #1
 80002ca:	4393      	bics	r3, r2
 80002cc:	0019      	movs	r1, r3
 80002ce:	4b04      	ldr	r3, [pc, #16]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002d0:	687a      	ldr	r2, [r7, #4]
 80002d2:	430a      	orrs	r2, r1
 80002d4:	601a      	str	r2, [r3, #0]
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	46bd      	mov	sp, r7
 80002da:	b002      	add	sp, #8
 80002dc:	bd80      	pop	{r7, pc}
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	40022000 	.word	0x40022000

080002e4 <LL_AHB1_GRP1_EnableClock>:
 80002e4:	b580      	push	{r7, lr}
 80002e6:	b084      	sub	sp, #16
 80002e8:	af00      	add	r7, sp, #0
 80002ea:	6078      	str	r0, [r7, #4]
 80002ec:	4b07      	ldr	r3, [pc, #28]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002ee:	6959      	ldr	r1, [r3, #20]
 80002f0:	4b06      	ldr	r3, [pc, #24]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002f2:	687a      	ldr	r2, [r7, #4]
 80002f4:	430a      	orrs	r2, r1
 80002f6:	615a      	str	r2, [r3, #20]
 80002f8:	4b04      	ldr	r3, [pc, #16]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002fa:	695b      	ldr	r3, [r3, #20]
 80002fc:	687a      	ldr	r2, [r7, #4]
 80002fe:	4013      	ands	r3, r2
 8000300:	60fb      	str	r3, [r7, #12]
 8000302:	68fb      	ldr	r3, [r7, #12]
 8000304:	46c0      	nop			; (mov r8, r8)
 8000306:	46bd      	mov	sp, r7
 8000308:	b004      	add	sp, #16
 800030a:	bd80      	pop	{r7, pc}
 800030c:	40021000 	.word	0x40021000

08000310 <LL_GPIO_SetPinMode>:
 8000310:	b580      	push	{r7, lr}
 8000312:	b084      	sub	sp, #16
 8000314:	af00      	add	r7, sp, #0
 8000316:	60f8      	str	r0, [r7, #12]
 8000318:	60b9      	str	r1, [r7, #8]
 800031a:	607a      	str	r2, [r7, #4]
 800031c:	68fb      	ldr	r3, [r7, #12]
 800031e:	6819      	ldr	r1, [r3, #0]
 8000320:	68bb      	ldr	r3, [r7, #8]
 8000322:	68ba      	ldr	r2, [r7, #8]
 8000324:	435a      	muls	r2, r3
 8000326:	0013      	movs	r3, r2
 8000328:	005b      	lsls	r3, r3, #1
 800032a:	189b      	adds	r3, r3, r2
 800032c:	43db      	mvns	r3, r3
 800032e:	400b      	ands	r3, r1
 8000330:	001a      	movs	r2, r3
 8000332:	68bb      	ldr	r3, [r7, #8]
 8000334:	68b9      	ldr	r1, [r7, #8]
 8000336:	434b      	muls	r3, r1
 8000338:	6879      	ldr	r1, [r7, #4]
 800033a:	434b      	muls	r3, r1
 800033c:	431a      	orrs	r2, r3
 800033e:	68fb      	ldr	r3, [r7, #12]
 8000340:	601a      	str	r2, [r3, #0]
 8000342:	46c0      	nop			; (mov r8, r8)
 8000344:	46bd      	mov	sp, r7
 8000346:	b004      	add	sp, #16
 8000348:	bd80      	pop	{r7, pc}

0800034a <LL_GPIO_SetOutputPin>:
 800034a:	b580      	push	{r7, lr}
 800034c:	b082      	sub	sp, #8
 800034e:	af00      	add	r7, sp, #0
 8000350:	6078      	str	r0, [r7, #4]
 8000352:	6039      	str	r1, [r7, #0]
 8000354:	687b      	ldr	r3, [r7, #4]
 8000356:	683a      	ldr	r2, [r7, #0]
 8000358:	619a      	str	r2, [r3, #24]
 800035a:	46c0      	nop			; (mov r8, r8)
 800035c:	46bd      	mov	sp, r7
 800035e:	b002      	add	sp, #8
 8000360:	bd80      	pop	{r7, pc}

08000362 <LL_GPIO_ResetOutputPin>:
 8000362:	b580      	push	{r7, lr}
 8000364:	b082      	sub	sp, #8
 8000366:	af00      	add	r7, sp, #0
 8000368:	6078      	str	r0, [r7, #4]
 800036a:	6039      	str	r1, [r7, #0]
 800036c:	687b      	ldr	r3, [r7, #4]
 800036e:	683a      	ldr	r2, [r7, #0]
 8000370:	629a      	str	r2, [r3, #40]	; 0x28
 8000372:	46c0      	nop			; (mov r8, r8)
 8000374:	46bd      	mov	sp, r7
 8000376:	b002      	add	sp, #8
 8000378:	bd80      	pop	{r7, pc}
	...

0800037c <rcc_config>:
 800037c:	b580      	push	{r7, lr}
 800037e:	af00      	add	r7, sp, #0
 8000380:	2000      	movs	r0, #0
 8000382:	f7ff ff9b 	bl	80002bc <LL_FLASH_SetLatency>
 8000386:	f7ff fee9 	bl	800015c <LL_RCC_HSI_Enable>
 800038a:	46c0      	nop			; (mov r8, r8)
 800038c:	f7ff fef4 	bl	8000178 <LL_RCC_HSI_IsReady>
 8000390:	0003      	movs	r3, r0
 8000392:	2b01      	cmp	r3, #1
 8000394:	d1fa      	bne.n	800038c <rcc_config+0x10>
 8000396:	23a0      	movs	r3, #160	; 0xa0
 8000398:	039b      	lsls	r3, r3, #14
 800039a:	0019      	movs	r1, r3
 800039c:	2000      	movs	r0, #0
 800039e:	f7ff ff67 	bl	8000270 <LL_RCC_PLL_ConfigDomain_SYS>
 80003a2:	f7ff ff43 	bl	800022c <LL_RCC_PLL_Enable>
 80003a6:	46c0      	nop			; (mov r8, r8)
 80003a8:	f7ff ff4e 	bl	8000248 <LL_RCC_PLL_IsReady>
 80003ac:	0003      	movs	r3, r0
 80003ae:	2b01      	cmp	r3, #1
 80003b0:	d1fa      	bne.n	80003a8 <rcc_config+0x2c>
 80003b2:	2000      	movs	r0, #0
 80003b4:	f7ff ff10 	bl	80001d8 <LL_RCC_SetAHBPrescaler>
 80003b8:	2002      	movs	r0, #2
 80003ba:	f7ff feed 	bl	8000198 <LL_RCC_SetSysClkSource>
 80003be:	46c0      	nop			; (mov r8, r8)
 80003c0:	f7ff fefe 	bl	80001c0 <LL_RCC_GetSysClkSource>
 80003c4:	0003      	movs	r3, r0
 80003c6:	2b08      	cmp	r3, #8
 80003c8:	d1fa      	bne.n	80003c0 <rcc_config+0x44>
 80003ca:	2000      	movs	r0, #0
 80003cc:	f7ff ff18 	bl	8000200 <LL_RCC_SetAPB1Prescaler>
 80003d0:	4b02      	ldr	r3, [pc, #8]	; (80003dc <rcc_config+0x60>)
 80003d2:	4a03      	ldr	r2, [pc, #12]	; (80003e0 <rcc_config+0x64>)
 80003d4:	601a      	str	r2, [r3, #0]
 80003d6:	46c0      	nop			; (mov r8, r8)
 80003d8:	46bd      	mov	sp, r7
 80003da:	bd80      	pop	{r7, pc}
 80003dc:	20000000 	.word	0x20000000
 80003e0:	02dc6c00 	.word	0x02dc6c00

080003e4 <gpio_config>:
 80003e4:	b580      	push	{r7, lr}
 80003e6:	b082      	sub	sp, #8
 80003e8:	af00      	add	r7, sp, #0
 80003ea:	6078      	str	r0, [r7, #4]
 80003ec:	2380      	movs	r3, #128	; 0x80
 80003ee:	031b      	lsls	r3, r3, #12
 80003f0:	0018      	movs	r0, r3
 80003f2:	f7ff ff77 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 80003f6:	687b      	ldr	r3, [r7, #4]
 80003f8:	4804      	ldr	r0, [pc, #16]	; (800040c <gpio_config+0x28>)
 80003fa:	2201      	movs	r2, #1
 80003fc:	0019      	movs	r1, r3
 80003fe:	f7ff ff87 	bl	8000310 <LL_GPIO_SetPinMode>
 8000402:	46c0      	nop			; (mov r8, r8)
 8000404:	46bd      	mov	sp, r7
 8000406:	b002      	add	sp, #8
 8000408:	bd80      	pop	{r7, pc}
 800040a:	46c0      	nop			; (mov r8, r8)
 800040c:	48000800 	.word	0x48000800

08000410 <delay>:
 8000410:	0003      	movs	r3, r0
 8000412:	b580      	push	{r7, lr}
 8000414:	1c1e      	adds	r6, r3, #0

08000416 <loop>:
 8000416:	3e01      	subs	r6, #1
 8000418:	2e00      	cmp	r6, #0
 800041a:	d1fc      	bne.n	8000416 <loop>
 800041c:	bd80      	pop	{r7, pc}
 800041e:	46c0      	nop			; (mov r8, r8)

08000420 <parse_str>:
 8000420:	b580      	push	{r7, lr}
 8000422:	b082      	sub	sp, #8
 8000424:	af00      	add	r7, sp, #0
 8000426:	6078      	str	r0, [r7, #4]
 8000428:	2300      	movs	r3, #0
 800042a:	0018      	movs	r0, r3
 800042c:	46bd      	mov	sp, r7
 800042e:	b002      	add	sp, #8
 8000430:	bd80      	pop	{r7, pc}
	...

08000434 <main>:
 8000434:	b590      	push	{r4, r7, lr}
 8000436:	b085      	sub	sp, #20
 8000438:	af00      	add	r7, sp, #0
 800043a:	1d3b      	adds	r3, r7, #4
 800043c:	4a12      	ldr	r2, [pc, #72]	; (8000488 <main+0x54>)
 800043e:	ca13      	ldmia	r2!, {r0, r1, r4}
 8000440:	c313      	stmia	r3!, {r0, r1, r4}
 8000442:	1d3b      	adds	r3, r7, #4
 8000444:	0018      	movs	r0, r3
 8000446:	f7ff ffeb 	bl	8000420 <parse_str>
 800044a:	f7ff ff97 	bl	800037c <rcc_config>
 800044e:	2380      	movs	r3, #128	; 0x80
 8000450:	009b      	lsls	r3, r3, #2
 8000452:	0018      	movs	r0, r3
 8000454:	f7ff ffc6 	bl	80003e4 <gpio_config>
 8000458:	2380      	movs	r3, #128	; 0x80
 800045a:	009b      	lsls	r3, r3, #2
 800045c:	4a0b      	ldr	r2, [pc, #44]	; (800048c <main+0x58>)
 800045e:	0019      	movs	r1, r3
 8000460:	0010      	movs	r0, r2
 8000462:	f7ff ff72 	bl	800034a <LL_GPIO_SetOutputPin>
 8000466:	4b0a      	ldr	r3, [pc, #40]	; (8000490 <main+0x5c>)
 8000468:	0018      	movs	r0, r3
 800046a:	f7ff ffd1 	bl	8000410 <delay>
 800046e:	2380      	movs	r3, #128	; 0x80
 8000470:	009b      	lsls	r3, r3, #2
 8000472:	4a06      	ldr	r2, [pc, #24]	; (800048c <main+0x58>)
 8000474:	0019      	movs	r1, r3
 8000476:	0010      	movs	r0, r2
 8000478:	f7ff ff73 	bl	8000362 <LL_GPIO_ResetOutputPin>
 800047c:	4b05      	ldr	r3, [pc, #20]	; (8000494 <main+0x60>)
 800047e:	0018      	movs	r0, r3
 8000480:	f7ff ffc6 	bl	8000410 <delay>
 8000484:	e7e8      	b.n	8000458 <main+0x24>
 8000486:	46c0      	nop			; (mov r8, r8)
 8000488:	080006fc 	.word	0x080006fc
 800048c:	48000800 	.word	0x48000800
 8000490:	00127c00 	.word	0x00127c00
 8000494:	001b8d80 	.word	0x001b8d80

08000498 <SystemInit>:
 8000498:	b580      	push	{r7, lr}
 800049a:	af00      	add	r7, sp, #0
 800049c:	4b1a      	ldr	r3, [pc, #104]	; (8000508 <SystemInit+0x70>)
 800049e:	681a      	ldr	r2, [r3, #0]
 80004a0:	4b19      	ldr	r3, [pc, #100]	; (8000508 <SystemInit+0x70>)
 80004a2:	2101      	movs	r1, #1
 80004a4:	430a      	orrs	r2, r1
 80004a6:	601a      	str	r2, [r3, #0]
 80004a8:	4b17      	ldr	r3, [pc, #92]	; (8000508 <SystemInit+0x70>)
 80004aa:	685a      	ldr	r2, [r3, #4]
 80004ac:	4b16      	ldr	r3, [pc, #88]	; (8000508 <SystemInit+0x70>)
 80004ae:	4917      	ldr	r1, [pc, #92]	; (800050c <SystemInit+0x74>)
 80004b0:	400a      	ands	r2, r1
 80004b2:	605a      	str	r2, [r3, #4]
 80004b4:	4b14      	ldr	r3, [pc, #80]	; (8000508 <SystemInit+0x70>)
 80004b6:	681a      	ldr	r2, [r3, #0]
 80004b8:	4b13      	ldr	r3, [pc, #76]	; (8000508 <SystemInit+0x70>)
 80004ba:	4915      	ldr	r1, [pc, #84]	; (8000510 <SystemInit+0x78>)
 80004bc:	400a      	ands	r2, r1
 80004be:	601a      	str	r2, [r3, #0]
 80004c0:	4b11      	ldr	r3, [pc, #68]	; (8000508 <SystemInit+0x70>)
 80004c2:	681a      	ldr	r2, [r3, #0]
 80004c4:	4b10      	ldr	r3, [pc, #64]	; (8000508 <SystemInit+0x70>)
 80004c6:	4913      	ldr	r1, [pc, #76]	; (8000514 <SystemInit+0x7c>)
 80004c8:	400a      	ands	r2, r1
 80004ca:	601a      	str	r2, [r3, #0]
 80004cc:	4b0e      	ldr	r3, [pc, #56]	; (8000508 <SystemInit+0x70>)
 80004ce:	685a      	ldr	r2, [r3, #4]
 80004d0:	4b0d      	ldr	r3, [pc, #52]	; (8000508 <SystemInit+0x70>)
 80004d2:	4911      	ldr	r1, [pc, #68]	; (8000518 <SystemInit+0x80>)
 80004d4:	400a      	ands	r2, r1
 80004d6:	605a      	str	r2, [r3, #4]
 80004d8:	4b0b      	ldr	r3, [pc, #44]	; (8000508 <SystemInit+0x70>)
 80004da:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80004dc:	4b0a      	ldr	r3, [pc, #40]	; (8000508 <SystemInit+0x70>)
 80004de:	210f      	movs	r1, #15
 80004e0:	438a      	bics	r2, r1
 80004e2:	62da      	str	r2, [r3, #44]	; 0x2c
 80004e4:	4b08      	ldr	r3, [pc, #32]	; (8000508 <SystemInit+0x70>)
 80004e6:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80004e8:	4b07      	ldr	r3, [pc, #28]	; (8000508 <SystemInit+0x70>)
 80004ea:	490c      	ldr	r1, [pc, #48]	; (800051c <SystemInit+0x84>)
 80004ec:	400a      	ands	r2, r1
 80004ee:	631a      	str	r2, [r3, #48]	; 0x30
 80004f0:	4b05      	ldr	r3, [pc, #20]	; (8000508 <SystemInit+0x70>)
 80004f2:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 80004f4:	4b04      	ldr	r3, [pc, #16]	; (8000508 <SystemInit+0x70>)
 80004f6:	2101      	movs	r1, #1
 80004f8:	438a      	bics	r2, r1
 80004fa:	635a      	str	r2, [r3, #52]	; 0x34
 80004fc:	4b02      	ldr	r3, [pc, #8]	; (8000508 <SystemInit+0x70>)
 80004fe:	2200      	movs	r2, #0
 8000500:	609a      	str	r2, [r3, #8]
 8000502:	46c0      	nop			; (mov r8, r8)
 8000504:	46bd      	mov	sp, r7
 8000506:	bd80      	pop	{r7, pc}
 8000508:	40021000 	.word	0x40021000
 800050c:	f8ffb80c 	.word	0xf8ffb80c
 8000510:	fef6ffff 	.word	0xfef6ffff
 8000514:	fffbffff 	.word	0xfffbffff
 8000518:	ffc0ffff 	.word	0xffc0ffff
 800051c:	fffffeac 	.word	0xfffffeac

08000520 <NMI_Handler>:
 8000520:	b580      	push	{r7, lr}
 8000522:	af00      	add	r7, sp, #0
 8000524:	46c0      	nop			; (mov r8, r8)
 8000526:	46bd      	mov	sp, r7
 8000528:	bd80      	pop	{r7, pc}

0800052a <HardFault_Handler>:
 800052a:	b580      	push	{r7, lr}
 800052c:	af00      	add	r7, sp, #0
 800052e:	e7fe      	b.n	800052e <HardFault_Handler+0x4>

08000530 <SVC_Handler>:
 8000530:	b580      	push	{r7, lr}
 8000532:	af00      	add	r7, sp, #0
 8000534:	46c0      	nop			; (mov r8, r8)
 8000536:	46bd      	mov	sp, r7
 8000538:	bd80      	pop	{r7, pc}

0800053a <PendSV_Handler>:
 800053a:	b580      	push	{r7, lr}
 800053c:	af00      	add	r7, sp, #0
 800053e:	46c0      	nop			; (mov r8, r8)
 8000540:	46bd      	mov	sp, r7
 8000542:	bd80      	pop	{r7, pc}

08000544 <__libc_init_array>:
 8000544:	b570      	push	{r4, r5, r6, lr}
 8000546:	4e0d      	ldr	r6, [pc, #52]	; (800057c <__libc_init_array+0x38>)
 8000548:	4d0d      	ldr	r5, [pc, #52]	; (8000580 <__libc_init_array+0x3c>)
 800054a:	1bad      	subs	r5, r5, r6
 800054c:	10ad      	asrs	r5, r5, #2
 800054e:	d006      	beq.n	800055e <__libc_init_array+0x1a>
 8000550:	2400      	movs	r4, #0
 8000552:	00a3      	lsls	r3, r4, #2
 8000554:	58f3      	ldr	r3, [r6, r3]
 8000556:	3401      	adds	r4, #1
 8000558:	4798      	blx	r3
 800055a:	42a5      	cmp	r5, r4
 800055c:	d1f9      	bne.n	8000552 <__libc_init_array+0xe>
 800055e:	f000 f8c1 	bl	80006e4 <_init>
 8000562:	4e08      	ldr	r6, [pc, #32]	; (8000584 <__libc_init_array+0x40>)
 8000564:	4d08      	ldr	r5, [pc, #32]	; (8000588 <__libc_init_array+0x44>)
 8000566:	1bad      	subs	r5, r5, r6
 8000568:	10ad      	asrs	r5, r5, #2
 800056a:	d006      	beq.n	800057a <__libc_init_array+0x36>
 800056c:	2400      	movs	r4, #0
 800056e:	00a3      	lsls	r3, r4, #2
 8000570:	58f3      	ldr	r3, [r6, r3]
 8000572:	3401      	adds	r4, #1
 8000574:	4798      	blx	r3
 8000576:	42a5      	cmp	r5, r4
 8000578:	d1f9      	bne.n	800056e <__libc_init_array+0x2a>
 800057a:	bd70      	pop	{r4, r5, r6, pc}
 800057c:	0800070c 	.word	0x0800070c
 8000580:	0800070c 	.word	0x0800070c
 8000584:	0800070c 	.word	0x0800070c
 8000588:	08000714 	.word	0x08000714

0800058c <register_fini>:
 800058c:	4b03      	ldr	r3, [pc, #12]	; (800059c <register_fini+0x10>)
 800058e:	b510      	push	{r4, lr}
 8000590:	2b00      	cmp	r3, #0
 8000592:	d002      	beq.n	800059a <register_fini+0xe>
 8000594:	4802      	ldr	r0, [pc, #8]	; (80005a0 <register_fini+0x14>)
 8000596:	f000 f805 	bl	80005a4 <atexit>
 800059a:	bd10      	pop	{r4, pc}
 800059c:	00000000 	.word	0x00000000
 80005a0:	080005b5 	.word	0x080005b5

080005a4 <atexit>:
 80005a4:	b510      	push	{r4, lr}
 80005a6:	0001      	movs	r1, r0
 80005a8:	2300      	movs	r3, #0
 80005aa:	2200      	movs	r2, #0
 80005ac:	2000      	movs	r0, #0
 80005ae:	f000 f81f 	bl	80005f0 <__register_exitproc>
 80005b2:	bd10      	pop	{r4, pc}

080005b4 <__libc_fini_array>:
 80005b4:	b570      	push	{r4, r5, r6, lr}
 80005b6:	4b09      	ldr	r3, [pc, #36]	; (80005dc <__libc_fini_array+0x28>)
 80005b8:	4c09      	ldr	r4, [pc, #36]	; (80005e0 <__libc_fini_array+0x2c>)
 80005ba:	1ae4      	subs	r4, r4, r3
 80005bc:	10a4      	asrs	r4, r4, #2
 80005be:	d009      	beq.n	80005d4 <__libc_fini_array+0x20>
 80005c0:	4a08      	ldr	r2, [pc, #32]	; (80005e4 <__libc_fini_array+0x30>)
 80005c2:	18a5      	adds	r5, r4, r2
 80005c4:	00ad      	lsls	r5, r5, #2
 80005c6:	18ed      	adds	r5, r5, r3
 80005c8:	682b      	ldr	r3, [r5, #0]
 80005ca:	3c01      	subs	r4, #1
 80005cc:	4798      	blx	r3
 80005ce:	3d04      	subs	r5, #4
 80005d0:	2c00      	cmp	r4, #0
 80005d2:	d1f9      	bne.n	80005c8 <__libc_fini_array+0x14>
 80005d4:	f000 f88c 	bl	80006f0 <_fini>
 80005d8:	bd70      	pop	{r4, r5, r6, pc}
 80005da:	46c0      	nop			; (mov r8, r8)
 80005dc:	08000714 	.word	0x08000714
 80005e0:	08000718 	.word	0x08000718
 80005e4:	3fffffff 	.word	0x3fffffff

080005e8 <__retarget_lock_acquire_recursive>:
 80005e8:	4770      	bx	lr
 80005ea:	46c0      	nop			; (mov r8, r8)

080005ec <__retarget_lock_release_recursive>:
 80005ec:	4770      	bx	lr
 80005ee:	46c0      	nop			; (mov r8, r8)

080005f0 <__register_exitproc>:
 80005f0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80005f2:	464e      	mov	r6, r9
 80005f4:	4645      	mov	r5, r8
 80005f6:	46de      	mov	lr, fp
 80005f8:	4657      	mov	r7, sl
 80005fa:	b5e0      	push	{r5, r6, r7, lr}
 80005fc:	4d36      	ldr	r5, [pc, #216]	; (80006d8 <__register_exitproc+0xe8>)
 80005fe:	b083      	sub	sp, #12
 8000600:	0006      	movs	r6, r0
 8000602:	6828      	ldr	r0, [r5, #0]
 8000604:	4698      	mov	r8, r3
 8000606:	000f      	movs	r7, r1
 8000608:	4691      	mov	r9, r2
 800060a:	f7ff ffed 	bl	80005e8 <__retarget_lock_acquire_recursive>
 800060e:	4b33      	ldr	r3, [pc, #204]	; (80006dc <__register_exitproc+0xec>)
 8000610:	681c      	ldr	r4, [r3, #0]
 8000612:	23a4      	movs	r3, #164	; 0xa4
 8000614:	005b      	lsls	r3, r3, #1
 8000616:	58e0      	ldr	r0, [r4, r3]
 8000618:	2800      	cmp	r0, #0
 800061a:	d052      	beq.n	80006c2 <__register_exitproc+0xd2>
 800061c:	6843      	ldr	r3, [r0, #4]
 800061e:	2b1f      	cmp	r3, #31
 8000620:	dc13      	bgt.n	800064a <__register_exitproc+0x5a>
 8000622:	1c5a      	adds	r2, r3, #1
 8000624:	9201      	str	r2, [sp, #4]
 8000626:	2e00      	cmp	r6, #0
 8000628:	d128      	bne.n	800067c <__register_exitproc+0x8c>
 800062a:	9a01      	ldr	r2, [sp, #4]
 800062c:	3302      	adds	r3, #2
 800062e:	009b      	lsls	r3, r3, #2
 8000630:	6042      	str	r2, [r0, #4]
 8000632:	501f      	str	r7, [r3, r0]
 8000634:	6828      	ldr	r0, [r5, #0]
 8000636:	f7ff ffd9 	bl	80005ec <__retarget_lock_release_recursive>
 800063a:	2000      	movs	r0, #0
 800063c:	b003      	add	sp, #12
 800063e:	bc3c      	pop	{r2, r3, r4, r5}
 8000640:	4690      	mov	r8, r2
 8000642:	4699      	mov	r9, r3
 8000644:	46a2      	mov	sl, r4
 8000646:	46ab      	mov	fp, r5
 8000648:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800064a:	4b25      	ldr	r3, [pc, #148]	; (80006e0 <__register_exitproc+0xf0>)
 800064c:	2b00      	cmp	r3, #0
 800064e:	d03d      	beq.n	80006cc <__register_exitproc+0xdc>
 8000650:	20c8      	movs	r0, #200	; 0xc8
 8000652:	0040      	lsls	r0, r0, #1
 8000654:	e000      	b.n	8000658 <__register_exitproc+0x68>
 8000656:	bf00      	nop
 8000658:	2800      	cmp	r0, #0
 800065a:	d037      	beq.n	80006cc <__register_exitproc+0xdc>
 800065c:	22a4      	movs	r2, #164	; 0xa4
 800065e:	2300      	movs	r3, #0
 8000660:	0052      	lsls	r2, r2, #1
 8000662:	58a1      	ldr	r1, [r4, r2]
 8000664:	6043      	str	r3, [r0, #4]
 8000666:	6001      	str	r1, [r0, #0]
 8000668:	50a0      	str	r0, [r4, r2]
 800066a:	3240      	adds	r2, #64	; 0x40
 800066c:	5083      	str	r3, [r0, r2]
 800066e:	3204      	adds	r2, #4
 8000670:	5083      	str	r3, [r0, r2]
 8000672:	3301      	adds	r3, #1
 8000674:	9301      	str	r3, [sp, #4]
 8000676:	2300      	movs	r3, #0
 8000678:	2e00      	cmp	r6, #0
 800067a:	d0d6      	beq.n	800062a <__register_exitproc+0x3a>
 800067c:	009a      	lsls	r2, r3, #2
 800067e:	4692      	mov	sl, r2
 8000680:	4482      	add	sl, r0
 8000682:	464a      	mov	r2, r9
 8000684:	2188      	movs	r1, #136	; 0x88
 8000686:	4654      	mov	r4, sl
 8000688:	5062      	str	r2, [r4, r1]
 800068a:	22c4      	movs	r2, #196	; 0xc4
 800068c:	0052      	lsls	r2, r2, #1
 800068e:	4691      	mov	r9, r2
 8000690:	4481      	add	r9, r0
 8000692:	464a      	mov	r2, r9
 8000694:	3987      	subs	r1, #135	; 0x87
 8000696:	4099      	lsls	r1, r3
 8000698:	6812      	ldr	r2, [r2, #0]
 800069a:	468b      	mov	fp, r1
 800069c:	430a      	orrs	r2, r1
 800069e:	4694      	mov	ip, r2
 80006a0:	464a      	mov	r2, r9
 80006a2:	4661      	mov	r1, ip
 80006a4:	6011      	str	r1, [r2, #0]
 80006a6:	2284      	movs	r2, #132	; 0x84
 80006a8:	4641      	mov	r1, r8
 80006aa:	0052      	lsls	r2, r2, #1
 80006ac:	50a1      	str	r1, [r4, r2]
 80006ae:	2e02      	cmp	r6, #2
 80006b0:	d1bb      	bne.n	800062a <__register_exitproc+0x3a>
 80006b2:	0002      	movs	r2, r0
 80006b4:	465c      	mov	r4, fp
 80006b6:	328d      	adds	r2, #141	; 0x8d
 80006b8:	32ff      	adds	r2, #255	; 0xff
 80006ba:	6811      	ldr	r1, [r2, #0]
 80006bc:	430c      	orrs	r4, r1
 80006be:	6014      	str	r4, [r2, #0]
 80006c0:	e7b3      	b.n	800062a <__register_exitproc+0x3a>
 80006c2:	0020      	movs	r0, r4
 80006c4:	304d      	adds	r0, #77	; 0x4d
 80006c6:	30ff      	adds	r0, #255	; 0xff
 80006c8:	50e0      	str	r0, [r4, r3]
 80006ca:	e7a7      	b.n	800061c <__register_exitproc+0x2c>
 80006cc:	6828      	ldr	r0, [r5, #0]
 80006ce:	f7ff ff8d 	bl	80005ec <__retarget_lock_release_recursive>
 80006d2:	2001      	movs	r0, #1
 80006d4:	4240      	negs	r0, r0
 80006d6:	e7b1      	b.n	800063c <__register_exitproc+0x4c>
 80006d8:	20000430 	.word	0x20000430
 80006dc:	08000708 	.word	0x08000708
 80006e0:	00000000 	.word	0x00000000

080006e4 <_init>:
 80006e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80006e6:	46c0      	nop			; (mov r8, r8)
 80006e8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80006ea:	bc08      	pop	{r3}
 80006ec:	469e      	mov	lr, r3
 80006ee:	4770      	bx	lr

080006f0 <_fini>:
 80006f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80006f2:	46c0      	nop			; (mov r8, r8)
 80006f4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80006f6:	bc08      	pop	{r3}
 80006f8:	469e      	mov	lr, r3
 80006fa:	4770      	bx	lr
