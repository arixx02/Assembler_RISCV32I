void main() {
    int a = 5, b = 2;
    int c = 0, d = 0;

    // manual integer division using subtraction (primitive way)
    while (a >= b) {
        a -= b;
        c++;
    }
    d = a; // remainder

    asm volatile (
        "mv a0, %0\n\t"
        "li a7, 1\n\t"
        "ecall\n\t"
        :
        : "r"(c)
        : "a0", "a7"
    );

    asm volatile (
        "mv a0, %0\n\t"
        "li a7, 1\n\t"
        "ecall\n\t"
        :
        : "r"(d)
        : "a0", "a7"
    );

    asm volatile ("li a7, 10\n\tecall\n\t");
}
