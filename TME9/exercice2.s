.data
N: .word 5
mat: .word 1 1 1 1 1 
	.word 2 2 2 2 2
	.word 3 3 3 3 3
	.word 4 4 4 4 4
	.word 5 5 5 5 5

.text
lui $5 0x1001	#$5 = @N
addi $6 $5 4	#$6 = @mat
lw $7 0($5)	#$7 = N

ori $8 $0 0 	#i
for1:
	slt $18 $8 $7
	beq $18 $0 finfor1
	
	ori $9 $0 0 	#j
	for2:
		slt $19 $9 $7
		beq $19 $0 finfor2
		
		jal printValue
		jal printEspace
		addi $6 $6 4
		addi $9 $9 1
		j for2
	
	finfor2:
		jal printBackSlashN
		addi $8 $8 1
		j for1
	
finfor1:
	ori $2 $0 10
	syscall




printBackSlashN:
	ori $2 $0 11
	ori $4 $0 '\n'
	syscall
	jr $31
printEspace:
	ori $2 $0 11
	ori $4 $0 ' '
	syscall
	jr $31
printValue:
	ori $2 $0 1
	lw $4 0($6)
	syscall
	jr $31
