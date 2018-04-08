#QUESTION 2.1 (scanf)
ori $2 $0 5
syscall
or $9 $0 $2

ori $2 $0 5
syscall
or $10 $0 $2

ori $2, $0, 11
ori $4, $0, '\n'
syscall

#question 1.1
#ori $9 $0 84
#ori $10 $0 10
div $9 $10

mflo $11
mfhi $12

ori $2, $0, 1
or $4 $0 $11
syscall

ori $2, $0, 11
ori $4, $0, '\n'
syscall

ori $2, $0, 1
or $4 $0 $12
syscall

ori $2, $0, 11
ori $4, $0, '\n'
syscall
syscall

#question 1.3
mult $11 $10
mflo $16
add $16 $16 $12

ori $2, $0, 1
or $4 $0 $16
syscall

#or $13 $0 $16
#add $13 $13
#ori $2, $0, 10
#syscall
