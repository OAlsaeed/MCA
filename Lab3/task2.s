
.text

main:

    li t0, 0x10000000
    li t1, 0x12345678
    sw t1, 0(t0)
    lbu t1, 0(t0)
    lbu t2, 1(t0)
    lbu t3, 2(t0)
    lbu t4, 3(t0)
    slli t3, t3, 8
    slli t2, t2, 16
    slli t1, t1, 24
    or t5, t4, t3
    or t5, t5, t2
    or t5, t5, t1
    sw t5, 0(t0)

    ecall
