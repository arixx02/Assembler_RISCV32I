.data
    vector: .word 1,2,3,4,5
    indice: .word 4
.text
    la x5,vector
    lw x6,indice
    slli x6,x6,2
    add x5,x6,x5
    lw x6,indice
    li a7,1
    jal loop
    loop:
        lw a0,0(x5)
        ecall
        addi x6,x6,-1
        addi x5,x5,-4
        bge x6,zero,loop
        jal continue
    continue:
        li a7,10
        ecall