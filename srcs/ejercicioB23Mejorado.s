.data
    palabra: .string "una"
    frase: .string "Hola soy una frase"
    palabra2: .string "no"
.text
    la a2,palabra
    la a3,frase
    jal contiene
    li a7,1
    ecall
    la a2,palabra2
    jal contiene
    li a7,1
    ecall
    li a7 10
    ecall
    
contiene:
    addi sp, sp, -4
    sw ra, 0(sp)

    li a0, 0                 # valor por defecto: no encontrado
    lb t0, 0(a2)
    lb t1, 0(a3)
    beq t0, zero, volver
    beq t1, zero, volver

    li t6, 1                 # valor de retorno si hay coincidencia
    mv t3, a3                # puntero a la frase
    li t4, 32                # c?digo ASCII del espacio

loop_frase:
    lb t5, 0(t3)
    beq t5, zero, fin_frase  # si fin de frase, no encontrado

    jal strcmp
    beq a0, t6, volver       # si es igual, salir

# avanzar t3 al comienzo de la siguiente palabra
skip:
    lb t5, 0(t3)
    beq t5, zero, fin_frase
    bne t5, t4, avanzar
    addi t3, t3, 1
    j loop_frase

avanzar:
    addi t3, t3, 1
    j skip

volver:
    mv a0, t6
fin_frase:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# strcmp(a0 = s1, a1 = s2)
strcmp:
    # Guardar punteros
    mv a1,t3
    mv a0,a2
loop:
    lb t0, 0(a0)        # cargar byte de cadena1
    lb t1, 0(a1)        # cargar byte de cadena2
    bne t0, t1, diff
    beq t0,zero,end 
    addi a0, a0, 1      # avanzar puntero cadena1
    addi a1, a1, 1      # avanzar puntero cadena2
    j loop 
end:
    li a0, 1            # cadenas iguales
    ret
diff:
    beq t0, zero, end
    li a0, 0           # cadenas distintas
    ret
