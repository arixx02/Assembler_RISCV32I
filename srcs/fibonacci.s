.data
    anterior: .word 0
.text
li t0,0
li t1,1
li t3,100
mv a0,t0
jal print_numero
jal print_puntocoma
mv a0,t1
jal print_numero
jal print_puntocoma
li t3,144
loop:
    #la t3,anterior
    #sw t1,0,t3 sw source,offset(base)
    add t2,t1,t0
    mv t0,t1
    mv t1,t2
    mv a0,t2 
    jal print_numero
    beq t1,t3,fin
    jal print_puntocoma
    blt t2,t3,loop
fin:
li a7,10
ecall
print_numero:
    li a7,1
    ecall
    li a0,0
    ret
print_puntocoma:
    li a7,11
    li a0,59
    ecall
    li a0,0
    ret