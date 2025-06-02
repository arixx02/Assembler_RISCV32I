.data
    var: .byte 3,2,3,4
    finvar:
.text
    la x5,var
    la x15,finvar
    jal loop
    loop:
        lw x6,0(x5)
        beq  x5,x15,continue
        addi x7,x7,1
        addi x5,x5,1
        jal loop
continue:
    addi a0,x7,0
    li a7,1
    ecall
    li a7,10
    ecall