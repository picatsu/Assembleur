.data
V: .word 6
tab: .word 5 4 3 6 7 8 2 9 -1

.text
lui $3 0x1001 		#$3 = @V

lui $10 0x1001 	#$10 = @tab
addi $10 $10 4

addi $8 $0 -1	#$8 = -1
ori $5 $0 0	#$5 = i


while:
	lw $6 0($3)	#$6 = V
	lw $11 0($10)	#$11 = tab[i]
	 
	if: beq $11 $8 finwhile
		
	slt $12 $11 $6 			#$12 : 1 si tab[i]<V, 0 sinon
	if2: beq $12 $0 else 		#si $12 = 0 alors on va dans else
	addi $5 $5 1
	else: 
		addi $10 $10 4
		j while

finwhile:
	ori $2 $0 1
	ori $4 $5 0
	syscall
	
	ori $2 $0 10
	
