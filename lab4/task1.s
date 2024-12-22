data # data memory segment
str1: .string "Equal\n"
str2: .string "Not Equal\n"
a: .word   0x61

.text

main:
li x1, 7
li x2, 10
beq x1, x2, if
bne x1, x2, ifnot

# print string from memory using label
if: 
la a1, str1
li a0, 4
ecall
beq x0,x0,exit
ifnot:
la a1, str2
li a0, 4
ecall

exit:
li a0,10
ecall
