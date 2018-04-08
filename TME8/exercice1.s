.data


.text
ori $5 $0  1 	#i = 1
ori $6 $0 0	#somme = 0

for:
	slti $7 $5 11		# $7 = (i < 11)? 1 : 0
	
	beq $7 $0 finfor	#if !(i<11)
	
	add $6 $6 $5
	addi $5 $5 1
	j for
	
finfor:
	ori $2 $0 1
	ori $4 $6 0
	syscall
	
	
	ori $2 $0 10
	syscall