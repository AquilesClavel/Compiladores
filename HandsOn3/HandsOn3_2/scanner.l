%{
#include "parser.tab.h"
%}

%%
[ \t\n]+            { /* ignorar espacios */ }
"AND"               { return AND; }
"OR"                { return OR; }
"NOT"               { return NOT; }
"("                 { return '('; }
")"                 { return ')'; }
"0"                 { yylval = 0; return BOOLEAN; }
"1"                 { yylval = 1; return BOOLEAN; }
.                   { return yytext[0]; } // para errores
%%

