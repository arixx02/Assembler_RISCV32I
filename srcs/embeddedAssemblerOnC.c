void main() {
    int a = 10, b = 20, result;
    asm ( "add %1, %2, %0"        /* add b, a,1  result */
        : "=r" (result)           /* output: result register */
        : "r" (a), "r" (b)        /* inputs: a and b registers */
        :                     /* no clobbered registers */
    );
    asm ("mv a0, a5");
    asm ("li a7, 1");
    asm ("ecall");
}