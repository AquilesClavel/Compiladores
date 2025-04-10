%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER

%%
expr    : expr '+' term
        | expr '-' term
        | term
        ;

term    : term '*' factor
        | term '/' factor
        | factor
        ;

factor  : '(' expr ')'
        | NUMBER
        ;
%%

void yyerror(const char *s) {
    printf("Expresión inválida\n");
}

int main(void) {
    if (yyparse() == 0)
        printf("Expresión válida\n");
    return 0;
}

