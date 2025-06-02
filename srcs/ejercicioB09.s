.data
    var: .half 32769
.text
    la x5,var
    lh a0,0(x5)
    li a7,1
    ecall