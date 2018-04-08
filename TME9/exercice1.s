.data
ch: .space 10 

.text
nb :	ori $5 $0 0 
q: ori $6 $0 0
r: ori $7 $0 0

cpt:
lui $20 0x1001
ori $2 $0 5	#scanf
syscall

ori $5 $2 0 	#nb = valeur scanf
ori $6 $5 0	#q = nb
ori $10 $0 10

do1:
	div $6 $10
	mflo $6
	addi $20 $20 1		#cpt++
	beq $6 $0 findowhile1
	j do1
findowhile1:
	sb $0 0($20)	
	ori $6 $5 0		#q = nb
	
do2:
	div $6 $10		#q / 10
	mfhi $7			# r = reste
	mflo $6			#q = quotient
	addi $20 $20 -1	#cpt--
	addi $15 $7 0x30	#r+0x30	
	sb $15 0($20)
	
	lui $17 0x1001
	xor $18 $20 $17
	blez $18 findowhile2
	
	j do2
findowhile2:
	ori $2 $0 4
	lui $4 0x1001
	syscall
	
	ori $2 $0 10
	syscall	