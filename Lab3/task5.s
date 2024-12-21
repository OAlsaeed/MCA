.data
string: .byte 0x61, 0x62, 0x63, 0x64, 0x65

.text

main:
    la t0, string
    lbu t1, 0(t0)
    lbu t2, 1(t0)
    lbu t3, 2(t0)
    lbu t4, 3(t0)
    lbu t5, 4(t0)
   
    
    sb t5, 0(t0)
    sb t4, 1(t0)
    sb t3, 2(t0)
    sb t2, 3(t0)
    sb t1, 4(t0)
    
    ecall
