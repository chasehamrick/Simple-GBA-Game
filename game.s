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
	.file	"game.c"
	.text
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldmia	r0, {r2, r3}	@ phole ldm
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L2
	ldr	r2, [r0, #16]
	rsb	r2, r2, #240
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r0, #4]
.L2:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bxne	lr
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	cmp	r3, r2
	subgt	r3, r3, #1
	strgt	r3, [r0, #4]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	cmp	r1, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	bxeq	lr
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	cmp	r3, #161
	str	r3, [r0, #0]
	ldrgt	r3, [r0, #16]
	movgt	r2, #0
	rsbgt	r3, r3, #0
	strgt	r2, [r0, #32]
	strgt	r3, [r0, #0]
	bx	lr
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	cmp	r1, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	bxeq	lr
	ldr	r2, [r0, #24]
	rsb	r3, r2, r3
	cmn	r3, #10
	str	r3, [r0, #0]
	movlt	r3, #0
	strlt	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	ip, #0
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldr	r0, [r0, #8]
	ldr	r5, .L10
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #24]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	ip, #0
	add	r1, r4, #12
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	ldr	r5, .L13
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #36]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #12
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	beq	.L15
	ldr	r0, [r0, #8]
	add	r1, r4, #12
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	mov	ip, #0
	ldr	r5, .L17
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #36]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
.L15:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	drawRectInBounds
	.size	drawEnemy, .-drawEnemy
	.ident	"GCC: (devkitARM release 31) 4.5.0"
