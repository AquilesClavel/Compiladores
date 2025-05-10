%{
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>
%}
%%
"int"                  { return INT; }
"func"                 { return FUNC; }
"return"               { return RETURN; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }
"("                    { return PARIZQ; }
")"                    { return PARDER; }
"{"                    { return LLAVEIZQ; }
"}"                    { return LLAVEDER; }
";"                    { return PUNTOYCOMA; }
","                    { return COMA; }
"="                    { return IGUAL; }
[ \t\n]+               ; // Ignorar espacios
.                      { printf("Carácter inesperado: '%s'\n", yytext); return yytext[0]; }
<<EOF>>                { return 0; }
%%
int yywrap() { return 1; }
