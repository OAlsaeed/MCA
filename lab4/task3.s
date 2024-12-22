.data
array1: .byte 1, 2, 3, 4, 5, 6, 7, 8
array2: .byte 9, 10, 11, 12, 13, 14, 15, 16
result: .byte 0, 0, 0, 0, 0, 0, 0, 0

.text


main:
    la x11, array1
    la x10, array2
    la x2, result
    li x3, 8
    li x4, 0

storing_loop:
    beq x4, x3, exit
    lbu x5, 0(x11)
    lbu x6, 0(x10)
    add x7, x5, x6
    sb x7, 0(x2)
    addi x11, x11, 1
    addi x10, x10, 1
    addi x2, x2, 1
    addi x4, x4, 1
    j storing_loop

exit:
    
    ecall

