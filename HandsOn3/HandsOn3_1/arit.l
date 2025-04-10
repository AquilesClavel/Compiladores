%{
#include "parserArit.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t\n]+        { /* ignorar espacios */ }
"("             { return '('; }
")"             { return ')'; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
.               { return yytext[0]; } // Cualquier otro carácter
%%

