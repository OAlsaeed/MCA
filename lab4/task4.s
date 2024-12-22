.data

.text
.globl main

main:
    li x1, 10       
    li x2, 6       
    li x3, 0       

    li x4, 0       
    li x5, 1       

whi:
    and x6, x2, x5     
    bne x6, x5, notif  
    add x3, x3, x1     

notif:
    slli x1, x1, 1    
    srli x2, x2, 1   
    bgt x2, x4, whi  


mv a1, x3
li a0, 1     
ecall




exit_program:
    li a0, 10      
    ecall

