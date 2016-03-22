/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author USUARIO
 */
public class Biblioteca_proyect {

    /**
     * @param args the command line arguments
     */
    
    
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Biblioteca_proyect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Biblioteca_proyect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Biblioteca_proyect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(Biblioteca_proyect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            frmPrincipal ventana= new frmPrincipal();
            
            ventana.setTitle("Biblioteca");
            
            ventana.setResizable(false);
            
            ventana.setExtendedState(JFrame.MAXIMIZED_BOTH);
            
            ventana.setVisible(true);
        
    }
    
}
