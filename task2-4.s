.text
 main:
 addi x5,x0, 0x12
 slli x5,x5,24
 
 addi x6,x0, 0x34
 slli x6,x6,16
 
 add x5,x6,x5
 
 addi x6,x0, 0x56
 slli x6,x6,8
 
 add x5,x6,x5
  
 addi x7,x0, 0x78
 
  add x5,x7,x5
 
 add a1 ,x0 ,x5 
 li a0,1
 ecall