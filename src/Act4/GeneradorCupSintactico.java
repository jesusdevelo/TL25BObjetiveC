package act4;

import java.io.File;
import java.io.IOException;

public class GeneradorCupSintactico {
    public static void main(String[] args) throws IOException, Exception {
       
        
        
        
        //String[] parametros = {"-parser", "Sintactico", "C:\\Users\\7053\\Documents\\NetBeansProjects\\UEDL_COMPILADORES\\src\\sintactico\\sintactico.cup"};
        String[] parametros = {"-destdir", "src\\act4","-parser", "sintacticoObjetiveC", 
            "-progress", "src\\act4\\sintacticoObjetiveC.cup"};
        java_cup.Main.main(parametros);
        
    }
    
   
}
