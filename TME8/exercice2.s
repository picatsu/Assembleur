.data
.text
ori $5 $0 123	#$5 = a
ori $6 $0 245	#$6 = b

while:
	beq $5 $6 finwhile
	
	if:
		slt $7 $6 $5 		# $7 = (b < a)? 1 : 0
		beq $7 $0 else 	# if(a<b)
			sub $5 $5 $6
			j while
		else:
			sub $6 $6 $5
	j while

finwhile:
	ori $2 $0 1
	ori $4 $5 0
	syscall
	
	ori $2 $0 10
	syscall