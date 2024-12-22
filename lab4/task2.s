.data
array:
.word 400


.text

la t0,array
li t1,100
li t2,0

storing_loop:
beq t2,t1, exit
sw t2,0(t0)
addi t0, t0,4
addi t2, t2,1

j storing_loop
exit:

ecall
