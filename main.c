#include <stdio.h>
#include <stdlib.h>

int add (int a, int b) {
    return a + b;
}

int sub (int a, int b) {
    return a - b;
}


int execute (int a, int b, int (*f)(int, int)) {
    return f(a, b);
}

int main() {
    int a = 10;
    int b = 5;
    int* age = malloc(sizeof(int));
    *age = 20;
    int** agePtr = &age;

    printf("Age: %d\n", **agePtr);

    printf("Addition: %d\n", execute(a, b, add));
    printf("Hello, World!\n");
    return 0;
}
