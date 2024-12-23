.data
array: .word 1,2,3,4,5,6,7,8,9

.text
main:
    la a0, array
    li a1, 9
    jal ra, sum

    mv a0, t3
    jal ra, printArray

    li a0, 10
    ecall

sum:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)
    sw a1, 4(sp)

    li t0, 0
    mv s0, a0
    li t3, 0

sum1:
    bge t0, a1, exit_sum
    slli t1, t0, 2
    add t2, s0, t1
    lw a2, 0(t2)
    add t3, t3, a2
    addi t0, t0, 1
    j sum1

exit_sum:
    mv a0, t3

    lw ra, 12(sp)
    lw a0, 8(sp)
    lw a1, 4(sp)
    addi sp, sp, 16
    jr ra

printArray:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)

    mv s0, a0
    add a1 x0,t3
    li a0, 1
    ecall

    lw ra, 12(sp)
    lw s0, 8(sp)
    lw s1, 4(sp)
    addi sp, sp, 16
    jr ra

