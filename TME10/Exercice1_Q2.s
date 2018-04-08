.data
ch1 : .asciiz "machaineprems"
ch2: .asciiz "deuxiemechaine"

.text
j main

f:
	addiu $29 $29 -12
	sw $31 0($29)	#$31
	sw $5 4($29)	#@ch
	sw $6 8($29)	#ch[i]
	
	lw $5 12($29)
	
	while:
		lb $6 0($5) 
		beq $6 $0 finwhile
		addi $6 $6 -0x20
		sb $6 0($5)
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
	
	addi $20 $20 14	#14 car il y a 13 caracteres + le \0
	
	addiu $29 $29 -4
	sw $20 0($29)
	jal f
	addiu $29 $29 4
	ori $4 $20 0
	ori $2 $0 4
	syscall

ori $2 $0 10
syscall



