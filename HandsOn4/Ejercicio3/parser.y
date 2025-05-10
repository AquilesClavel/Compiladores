%{
#include <stdio.h> // Para imprimir mensajes de error
#include <stdlib.h> // Para malloc, free
#include <string.h> // Para strcmp y strdup
int yylex(void); // Declaración de la función léxica
int yyerror(char *s) { printf("Error: %s", s); return 0; } // Manejador de errores
#define MAX_FUNC 100 // Número máximo de funciones soportadas
char *funciones[MAX_FUNC]; // Arreglo para nombres de funciones
int aridades[MAX_FUNC]; // Arreglo para número de argumentos espe
int nfuncs = 0; // Contador de funciones registradas

void registrar_funcion(char *id, int n) {
 funciones[nfuncs] = strdup(id); // Guarda el nombre de la función
 aridades[nfuncs++] = n; // Guarda su aridad
}

int obtener_aridad(char *id) {
 for (int i = 0; i < nfuncs; i++)
  if (strcmp(funciones[i], id) == 0) return aridades[i]; // Devuelve aridad
 return -1; // Retorna -1 si no está definida
}
%}
%union { char *str; int num; } // Asociación de tipo
%token <str> ID // Token para identificadores
%token FUNC PARIZQ PARDER PUNTOYCOMA COMA // Tokens para sintaxis de funcione
%type <num> lista args         // Tipos semánticos para lista y args
%%
programa:
    declaraciones llamadas // Programa = declaraciones de funciones
    ;
declaraciones:
    FUNC ID PARIZQ lista PARDER PUNTOYCOMA {
        registrar_funcion($2, $4); // $2 = ID, $4 = número de parámetros
    }
  | declaraciones FUNC ID PARIZQ lista PARDER PUNTOYCOMA {
        registrar_funcion($3, $5); // $3 = ID, $5 = número de parámetros
    }
    ;
lista:
    ID { $$ = 1; } // Una variable como p
  | lista COMA ID { $$ = $1 + 1; } // Más de un parámetr
    ;
llamadas:
    ID PARIZQ args PARDER PUNTOYCOMA {
      int n = obtener_aridad($1); // Busca cuántos pará
      if (n != $3) // Compara con número
        printf("Error: se esperaban %d argumentos en '%s'\n", n, $1);
    }
  | llamadas ID PARIZQ args PARDER PUNTOYCOMA {
     int n = obtener_aridad($2);
     if (n != $4)
      printf("Error: se esperaban %d argumentos en '%s'\n", n, $2);
    }
    ;
args:
    ID           { $$ = 1; } // Un argumento
  | args COMA ID { $$ = $1 + 1; } // Más de un argumen
  |              { $$ = 0; } // Sin argumentos
    ;
%%
int main() { return yyparse(); }
