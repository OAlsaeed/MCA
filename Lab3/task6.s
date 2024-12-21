.data
array: .byte 0x78, 0x56, 0x34, 0x12, 0x21, 0x43, 0x65, 0x87

.text

main:
    la t0, array        
    li x10, 5            

 
    lbu t2, 0(t0)
    lbu t3, 1(t0)
    lbu t4, 2(t0)
    lbu t5, 3(t0)
    lbu t6, 4(t0)
    lbu x7, 5(t0)
    lbu x8, 6(t0)
    lbu x9, 7(t0)
    
    add t3, t0, x10      

    sb t2, 0(t3)
    sb t3, 1(t3)
    sb t4, 2(t3)
    sb t5, 3(t3)
    sb t6, 4(t3)
    sb x7, 5(t3)
    sb x8, 6(t3)
    sb x9, 7(t3)

    ecall                


