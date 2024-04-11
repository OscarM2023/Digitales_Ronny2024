inicio:
lw t0, 32(x0)
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
add t1, x0, t0
add t2, t1, t0
add t0, t1, t2
sw t0, 40(x0) # cargar 0x10
lw t1, 32(x0)
lw t2, 48(x0) # cargar 0x10 decimal
sub t2, t0, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
sub t2, t2, t1
and t3, t0, t2
beq t3, t2, inicio
or t2, t2, t1
beq t3, t2, inicio
sw t2, 40(x0)
beq x0, x0 inicio









