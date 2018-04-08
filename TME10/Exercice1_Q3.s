.data
ch1: .asciiz "Une chaine_exemple"
ch2:.asciiz "l autre Test"

.text
j main

min_to_maj:
	addiu $29 $29 -28
	sw $31 0($29)
	sw $5 4($29)		#c
	sw $6 8($29)		# >=
	sw $7 12($29)		# <=
	sw $8 16($29)		# &&
	sw $9 20($29)		#'a'
	sw $10 24($29)	#'z'
	lb $5 28($29)

	ori $9 $0 'a'
	ori $10 $0 'z'
	
	slt $6 $5 $9  # $6 = 1 si c < a
	slt $7 $10 $5  #7 = 1 si z < c
	
	or $8 $6 $7
	bne $8 $0 else
	
	if:
		addi $5 $5 -0x20
	else:
	ori $2 $5 0
	lw $31 0($29)
	lw $5 4($29)
	lw $6 8($29)
	lw $7 12($29)
	lw $8 16($29)
	lw $9 20($29)
	lw $10 24($29)	
	addiu $29 $29 28
	jr $31
		
	

f:
	addiu $29 $29 -12
	sw $31 0($29)	#$31
	sw $5 4($29)	#@ch
	sw $6 8($29)	#ch[i]
	
	lw $5 12($29)
	
	while:
		lb $6 0($5)
		beq $6 $0 finwhile
		
		addiu $29 $29 -4
		sb $6 0($29)
		jal min_to_maj
		
		addiu $29 $29 4
	
		sb $2 0($5)
		
		addi $5 $5 1
		j while
	
	finwhile:
		lw $31 0($29)
		lw $5 4($29)
		lw $6 8($29)
		addiu $29 $29 12
		jr $31

main:
	lui $20 0x1001
	
	addiu $29 $29 -4
	sw $20 0($29)
	jal f
	addiu $29 $29 4
	ori $4 $20 0
	ori $2 $0 4
	syscall
	
	addi $20 $20 19
	
	addiu $29 $29 -4
	sw $20 0($29)
	jal f
	addiu $29 $29 4
	ori $4 $20 0
	ori $2 $0 4
	syscall

ori $2 $0 10
syscall