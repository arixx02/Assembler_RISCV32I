.data
    var: .word 1,2,3,4,5,10,6
    counter: .word 0
.text
    la x5,var
    jal loop
    loop:
        lw x6,0(x5)
        beq  x6,zero,continue
        addi x7,x7,1
        addi x5,x5,4
        jal loop
continue:
    addi a0,x7,0
    li a7,1
    ecall
    li a7,10
    ecall