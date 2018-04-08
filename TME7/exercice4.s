# "123456" 		->		0x31 32 33 34 35 36 00

.data
tab: .byte 0x31 0x32 0x33 0x34 0x35 0x36 0x00

.text
lui $3 0x1001

#3)
ori $2 $0 4
ori $4 $3 0
syscall

ori $2 $0 11
ori $4 $0 0xA
syscall

#4)
lb $5 2($3)

ori $2 $0 1
ori $4 $5 0
syscall


ori $2 $0 10
syscall

#5)
# il faut passer de l'hexadecimal (code ascii) en décimal. ainsi 33 h = 3*16 + 3 = 51 d

