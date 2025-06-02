.text
    li a0,500
    li a1,100
    jal MIN
    nop
    fin:
        li a7,1
        ecall
        li a7,10
        ecall
    MIN:
        blt a0,a1,volver
        add a0,zero,a1
    volver:
        jalr x0,x1,0 #ret