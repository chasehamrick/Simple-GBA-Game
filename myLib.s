	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	cmp	r2, #0
	ldrh	ip, [sp, #8]
	ble	.L1
	rsb	r0, r0, r0, asl #4
	add	r1, r1, r0, asl #4
	mov	r5, r1, asl #1
	add	r5, r5, #100663296
	mov	r4, #0
.L3:
	cmp	r3, #0
	movgt	r0, r5
	movgt	r1, #0
	ble	.L5
.L4:
	add	r1, r1, #1
	cmp	r1, r3
	strh	ip, [r0], #2	@ movhi
	bne	.L4
.L5:
	add	r4, r4, #1
	cmp	r4, r2
	add	r5, r5, #480
	bne	.L3
.L1:
	ldmfd	sp!, {r4, r5}
	bx	lr
	.size	drawRect, .-drawRect
	.align	2
	.global	drawRectInBounds
	.type	drawRectInBounds, %function
drawRectInBounds:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	cmp	r2, #0
	ldrh	r8, [sp, #20]
	ble	.L9
	rsb	r7, r0, r0, asl #4
	add	r7, r1, r7, asl #4
	mov	r7, r7, asl #1
	add	r7, r7, #100663296
	mov	r5, r0
	mov	r6, #0
.L11:
	cmp	r3, #0
	subgt	r0, r1, #1
	movgt	r4, r7
	movgt	ip, #0
	ble	.L14
.L13:
	cmp	r0, #238
	add	ip, ip, #1
	bhi	.L12
	cmp	r5, #0
	ble	.L12
	cmp	r5, #159
	strleh	r8, [r4, #0]	@ movhi
.L12:
	cmp	ip, r3
	add	r0, r0, #1
	add	r4, r4, #2
	bne	.L13
.L14:
	add	r6, r6, #1
	cmp	r6, r2
	add	r7, r7, #480
	add	r5, r5, #1
	bne	.L11
.L9:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.size	drawRectInBounds, .-drawRectInBounds
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	strh	r2, [r0, #0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L18:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L18
	mov	r2, #67108864
.L20:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L20
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #100663296
	ldr	r2, .L26
	sub	r3, r3, #2
.L24:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L24
	bx	lr
.L27:
	.align	2
.L26:
	.word	100740094
	.size	fillScreen, .-fillScreen
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #29952
	sub	sp, sp, #8
	add	r3, r3, #48
.L29:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L29
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.ident	"GCC: (devkitARM release 31) 4.5.0"
