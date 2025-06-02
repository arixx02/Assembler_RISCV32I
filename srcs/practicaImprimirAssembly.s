.data
msg: .asciz "Hello bare-metal!\n"

.text
.globl _start
_start:
    la t0, msg          # Load address of string

print_loop:
    lb a0, 0(t0)       # Load byte
    beq a0, zero, done  # If zero byte (null), end
    li a7, 11          # Syscall: print char
    ecall
    addi t0, t0, 1     # Next byte
    j print_loop

done:
    li a7, 10          # Exit simulation
    ecall