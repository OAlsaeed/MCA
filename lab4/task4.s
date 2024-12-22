.data # data memory segment
str1: .string "Equal\n"
str2: .string "Not Equal\n"
a: .word   0x61

.text

main:
li x1, 5 #a
li x2, 5 #b
li x3, 0 #result

li x4, 0 # 0 number
li x5, 1 # 1 number

add a1,x0,x1 
li a0, 1
ecall
li a1, ' '
li a0, 11
ecall
li a1, '*'
li a0, 11
ecall
li a1, ' '
li a0, 11
ecall
add a1,x0,x2
li a0, 1
ecall
li a1, ' '
li a0, 11
ecall
li a1, '='
li a0, 11
ecall
##

whi:
bge x4, x2, print
and x6, x2, x5 # result = b & 1
bne x6,x5,notif
add x3, x3,x1
notif:
slli x1, x1, 1 #a<<1
srli x2, x2, 1 #b>>1

blt x4, x2, whi

# exit:
# li a0,10
# ecall



#print character
print:
li a1, ' '
li a0, 11
ecall
add a1,x0,x3 # x3 = result
li a0, 1
ecall
li a1, ' '
li a0, 11
ecall

li a0,10
ecall
