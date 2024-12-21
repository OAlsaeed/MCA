.data
array: .byte 0x01, 0x02, 0x03, 0x04, 0x05

.text

main:
    li t0, 0x10000000
    
  lbu t1, 0(t0)
  lbu t2, 1(t0)
  lbu t3, 2(t0)
  lbu t4, 3(t0)
  lbu t5, 4(t0)
  
  sw t1, 0(t0)
  sw t2, 4(t0)
  sw t3, 8(t0)
  sw t4, 12(t0)
  sw t5, 16(t0)

    ecall