.text
	addi a0, zero, 1
	addi a1, zero, 2
	add a2, a0, a1
	sub a3, a0, a1
	or a4, a0, a1
	and a5, a0, a1
	xor a6, a0, a1
	sll a4, a4, a1
	srl a6, a6, a0
	sra a3, a3, a1
	
	addi a0, zero, 5
	lui a1, 0x80100
	addi a1, a1, 0x10
loop:
	srai a1, a1, 1
	addi a0, a0, -1
	bne a0, zero, loop
