.data
value: .word 42 # Memory location storing the number 42
.text

main:
la t0, value # Load the address of 'value' into t0
lw t1, 0(t0) # Load the data from memory into t1