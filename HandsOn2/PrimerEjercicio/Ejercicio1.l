/*DMM
Ejercicio 1 : 
Reconocimiento de Palabras Clave, Identificadores y Números
 14-03-2025 */


%{
#include <stdio.h>
int yywrap() { return 1; }
%}

%%
int|return                {printf("Palabra clave: %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Identificador: %s\n", yytext); }
[0-9]+                    { printf("Número: %s\n", yytext); }
.                         { /* Ignorar otros caracteres */ }
\n                         { /* Ignorar saltos de linea*/ }
%%

int main() {
    yylex();
    return 0;
}

