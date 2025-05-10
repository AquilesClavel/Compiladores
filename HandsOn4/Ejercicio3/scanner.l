%{
#include "parser.tab.h" // Inclusión del archivo de encabezado ge
#include <string.h> // Para funciones de manipulación de cad
#include <stdlib.h> // Para uso de strdup
%}
%%
[0-9]+        { yylval.str = strdup(yytext); return ID; } // tratar números como D
"func"                 { return FUNC; } // Pa
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; } // Ide
"("                    { return PARIZQ; } // Pa
")"                    { return PARDER; } // Pa
";"                    { return PUNTOYCOMA; } // Pu
","                    { return COMA; } // Co
[ \t\n]+               { /* Ignorar espacios y saltos de línea */ }
.                      { printf("Carácter inesperado: '%s'\n", yytext); /* Ignorar */ return yytext[0]; } // Re
