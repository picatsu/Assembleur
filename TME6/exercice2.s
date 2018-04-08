#question 1
ori $16, $0, 137
or $4, $16, $0

ori $2, $0, 1
syscall




ori $4, $0, '\n'
ori $2, $0, 11
syscall

#question 2
ori $16, $0, 0x0001
sll $16, $16, 16
ori $16, $16, 0x0001 

ori $2, $0, 1
or $4, $16, $0
syscall



ori $2, $0, 10
syscall