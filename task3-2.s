.text 
main: 

addi x5,x0,4 
addi x10,x0,1
slli x10,x10,2
xor  x5,x10,x5


add a1,x0,x5
addi a0,x0, 1

ecall