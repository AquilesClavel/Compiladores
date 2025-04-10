%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token BOOLEAN
%token AND OR NOT

%%
expr    : expr AND term
        | expr OR term
        | term
        ;

term    : NOT factor
        | factor
        ;

factor  : '(' expr ')'
        | BOOLEAN
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

