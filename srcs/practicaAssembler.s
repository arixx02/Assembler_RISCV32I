.data
    var1: .word 0x66778899
    var2: .word 0
.text
    addi x10,zero,4
    sw x10,var1,x5
    la x5,var1 #pointer to var1
    la x14,var2
    lbu x6,0(x5)
    lbu x7,1(x5)
    lbu x8,2(x5)
    lbu x9,3(x5)
    #aca estamos sumando 1 y guardando
    lw x10,0(x5) #indirecto x5 offset 0
    addi x10,x10,1
    sw x10,0(x14)
    #aca defino los limites de enteros de 32 
    #bits signados
    li x11, 0x80000000
    li x12, 0xFFFFFFFF
    li x13,0x7FFFFFFF
    li a7,10
    ecall