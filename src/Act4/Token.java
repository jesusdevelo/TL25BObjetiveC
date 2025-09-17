/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Act4;

/**
 *
 * @author jesus
 */
public class Token {
    
    public enum Type{
        INT,CHAR,LONG,FLOAT,DOUBLE, BOOLEAN, BYTE, SIGNED, UNSIGNED, SHORT, AUTO, REGISTER, STATIC, EXTERN, VOID,IF, ELSE, WHILE, DO, FOR, SWITCH, CASE, DEFAULT, BREAK, GOTO, CONTINUE, RETURN, IDENTIFICADOR, FLOTANTE, ENTERO, SUMA, RESTA, MULTIPLICACION, DIVISION, MODULO, MENOR, MAYOR, MENORIGUAL, MAYORIGUAL, IGUAL, DIFERENTE, AND, OR, NOT, PAR_IZQ, PAR_DER, COR_IZQ, COR_DER, LLAVE_IZQ, LLAVE_DER, COMA, PUNTOYCOMA, PUNTO, COMENTARIO_LINEA, COMENTARIO_MULTI, CADENA, FALSE, TRUE, RESULTADO, YES, NO, CARACTER, BOOL, ERROR 
    }
    
    private final Type type;
    private final String value;
    private final int line;
    private final int column;
    
    public Token (Type type,String value,int line,int column){
        this.type=type;
        this.value=value;
        this.line=line;
        this.column=column;
    }
    
    @Override
    public String toString(){
        return "Token{"+"type="+type+", value=" + value +", line="+ line + ", column=" +column + '}';
        
    }
    
}
