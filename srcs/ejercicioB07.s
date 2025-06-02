.text
    li a7,11
    li a0,33
    li x5,58
    li x6,91
    li x7,93
    jal loop
    loop:
        add x8,zero,a0
        add a0,zero,x6
        ecall
        add a0,zero,x8
        ecall
        addi a0,a0,1
        add x8,zero,a0
        add a0,zero,x7
        ecall
        add a0,zero,x8
        blt a0,x5,loop
        jal continue
    continue:
        li a7,10
        ecall