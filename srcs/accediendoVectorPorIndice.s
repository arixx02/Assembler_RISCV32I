.data
    indice: .word 4
    vector: .word 1,2,3,4,5
.text
    la x5,vector
    la x6,indice
    lw x6,indice
    slli x6,x6,2
    add x7,x6,x5
    lw x4,0(x7)
    li a7,10
    ecall