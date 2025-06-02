.data
frase: .string "texto de prueba1"

.text
.globl main
main:
    li a7, 4              # syscall: print string
    la a0, frase
    jal normalizar
    ecall                 # print the normalized string

    li a7, 10             # syscall: exit
    ecall

# ============ NORMALIZAR FUNCTION ================
normalizar:
    addi sp, sp, -8       # ? space for ra and s0
    sw ra, 0(sp)
    sw s0, 4(sp)

    mv s0, a0             # s0 keeps original pointer (to return)
    mv t0, a0         # Use t0 to walk through the string
    
    li t2, 97             # 'a'
    li t3, 122            # 'z'

loop:
    lb t1, 0(t0)          # load byte from string
    beq t1, zero, done    # if null terminator, finish

    blt t1, t2, skip      # if less than 'a', skip
    bgt t1, t3, skip      # if greater than 'z', skip

    mv a1, t1             # pass character to aMay
    mv t5, t0             # ? save pointer before calling
    jal aMay              # result in a0 (uppercase char)
    sb a0, 0(t0)          # Store result back in same location
skip:
    addi t0, t0, 1        # next char
    j loop
done:
    mv a0, s0             # restore original string pointer
    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8        # ? restore full 8 bytes
    jr ra

# ============ aMay: Converts lowercase char in a1 to uppercase ============
# Input: a1 = ASCII char ('a'..'z')
# Output: a0 = uppercase version
aMay:
    li t4, 32
    sub a0, a1, t4
    jr ra

