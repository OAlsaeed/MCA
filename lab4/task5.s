.data
str_newline: .string "\n"
str_star:    .string "*"
str_space:   .string " "

.text
.globl main

main:
    li x5, 5
    li x6, 1

loop_outer:
    bgt x6, x5, exit_program

    mv x7, x5
    sub x7, x7, x6 #num of spaces
    li x8, 0

loop_space:
    bge x8, x7, loop_stars
    la a1, str_space
    li a0, 4
    ecall
    addi x8, x8, 1
    j loop_space

loop_stars:
    li x8, 0
    slli x9, x6, 1
    addi x9, x9, -1 

loop_star:
    bge x8, x9, loop_newline
    la a1, str_star
    li a0, 4
    ecall
    addi x8, x8, 1
    j loop_star

loop_newline:
    la a1, str_newline
    li a0, 4
    ecall

    addi x6, x6, 1
    j loop_outer

exit_program:
    li a0, 10
    ecall
