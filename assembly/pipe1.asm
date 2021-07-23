.text
	addi a0, zero, 5
	lui a1, 0x80100
	addi a1, a1, 0x10	# data hazard
loop:
	srai a1, a1, 1
	addi a0, a0, -1
	bne a0, zero, loop	# control hazard
	lui a0, 0xf8f8f
	addi s0, zero, 0
	sw a0, 4(s0)
	lw a1, 4(s0)
	srli a2, a1, 3  	# load-use hazard
