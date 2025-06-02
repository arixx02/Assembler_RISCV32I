.data
    vector: .word -10,-20,10,-5
.text
    li a7,1
    la a0,vector
    jal x1,promedio
    ecall
    li a7,10
    ecall
promedio:
    mv t1,a0
    lh t2,0(t1)
    add t3,t3,t2
    addi a0,a0,4
    lh t2,0(t1)
    bne t2,zero,promedio
calcular_promedio:
    bge t3,zero,positivo
    j negativo
    continuar:
    addi t3,t3,4
    addi t4,t4,1
    bge t3,zero,volver
    j calcular_promedio
negativo:
    li t5,1
    j continuar
positivo:
    addi t3,t3,-4
    addi t4,t4,1
    blt t3,zero,volver
volver:
    bne t5,zero,restar
    mv a0,t4
    continuar2:
    ret
restar:
    sub a0,zero,t4
    j continuar2