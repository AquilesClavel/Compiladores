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
[0-9]+              { yylval = atoi(yytext); return NUMBER; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }
.                   { return yytext[0]; }
%%

