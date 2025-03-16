
/*DMM
* Ejercicio 3 : 
* Integrar el analizador léxico con un programa en C,
* cuente el número de palabras clave, identificadores, números, operadores y
* delimitadores en un archivo de código fuente.
* 14-03-2025 
*/

%{
#include <stdio.h>
int palabras_clave = 0, identificadores = 0, numeros = 0, operadores = 0, delimitadores = 0, cadenas = 0, comentarios = 0, 
librerias = 0;
int yywrap() { return 1; }
%}

KEYWORDS int|char|float|double|void|if|else|switch|case|default|for|while|do|break|continue|return|goto|static|extern|auto|register|const|volatile|signed|unsigned|struct|union|enum|sizeof|typedef

%%
{KEYWORDS}                     { palabras_clave++; }
[a-zA-Z_][a-zA-Z0-9_]*         { identificadores++;}
[0-9]+                         { numeros++; }
[+\-*/=<>!&|%^.]               { operadores++;} 
[;,(){}]                       { delimitadores++;}
[ \t\n]+                       { /* Ignorar espacios, tabulaciones y saltos de línea */ }
"//".*                         { comentarios++; }
\"[^"]*\"                      { cadenas++; }
"/*"([^*]|(\*+[^*/]))*\*+"/"   { comentarios++; }
^#[ \t]*include[ \t]*[<"][^>"]*[>"]  { librerias++; }

.                       { /* Ignorar otros caracteres*/ }

%%

int main() {
    yylex();
    printf("Librerias: %d\n", librerias);
    printf("Palabras clave: %d\n", palabras_clave);
    printf("Identificadores: %d\n", identificadores);
    printf("Números: %d\n", numeros);
    printf("Operadores: %d\n", operadores);
    printf("Delimitadores: %d\n", delimitadores);
    printf("Comentarios: %d\n", comentarios);
    printf("Cadenas: %d\n", cadenas);
    return 0;
}
