.data
array: .word 5, 2, 3, 4, 5, 1, 3, 5, 33

.text
main:
    la a0, array
    li a1, 9
    jal ra, bsort0

    li a0, 10
    li a7, 10
    ecall

bsort0:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)
    sw a1, 4(sp)
    mv s0, a0
    li t0, 0

bsort1:
    sub t4, a1, t0
    addi t4, t4, -1
    blez t4, exit_bsort
    li t1, 0

bsort2:
    bge t1, t4, inci
    slli t2, t1, 2
    add t3, s0, t2
    lw a2, 0(t3)
    lw a3, 4(t3)
    ble a2, a3, incj
    sw a3, 0(t3)
    sw a2, 4(t3)

incj:
    addi t1, t1, 1
    j bsort2

inci:
    addi t0, t0, 1
    j bsort1

exit_bsort:
    lw ra, 12(sp)
    lw a0, 8(sp)
    lw a1, 4(sp)
    addi sp, sp, 16
    jr ra

