.data
p:.word 5

.text
j main
fact:
	addiu $29 $29 -12
	sw $31 0($29)
	sw $5 4($29)
	sw $6 8($29)
	lw $5 12($29)
	
	if:
	bne $5 $0 else
	ori $2 $0 1
	j endif
	
	else:
	addiu $29 $29 -4
	addi $6 $5 -1
	sw $6 0($29)
	jal fact
	ori $6 $2 0
	addiu $29 $29 4
	mult $5 $6
	mflo $2
	
	endif:
	lw $31 0($29)
	lw $5 4($29)
	addiu $29 $29 12
	jr $31

main:
	lui $20 0x1001
	lw $5 0($20)		#p
	
	addiu $29 $29 -4
	sw $5 0($29)
	jal fact
	addiu $29 $29 4
	
	ori $4 $2 0
	ori $2 $0 1
	syscall
	
	ori $2 $0 10
	syscall