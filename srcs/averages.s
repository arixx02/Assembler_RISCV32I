.data
vector: .half -10, -20, 10,-5

.text
.globl _start
_start:
    la t1, vector      # pointer to vector
    li t0, 4           # number of elements
    li t3, 0           # sum accumulator

# Sum loop
loop_sum:
    beq t0, zero, done_sum
    lh t2, 0(t1)
    add t3, t3, t2
    addi t1, t1, 2
    addi t0, t0, -1
    j loop_sum

done_sum:
    li t0, 4           # divisor = number of elements

    mv t4, t3          # numerator (sum)
    mv t5, t0          # divisor

    li t6, 0           # sign = 0 (positive)

    # Determine sign of result
    blt t4, zero, set_sign
    j div_loop

set_sign:
    li t6, 1           # sign = 1 (negative)

    # abs numerator
    blt t4, zero, abs_num
    j check_divisor

abs_num:
    sub t4, zero, t4

check_divisor:
    # abs divisor
    blt t5, zero, abs_div
    j div_loop

abs_div:
    sub t5, zero, t5

# Division by repeated subtraction
div_loop:
    li t0, 0           # quotient = 0
div_loop_start:
    blt t4, t5, div_done
    sub t4, t4, t5
    addi t0, t0, 1
    j div_loop_start

div_done:
    # Apply sign to quotient
    beq t6, zero, done
    sub t0, zero, t0

done:
    mv a0, t0          # move quotient to a0 for printing

    # Print integer (syscall 1)
    li a7, 1
    ecall

