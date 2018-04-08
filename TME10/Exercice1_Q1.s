.data
ch: .asciiz "machainech"

.text
lui $20, 0x1001
ori $21 $20 0

#AFFICHAGE
ori $2 $0 4
ori $4 $20 0
syscall

while:
	lb $6 0($20) 
	beq $6 $0 finwhile
	addi $6 $6 -0x20
	sb $6 0($20)
	addi $20 $20 1
	j while

finwhile:
	ori $2 $0 4
	ori $4 $21 0
	syscall

ori $2 $0 10
syscall
