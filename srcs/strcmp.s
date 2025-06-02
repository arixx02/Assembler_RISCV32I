.data
    cadena1: .string "Hola Mundo!!"
    cadena2: .string "hola mundo!!"
.text
    la a0, cadena1      # puntero a cadena1 (arg1)
    la a1, cadena2      # puntero a cadena2 (arg2)
    jal ra, strcmp      # llamar a strcmp
    # Resultado queda en a0
    li a7, 10
    ecall

# strcmp(a0 = s1, a1 = s2)
strcmp:
    # Guardar punteros
loop:
    lb t0, 0(a0)        # cargar byte de cadena1
    lb t1, 0(a1)        # cargar byte de cadena2
    beq t0, zero, check_end
    bne t0, t1, diff
    addi a0, a0, 1      # avanzar puntero cadena1
    addi a1, a1, 1      # avanzar puntero cadena2
    j loop

check_end:
    bne t1, zero, diff
    li a0, 0            # cadenas iguales
    ret

diff:
    li a0, -1           # cadenas distintas
    ret
