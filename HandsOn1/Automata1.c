#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
//Validación de Cadenas Alfabéticas
int validate_alpha(const char *str) {
    while (*str) {
        if (!isalpha(*str)) return 0;
        str++;
    }
    return 1;
}
int main() {
    const char *input = "HelloWorld";
    if (validate_alpha(input)) {
        printf("Cadena valida.\n");
    } else {
        printf("Cadena invalida.\n");
    }
    system("pause");
    return 0;
}