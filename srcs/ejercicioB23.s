.data
    palabra: .string "una"
    frase: .string "Hola soy una."
.text
    la a2,palabra
    la a3,frase
    jal contiene
    li a7 10
    ecall
    
contiene:
    addi a0, zero, -1        # Default return value = not found
    addi sp, sp, -4  #allocates memory in the stack 
    sw ra, 0(sp) #saves the return adress

    lb t0, 0(a2)             # Check if palabra is empty
    lb t1, 0(a3)             # Check if frase is empty
    beq t0, zero, volver
    beq t1, zero, volver

    mv t3, a3                # frase pointer (cursor)
    li t4, 32                # ASCII for space (' ')
loop_frase:
    lb t5,0(t3) #principio de frase
    jal strcmp
    beq a0,zero,volver #encontrado
    j skip
skip:
    addi t3,t3,1
    lb t5,0(t3) #principio de frase
    beq t5,zero,volver
    beq t5,t4,skip
    jal strcmp
    beq a0,zero,volver #encontrado
    j skip
volver:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# strcmp(a0 = s1, a1 = s2)
strcmp:
    # Guardar punteros
    mv a1,t3
    la a0,palabra
loop:
    lb t0, 0(a0)        # cargar byte de cadena1
    lb t1, 0(a1)        # cargar byte de cadena2
    bne t0, t1, diff
    addi a0, a0, 1      # avanzar puntero cadena1
    addi a1, a1, 1      # avanzar puntero cadena2
    j loop

check_end:
    li a0, 0            # cadenas iguales
    ret
diff:
    beq t0, zero, check_end
    li a0, -1           # cadenas distintas
    ret
