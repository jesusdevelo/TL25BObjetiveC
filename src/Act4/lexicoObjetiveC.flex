/*
    NOMBRES COMPLETOS ORDENADOS POR PRIMER APELLIDO EN MAYUSCULAS
*/

package act4;
import java_cup.runtime.Symbol;

%%

%public
%class Lexico
%unicode
%line
%column
%cup


%{
    public Symbol simbolo(int tipo, Object valor)
    {
        return new Symbol(tipo, (yyline+1), (yycolumn+1),valor);
    }
%}


%%
/* PALABRAS RESERVADAS */
/* TIPOS DE DATOS */
int        { 
                return simbolo(sym.INT, yytext()); 
            }
long        { 
                return simbolo(sym.LONG, yytext()); 
            }
float      { 
                return simbolo(sym.FLOAT, yytext()); 
            }
double     { 
                return simbolo(sym.DOUBLE, yytext()); 
            }
char       { 
                return simbolo(sym.CHAR, yytext());
            }
boolean    { 
                return simbolo(sym.BOOLEAN, yytext());
            }
byte       { 
                return simbolo(sym.BYTE, yytext()); 
            }

short       {
                return simbolo(sym.SHORT, yytext()); 
            }
 
signed      {
                return simbolo(sym.SIGNED, yytext()); 
            }

unsigned    {
                return simbolo(sym.UNSIGNED, yytext()); 
            }

auto        { 
                return simbolo(sym.AUTO, yytext());  
            }

register    { 
                return simbolo(sym.REGISTER, yytext());  
            }

static      { 
                return simbolo(sym.STATIC, yytext()); 
            }

extern      { 
                return simbolo(sym.EXTERN, yytext()); 
            }
void        { 
                return simbolo(sym.VOID, yytext()); 
            }
if          { 
                return simbolo(sym.IF, yytext()); 
            }

else        {     
                return simbolo(sym.ELSE, yytext()); 
            }

for         {    
                return simbolo(sym.FOR, yytext()); 
            }

while       { 
                return simbolo(sym.WHILE, yytext()); 
            }

do          { 
                return simbolo(sym.DO, yytext()); 
            }

switch      { 
                return simbolo(sym.SWITCH, yytext());  
            }

case        { 
                return simbolo(sym.CASE, yytext());  
            }

default     { 
                return simbolo(sym.DEFAULT, yytext()); 
            }

break       { 
                return simbolo(sym.BREAK, yytext()); 
            }

continue    { 
                return simbolo(sym.CONTINUE, yytext()); 
            }

goto        { 
                return simbolo(sym.GOTO, yytext()); 
            }

return      { 
                return simbolo(sym.RETURN, yytext()); 
            }
false       {
                return simbolo(sym.FALSE, yytext());  
            }
true       {
                return simbolo(sym.TRUE, yytext());  
            }
no         {
                return simbolo(sym.NO, yytext()); 
            }
yes         {
                return simbolo(sym.YES, yytext()); 
            }
import      {
                return simbolo(sym.IMPORT, yytext()); 
            }
const      {
                return simbolo(sym.CONST, yytext()); 
            }



/*identificador*/
[a-zA-Z_][a-zA-Z0-9_]* { 
                return simbolo(sym.IDENTIFICADOR, yytext()); 
            }


/*numeros*/
[0-9]*      { 
                return simbolo(sym.ENTERO, yytext());  
            }

[0-9]*"."[0-9]+ { 
                return simbolo(sym.FLOTANTE, yytext());  
            }


[ \t\n\r]+  { /* Ignorar espacios en blanco */ }

/* SIMBOLOS */

"+"         { 
                  return simbolo(sym.SUMA, yytext()); 
            }

"-"         { 
                return simbolo(sym.RESTA, yytext()); 
            }

"*"         { 
                return simbolo(sym.MULTIPLICACION, yytext());  
            }
"="         {
                return simbolo(sym.ASIGNACION, yytext());  
            }


"/"         { 
                return simbolo(sym.DIVISION, yytext()); 
            }

"%"         { 
                return simbolo(sym.MODULO, yytext()); 
            }
"<"         { 
                return simbolo(sym.MENOR, yytext()); 
            }

">"         { 
                return simbolo(sym.MAYOR, yytext()); 
            }

"<="        { 
                return simbolo(sym.MENORIGUAL, yytext()); 
            }

">="        { 
                return simbolo(sym.MAYORIGUAL, yytext()); 
            }

"=="        { 
                return simbolo(sym.IGUAL, yytext()); 
            }

"!="        { 
                return simbolo(sym.DIFERENTE, yytext()); 
            }
"&&"        { 
                return simbolo(sym.AND, yytext()); 
            }

"||"        { 
                return simbolo(sym.OR, yytext()); 
            }

"!"         { 
                return simbolo(sym.NOT, yytext()); 
            }
"("         { 
                return simbolo(sym.PAR_IZQ, yytext()); 
            }

")"         { 
                return simbolo(sym.PAR_DER, yytext()); 
            }

"["         { 
                return simbolo(sym.COR_IZQ, yytext()); 
            }

"]"         { 
                return simbolo(sym.COR_DER, yytext()); 
            }

"{"         { 
                return simbolo(sym.LLAVE_IZQ, yytext()); 
            }

"}"         { 
                return simbolo(sym.LLAVE_DER, yytext()); 
            }

","         { 
                return simbolo(sym.COMA, yytext()); 
            }

";"         { 
                return simbolo(sym.PUNTOYCOMA, yytext()); 
            }

"."         { 
                return simbolo(sym.PUNTO, yytext()); 
            }

/*comentarios*/
"//".* { 
                return simbolo(sym.COMENTARIO, yytext()); 
            }

"/*"([^*]|\*+[^*/])*\*+"/" { 
                return simbolo(sym.COMENTARIO_MULTI, yytext()); 
            }

/*STRINGS*/

\"([^\"\\]|\\.)*\"? {
    if (yytext().endsWith("\"")) {
        return simbolo(sym.CADENA, yytext());
    } else {
        System.out.println("ERROR: cadena mal formada");
    }
}
\'.' { 
                return simbolo(sym.CARACTER, yytext()); 
            }

[0-9]+ ("."[0-9]+)+ "." [0-9]+ {
                System.out.println(yytext()+" -> ERROR lexico: numero mal formado ");
            }

/*ERRORES*/
\"([^\"\\]|\\.)* {
    System.out.print("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+"\t");
    System.out.println(yytext()+" -> ERROR lexico: cadena mal formada (no se cerro comillas)");
}
\'([^']|\\.)* {
    System.out.print("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+"\t");
    System.out.println(yytext()+" -> ERROR lexico: caracter mal formado (no se cerro comilla simple)");
}
\'..+' {
    System.out.print("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+"\t");
    System.out.println(yytext()+" -> ERROR lexico: caracter mal formado (exceso de caracteres)");
}



.           { 
                System.out.print("Linea:"+(yyline+1)+", Columna:"+(yycolumn+1)+"\t");
                System.out.println(yytext()+" -> ERROR Token no reconocido");                 
            }
