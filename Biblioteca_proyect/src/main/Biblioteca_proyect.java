/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import Control.ctrlPrincipal;
import Vista.frmPrincipal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
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
            UIManager.setLookAndFeel(   UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            JOptionPane.showInternalConfirmDialog(null, e);
        }
        
            Vista.frmPrincipal vista= new Vista.frmPrincipal();
            
            ctrlPrincipal Control = new ctrlPrincipal(vista);
            
            Control.inciar();
            
            vista.setExtendedState(JFrame.MAXIMIZED_BOTH);
        
    }
    
}
