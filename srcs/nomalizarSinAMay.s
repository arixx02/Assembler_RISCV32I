.data
frase: .string "texto de prueba1"

.text
.globl main
main:
    li a7, 4              # print string syscall
    la a0, frase
    jal normalizar
    ecall                 # print the normalized string

    li a7, 10             # exit syscall
    ecall

normalizar:
    addi sp, sp, -4       # save ra on stack
    sw ra, 0(sp)

    mv t0, a0             # t0 = pointer to string
    li t2, 97            # t2 = 97
    li t3, 122            # t3 = 122
    li t4, 32             # t4 = 32, the case difference

loop:
    lb t1, 0(t0)          # load current char
    beq t1, zero, done    # if null terminator, end

    blt t1, t2, skip      # if char < 'a', skip
    bgt t1, t3, skip      # if char > 'z', skip

    sub t1, t1, t4        # convert to uppercase by subtracting 32
    sb t1, 0(t0)          # store back modified char

skip:
    addi t0, t0, 1        # move to next char
    j loop

done:
    lw ra, 0(sp)          # restore ra
    addi sp, sp, 4
    jr ra
