.data
    vector: .word 1,2,3,4,-5,6
.text
    la x5,vector
    li a7,1
    jal loop
    loop:
        lw a0,0,x5
        ecall
        addi x5,x5,4
        bge a0,zero,-12
        jal continue
        nop
    continue:
    li a7,10
    ecall