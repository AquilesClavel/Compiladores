%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token AND OR NOT

%left '+' '-'
%left '*' '/'
%left AND OR
%right NOT

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
        | logical
        ;

logical : logical AND term
        | logical OR term
        | NOT factor
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

