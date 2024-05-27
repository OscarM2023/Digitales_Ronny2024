
lw x5, 32(x0)
add x1, x0, x5
add x2, x1, x5
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
add x1, x2, x1
add x2, x1, x2
sw x2, 48(x0) # store fib number at address 0+40
lw x1, 32(x0) # load decimal 1 into x1
lw x3, 40(x0) # load hex 0x10 into x3
lw x5, 16(x0) # load decimal 300 into x5
sub x2, x2, x1
and x4, x3, x2
or x3, x3, x5
sw x2, 40(x0)
inicio:	beq x0, x0 inicio









