.data
p:.word 3
m:.word 5

.text
j main

puissance:
	### PROLOGUE ###
	addiu $29 $29 -20
	sw $31 0($29)
	sw $5 4($29)	#x
	sw $6 8($29)	#n
	sw $7 12($29)	#tmp: 1, puis 2, puis n/2
	sw $8 16($29)	#res
	lw $5 20($29)
	lw $6 24($29)


	### CORPS ###
	ori $7 $0 1	#tmp = 1
	
	if:
	bne $6 $0 if2	#if n==0
	ori $2 $7 0	#return 1
	j endif
	
	if2:
	bne $6 $7 else	#if n==1
	ori $2 $5 0	#return x
	j endif
	
	else:
	ori $7 $0 2
	div $6 $7
	mflo $7
	addiu $29 $29 -8
	sw $5 0($29)
	sw $7 4($29)
	jal puissance	#appel recursif
	lw $5 0($29)
	lw $7 4($29)
	addiu $29 $29 8
	
	ori $8 $2 0
	
		if3:
		andi $7 $6 0x01
		beq $7 $0 else3
		mult $5 $8	#x * res
		mflo $7
		mult $7 $8	#x * res * res
		mflo $2
		j endif
		
		else3:
		mult $8 $8
		mflo $2
		j endif
	
	### EPILOGUE ###
	endif:
	lw $31 0($29)
	lw $5 4($29)
	lw $6 8($29)
	lw $7 12($29)
	lw $8 16($29)
	addiu $29 $29 20
	jr $31
	
main:
	lui $20 0x1001
	lw $5 0($20)
	lw $6 4($20)
	
	addiu $29 $29 -8
	sw $5 0($29)
	sw $6 4($29)
	jal puissance
	lw $5 0($29)
	lw $6 4($29)
	addiu $29 $29 8

	ori $4 $2 0
	ori $2 $0 1
	syscall		#printf
	
	ori $2 $0 10
	syscall		#arret du programme







