.data
ch: .asciiz ""

.text
lui $3 0x1001 	#$3 = @ch
ori $5 $0 0	#$5 = i


while:
	lb $6 0($3)
	
	if: beq $6 $0 finwhile
	addi $3 $3 1
	addi $5 $5 1
	
	j while

finwhile:
	ori $2 $0 1
	ori $4 $5 0
	syscall
	
	ori $2 $0 10
	syscall