.text 
main: 

addi x5,x0,15 #15
andi x5,x5,1 # x = 15 - 1

add a1,x0,x5
addi a0,x0, 1

ecall