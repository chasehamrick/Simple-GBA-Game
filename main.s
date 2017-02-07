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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31744
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+4
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #0
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+4
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #30464
	stmfd	sp!, {r3, lr}
	add	r0, r0, #189
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L13+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	mov	r2, #3
	str	r2, [r3, #0]
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	collisionCheckEnemyPlayer
	.type	collisionCheckEnemyPlayer, %function
collisionCheckEnemyPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #16]
	ldr	r2, [r0, #4]
	add	ip, r3, ip
	cmp	r2, ip
	bxgt	lr
	ldr	ip, [r0, #20]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	ip, [r0, #16]
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	add	r2, ip, r2
	cmp	r2, r3
	movge	r3, #1
	strgeb	r3, [r1, #26]
	bx	lr
	.size	collisionCheckEnemyPlayer, .-collisionCheckEnemyPlayer
	.align	2
	.global	collisionCheckEnemyBullet
	.type	collisionCheckEnemyBullet, %function
collisionCheckEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #12
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #20]
	mov	r4, r0
	ldr	r0, [r0, #4]
	add	r3, r2, r3
	cmp	r0, r3
	bgt	.L20
	ldr	r3, [r4, #20]
	add	r0, r3, r0
	cmp	r2, r0
	bgt	.L20
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #0]
	ldr	r1, [r1, #0]
	add	r0, r2, r0
	cmp	r0, r1
	bge	.L22
.L20:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L22:
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r5, #0
	ldr	ip, .L23
	str	r5, [sp, #0]
	mov	lr, pc
	bx	ip
	str	r5, [r4, #32]
	b	.L20
.L24:
	.align	2
.L23:
	.word	drawRect
	.size	collisionCheckEnemyBullet, .-collisionCheckEnemyBullet
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L50
	sub	sp, sp, #12
	ldr	r2, [r3, #0]
	ldr	r4, .L50+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	mov	r0, r2
	ldr	r3, .L50+8
	ldr	r1, [r4, #0]
	mov	lr, pc
	bx	r3
	subs	r3, r1, #0
	ldrne	fp, .L50+12
	bne	.L26
	ldr	fp, .L50+12
	ldr	r0, [fp, #0]
	cmp	r0, #0
	ble	.L26
	ldr	r2, .L50+16
	ldr	r1, [r2, #32]
	str	r2, [sp, #4]
	cmp	r1, #0
	ldrne	r2, [sp, #4]
	bne	.L29
	b	.L27
.L30:
	ldr	r1, [r2, #72]
	cmp	r1, #0
	add	r2, r2, #40
	mov	r1, r3
	beq	.L27
.L29:
	add	r3, r3, #1
	cmp	r3, r0
	blt	.L30
.L26:
	ldr	r0, .L50+20
	ldr	r3, .L50+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L50+28
	ldr	r3, [r0, #0]
	ldr	r2, .L50+28
	add	r3, r3, #1
	mov	r0, r3
	str	r3, [r2, #0]
	bl	makeStarBG
	ldr	r3, [fp, #0]
	cmp	r3, #0
	ldrle	r6, .L50+32
	ble	.L31
	ldr	sl, .L50+36
	sub	r3, sl, #4
	ldr	r9, .L50+20
	ldr	r6, .L50+32
	ldr	r7, .L50+40
	str	r3, [sp, #4]
	mov	r8, #0
.L35:
	ldr	r0, [sp, #4]
	add	r5, r8, r8, asl #2
	add	r5, r0, r5, asl #3
	ldr	r2, .L50+44
	mov	r0, r5
	mov	lr, pc
	bx	r2
	ldr	r3, [r9, #4]
	ldr	r1, [r9, #16]
	ldr	r2, [sl, #0]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L32
	ldr	r1, [sl, #16]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L32
	ldr	r0, .L50+20
	ldr	r1, [sl, #12]
	ldr	r2, [sl, #-4]
	ldr	r3, [r0, #0]
	add	r2, r1, r2
	cmp	r2, r3
	movge	r2, #1
	strgeb	r2, [r0, #26]
.L32:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L33
	mov	r4, #0
.L34:
	add	r1, r4, r4, asl #2
	mov	r0, r5
	add	r1, r7, r1, asl #3
	bl	collisionCheckEnemyBullet
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L34
.L33:
	ldr	r3, [fp, #0]
	add	r8, r8, #1
	cmp	r3, r8
	add	sl, sl, #40
	bgt	.L35
.L31:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L36
	ldr	r7, .L50+40
	ldr	r5, .L50+48
	mov	r4, #0
.L37:
	add	r0, r4, r4, asl #2
	add	r0, r7, r0, asl #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L37
.L36:
	ldr	r2, .L50+52
	ldr	r2, [r2, #0]
	tst	r2, #2
	beq	.L38
	ldr	r2, .L50+56
	ldr	r2, [r2, #0]
	tst	r2, #2
	bne	.L38
	ldr	r1, .L50+60
	ldr	r2, [r1, #0]
	add	r2, r2, #1
	cmp	r3, r2
	str	r2, [r1, #0]
	ble	.L38
	mov	r3, #40
	mul	r2, r3, r2
	ldr	r1, .L50+40
	ldr	r0, .L50+20
	add	r3, r1, r2
	ldr	r5, [r3, #32]
	ldmia	r0, {r4, ip}	@ phole ldm
	add	r4, r4, #1
	add	ip, ip, #2
	rsbs	r0, r5, #1
	movcc	r0, #0
	str	r4, [r1, r2]
	str	ip, [r3, #4]
	str	r0, [r3, #32]
.L38:
	ldr	r0, .L50+28
	ldr	r3, [r0, #0]
	cmp	r3, #100
	moveq	r2, #0
	moveq	r3, r0
	streq	r2, [r3, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L27:
	ldr	r3, [sp, #4]
	add	r1, r1, r1, asl #2
	add	r5, r3, r1, asl #3
	ldr	r3, [r5, #16]
	ldr	r0, [sp, #4]
	rsb	r3, r3, #0
	mov	r2, #1
	str	r3, [r0, r1, asl #3]
	ldr	r6, .L50+64
	str	r2, [r5, #32]
	mov	lr, pc
	bx	r6
	ldr	r7, .L50+68
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	ldr	r7, .L50+72
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r0
	add	r3, r3, #5
	str	r3, [r5, #20]
	mov	lr, pc
	bx	r6
	smull	r2, r7, r0, r7
	mov	r3, r0, asr #31
	rsb	r3, r3, r7, asr #1
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r0
	add	r3, r3, #5
	str	r3, [r5, #16]
	mov	lr, pc
	bx	r6
	and	r3, r0, #1
	add	r3, r3, #1
	str	r3, [r5, #24]
	mov	lr, pc
	bx	r6
	ldr	r2, .L50+76
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	rsb	r0, r3, r0
	str	r0, [r4, #0]
	b	.L26
.L51:
	.align	2
.L50:
	.word	time
	.word	timeToNextEnemy
	.word	__aeabi_idivmod
	.word	enemyCount
	.word	enemies
	.word	player
	.word	updatePlayer
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	enemies+4
	.word	bullets
	.word	updateEnemy
	.word	updateBullet
	.word	oldButtons
	.word	buttons
	.word	numberOfBullets
	.word	rand
	.word	-2004318071
	.word	1717986919
	.word	458129845
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r6, .L61
	ldr	r3, .L61+4
	ldr	r0, .L61+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L53
	ldr	r7, .L61+12
	ldr	r8, .L61+16
	mov	r5, r7
	mov	r4, #0
	b	.L55
.L54:
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #40
	ble	.L53
.L55:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L54
	add	r0, r4, r4, asl #2
	add	r0, r7, r0, asl #3
	mov	lr, pc
	bx	r8
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #40
	bgt	.L55
.L53:
	ldr	r6, .L61+20
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L52
	ldr	r7, .L61+24
	ldr	r8, .L61+28
	mov	r5, r7
	mov	r4, #0
	b	.L58
.L57:
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #40
	ble	.L52
.L58:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L57
	add	r0, r4, r4, asl #2
	add	r0, r7, r0, asl #3
	mov	lr, pc
	bx	r8
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #40
	bgt	.L58
.L52:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	enemyCount
	.word	drawPlayer
	.word	player
	.word	enemies
	.word	drawEnemy
	.word	.LANCHOR1
	.word	bullets
	.word	drawBullet
	.size	draw, .-draw
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L71
	ldrb	r3, [r4, #26]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L68
.L64:
	ldr	r3, .L71+4
	mov	r2, #3
	str	r2, [r3, #0]
.L63:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L68:
	ldr	r5, .L71+8
	bl	update
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r5, #0]
	tst	r3, #4
	beq	.L65
	ldr	r2, .L71+16
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L69
.L65:
	tst	r3, #8
	beq	.L66
	ldr	r3, .L71+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L70
.L66:
	ldrb	r3, [r4, #26]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L63
	b	.L64
.L69:
	bl	goToSplash
	ldr	r3, [r5, #0]
	b	.L65
.L70:
	bl	goToPause
	b	.L66
.L72:
	.align	2
.L71:
	.word	player
	.word	state
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	updateGame, .-updateGame
	.align	2
	.global	drawStars
	.type	drawStars, %function
drawStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r5, #30464
	add	r5, r5, #189
	mov	r7, r0
	ldr	r4, .L74
	mov	r6, r1
	mov	r2, r5
	mov	lr, pc
	bx	r4
	add	r8, r7, r7, asl #1
	sub	r0, r7, #1
	sub	r1, r6, #1
	mov	r2, #0
	add	r6, r6, r6, asl #1
	mov	lr, pc
	bx	r4
	sub	r0, r8, #120
	sub	r1, r6, #42
	mov	r2, r5
	mov	lr, pc
	bx	r4
	sub	r0, r8, #123
	sub	r1, r6, #45
	mov	r2, #0
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	setPixel
	.size	drawStars, .-drawStars
	.align	2
	.global	makeStarBG
	.type	makeStarBG, %function
makeStarBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	add	r5, r0, #20
	mov	r4, r0
	mov	r1, r5
	bl	drawStars
	add	r7, r4, #46
	add	r0, r4, #10
	add	r1, r4, #15
	bl	drawStars
	add	r0, r4, #30
	mov	r1, r7
	bl	drawStars
	add	r6, r4, #66
	add	r0, r4, #45
	add	r1, r4, #93
	bl	drawStars
	mov	r0, r6
	add	r1, r4, #80
	bl	drawStars
	add	r0, r4, #2
	add	r1, r4, #3
	bl	drawStars
	mov	r0, r4
	mov	r1, r5
	bl	drawStars
	mov	r0, r4
	add	r1, r4, #40
	bl	drawStars
	mov	r0, r5
	add	r1, r4, #60
	bl	drawStars
	add	r0, r4, #50
	mov	r1, r7
	bl	drawStars
	add	r0, r4, #90
	add	r1, r4, #44
	bl	drawStars
	add	r1, r4, #36
	add	r0, r4, #74
	bl	drawStars
	mov	r0, r6
	add	r1, r4, #70
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	drawStars
	.size	makeStarBG, .-makeStarBG
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L83
	sub	sp, sp, #84
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r0, #5
	mov	r1, #10
	bl	drawStars
	mov	r0, #20
	mov	r1, #5
	bl	drawStars
	mov	r0, #15
	mov	r1, #35
	bl	drawStars
	mov	r0, #32
	mov	r1, #33
	bl	drawStars
	mov	r0, #30
	mov	r1, #50
	bl	drawStars
	mov	r0, #30
	mov	r1, #70
	bl	drawStars
	mov	r0, #50
	mov	r1, #90
	bl	drawStars
	mov	r0, #80
	mov	r1, #76
	bl	drawStars
	mov	r0, #120
	mov	r1, #74
	bl	drawStars
	mov	r0, #104
	mov	r1, #76
	bl	drawStars
	mov	r0, #96
	mov	r1, #100
	bl	drawStars
	ldr	r3, .L83+4
	mov	ip, #5
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	mov	r2, #32512
	mov	ip, #155
	mov	r6, #0
	str	ip, [r3, #0]
	add	r2, r2, #224
	mov	ip, #118
	str	r6, [r3, #8]
	str	r6, [r3, #12]
	str	ip, [r3, #4]
	strh	r2, [r3, #24]	@ movhi
	strb	r6, [r3, #26]
	mov	r3, #20
	mov	r0, #6
	str	r3, [sp, #64]
	ldr	r3, .L83+8
	str	r0, [sp, #56]
	str	r0, [sp, #60]
	mov	r0, #15
	ldr	r4, .L83+12
	str	r0, [r3, #0]
	mov	r3, #10
	mov	r1, #3
	str	r3, [sp, #24]
	mov	r3, #31	@ movhi
	str	r6, [r4, #0]
	str	r6, [sp, #40]
	str	r6, [sp, #44]
	str	r6, [sp, #48]
	str	r6, [sp, #52]
	str	r6, [sp, #68]
	str	r6, [sp, #72]
	str	r1, [sp, #20]
	str	r1, [sp, #16]
	str	r6, [sp, #28]
	strh	r2, [sp, #36]	@ movhi
	ldr	r7, .L83+16
	strh	r3, [sp, #76]	@ movhi
	add	r8, sp, #40
.L78:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #40
	ldmia	r4, {r0, r1}
	cmp	r6, #600
	stmia	ip, {r0, r1}
	bne	.L78
	ldr	r3, .L83+20
	ldr	r8, [r3, #0]
	cmp	r8, #0
	ble	.L79
	add	r8, r8, r8, asl #2
	ldr	r7, .L83+24
	mov	r8, r8, asl #3
	mov	r6, #0
	mov	sl, sp
.L80:
	mov	r4, sl
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #40
	ldmia	r4, {r0, r1}
	cmp	r6, r8
	stmia	ip, {r0, r1}
	bne	.L80
.L79:
	ldr	r3, .L83+28
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #84
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	fillScreen
	.word	player
	.word	enemyCount
	.word	numberOfBullets
	.word	enemies
	.word	.LANCHOR1
	.word	bullets
	.word	time
	.size	initialize, .-initialize
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToGame
	.size	updateLose, .-updateLose
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L88
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L86
	ldr	r3, .L88+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	bne	.L86
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L86:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	oldButtons
	.word	buttons
	.size	updateSplash, .-updateSplash
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #1024
	add	r3, r3, #3
	mov	r5, #67108864
	strh	r3, [r5, #0]	@ movhi
	bl	initialize
	bl	goToSplash
	ldr	r4, .L101
	ldr	r7, .L101+4
	ldr	r6, .L101+8
.L100:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L92:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L92
.L97:
	.word	.L93
	.word	.L94
	.word	.L95
	.word	.L96
.L96:
	bl	updateLose
	b	.L100
.L95:
	bl	updatePause
	b	.L100
.L94:
	bl	updateGame
	b	.L100
.L93:
	bl	updateSplash
	b	.L100
.L102:
	.align	2
.L101:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	maxBullets
	.global	j
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.comm	state,4,4
	.comm	player,28,4
	.comm	enemies,600,4
	.comm	enemyCount,4,4
	.comm	timeToNextEnemy,4,4
	.comm	bullets,400,4
	.comm	numberOfBullets,4,4
	.comm	time,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	maxBullets, %object
	.size	maxBullets, 4
maxBullets:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	j, %object
	.size	j, 4
j:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
