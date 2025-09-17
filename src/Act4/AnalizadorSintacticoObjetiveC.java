/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package act4;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java_cup.runtime.Symbol;

/**
 *
 * @author jesus
 */
public class AnalizadorSintacticoObjetiveC {
    public static void main(String[] args) throws IOException {
        Reader lector = new BufferedReader(new FileReader("src/act4/sintacticoObjetiveC.txt"));
      //  Lexico l=new Lexico(lector);
        sintacticoObjetiveC s = new sintacticoObjetiveC(new Lexico(lector));
//        String contenido= "byte  numero1;";
//        JavaSintactico s = new JavaSintactico(new JavaLexico(new StringReader(contenido)));
        try {
            System.out.println(s.parse());
            System.out.println("Analisis realizado correctamente");
        } catch (Exception ex) {
          /*  Symbol sym = s.getS();
            System.out.println("Error de sintaxis. Linea: " + (sym.right + 1) +
              " Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"");*/
        System.out.println(ex.getMessage());
        }
    }

}
