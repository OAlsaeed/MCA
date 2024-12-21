.data 
val1: .word 0x12345678
val2: .word 0x87654321
result: .word 0

.text

main:

la t0,val1
la t1,val2
la t2,result

lw x5,0(t0)
lw x6,0(t1)

add x7,x5,x6

sw x7,0(t2)



 li a0, 10                 
 ecall  