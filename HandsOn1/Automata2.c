#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

int validate_real(const char *str) {
    int has_dot = 0;
    if (*str == '+' || *str == '-') str++;
    while (*str) {
        if (*str == '.') {
            if (has_dot) return 0;
            has_dot = 1;
        } else if (!isdigit(*str)) return 0;
        str++;
    }
    return has_dot;
}
int main() {
    const char *input = "-123.456";
    if (validate_real(input)) {
        printf("Numero valido.\n");
    } else {
        printf("Numero invalido.\n");
    }
    system("pause");
    return 0;
}