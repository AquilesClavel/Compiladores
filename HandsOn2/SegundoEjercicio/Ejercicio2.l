/*DMM
* Ejercicio 2 : 
* Comentarios y Cadenas de Texto
* Extender el ejercicio1
* 14-03-2025 
*/


%{
#include <stdio.h>
int yywrap() { return 1; }
%}

%%
int|return                { printf("Palabra clave: %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Identificador: %s\n",yytext); }

[0-9]+                    { printf("Número: %s\n",yytext); }

\n                         { /* Ignorar saltos de linea*/ }
.                          { /* Ignorar otros caracteres*/ }

"//".*                           { printf("Comentario de una línea: %s\n",yytext); }
"/*"([^*]|(\*+[^*/]))*\*+"/"   { printf("Comentario de múltiples líneas: \n%s\n",yytext); }
\"[^"]*\"                      { printf("Cadena: %s\n",yytext); }
 

%%

int main() {
    yylex();
    return 0;
}

