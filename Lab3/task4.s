 .text


main:
    li t0, 0x10000000
    li t1, 0x61
    li t2, 0x62
    li t3, 0x63
    li t4, 0x64
    li t5, 0x65

    addi t1, t1, -32
    addi t2, t2, -32
    addi t3, t3, -32
    addi t4, t4, -32
    addi t5, t5, -32

    sb t1, 0(t0)
    sb t2, 1(t0)
    sb t3, 2(t0)
    sb t4, 3(t0)
    sb t5, 4(t0)


    ecall
