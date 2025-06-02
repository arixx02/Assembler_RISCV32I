.data
    caracteres: .byte 124,47,45,92
    progreso: .half 0
.text
    la a0,progreso
    jal ciclo
    li a7,10
    ecall
    
#aca hay que implementar sleep
ciclo:
    li t4,4 #para comparar el contador
    li t5,0 #contador para terminar
    li t6,50 #comparador para el contador terminar
    loop:
        la t0,caracteres #t0 cursor
        li t1,0 #vamos a uar t1 como contador, declaramos
        loop_start:
            mv s0,a0 #cursor para guardar
            lb t3,0(t0)
            sb t3,0(s0)
            addi s0,s0,1
            sb t3,0(s0)
            addi t1,t1,1
            addi t0,t0,1
            beq t1,t4,loop
            addi t5,t5,1
            beq t5,t6,fin
            j loop_start
        fin:
            jr ra
            
            