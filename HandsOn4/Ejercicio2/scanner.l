%{
#include "parser.tab.h"        // Inclusión del archivo de encabezado ge
#include <string.h>            // Para funciones de manipulación de cad
#include <stdlib.h>            // Para funciones de asignación dinámica
%}
%%
"int"                    { return INT; }  // Re
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; } // Cap
"="                      { return IGUAL; } // Rec
";"                      { return PUNTOYCOMA; } // Re
[ \t\n]+                 { /* Ignorar espacios y saltos de línea */ }
.                        { printf("Carácter inesperado: '%s'\n", yytext);  return yytext[0]; } // Cu
%%

