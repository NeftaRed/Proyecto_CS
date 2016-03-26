/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Control.ctrlPrincipal;
import Vista.frmPrincipal;
import javax.swing.JOptionPane;
import javax.swing.UIManager;

/**
 *
 * @author Anthony Can
 */
public class Biblioteca {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(   UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            JOptionPane.showInternalConfirmDialog(null, e);
        }
        
        frmPrincipal vista = new frmPrincipal();
        ctrlPrincipal Control = new ctrlPrincipal(vista);
        Control.inciar();
        
    }
    
}
