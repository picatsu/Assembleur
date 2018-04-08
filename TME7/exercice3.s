.data
ch: .asciiz "coucou"

.text
lui $3 0x1001

#QUESTION 1
ori $2 $0 4
ori $4 $3 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall
#QUESTION 2
lb $10 0($3) 
lb $11 1($3)

sb $11 0($3)
sb $10 1($3)

ori $2 $0 4
ori $4 $3 0
syscall


ori $2 $0 10
syscall