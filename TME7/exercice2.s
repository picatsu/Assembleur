.data
v1: .word -1
v2: .word 0xFF
q3: .byte 0xFF 

.text
lui $3 0x1001

#QUESTION 1
lw $5 0($3)
lw $6 4($3)

ori $2 $0 1
ori $4 $5 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall

ori $2 $0 1
ori $4 $6 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall

#QUESTION 2
addi $5 $5 1
addi $6 $6 1

sw $5 0($3)
sw $6 4($3)

ori $2 $0 1
ori $4 $5 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall

ori $2 $0 1
ori $4 $6 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall
#QUESTION 3

lb $7 8($3)
lbu $8 8($3)

ori $2 $0 1
ori $4 $7 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall

ori $2 $0 1
ori $4 $8 0
syscall

ori $2 $0 10
syscall