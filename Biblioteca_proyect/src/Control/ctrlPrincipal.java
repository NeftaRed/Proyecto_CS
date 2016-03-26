/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.ModeloDevolucion;
import Vista.frmPrincipal;
import Vista.intFrmDevolucion;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.swing.JFrame;
import javax.swing.Timer;

/**
 *
 * @author Anthony Can
 */
public class ctrlPrincipal {
     
     private frmPrincipal vistafr;
     private Timer time;
     int hora, minuto, segundo;
     
     
    public ctrlPrincipal(frmPrincipal vistafr) {
     
        this.vistafr = vistafr;
        vistafr.opcDev.addActionListener(new cronoIniciar());
    }
    
    public void inciar(){
        
        vistafr.setLocationRelativeTo(null);
        vistafr.setTitle("Biblioteca");
        vistafr.setResizable(false);
        vistafr.setVisible(true);
    
    }
       public class cronoIniciar implements ActionListener {    
         @Override
         public void actionPerformed(ActionEvent evt){ 
         
         intFrmDevolucion vist = new intFrmDevolucion();
         ModeloDevolucion modelDev = new ModeloDevolucion();
         ctrlDevolucion date = new ctrlDevolucion(vist, modelDev);
             frmPrincipal.dskEscritorio.add(vist);
             vist.show();
             
             time = new Timer (1000,new cronometro());
             time.start();  
              
         }
}   
     public class cronometro implements ActionListener {    
         @Override
         public void actionPerformed(ActionEvent evt){   
            
             GregorianCalendar tiempo = new GregorianCalendar();
             
             hora = tiempo.get(Calendar.HOUR);
             minuto = tiempo.get(Calendar.MINUTE);
             segundo = tiempo.get(Calendar.SECOND);
             if (hora==0) {
                 hora=12;
                    intFrmDevolucion.lblHora.setText(String.valueOf(hora));
                    intFrmDevolucion.lblMinuto.setText(String.valueOf(minuto));
                    intFrmDevolucion.lblSegundo.setText(String.valueOf(segundo));
             } else {
                    intFrmDevolucion.lblHora.setText(String.valueOf(hora));
                    intFrmDevolucion.lblMinuto.setText(String.valueOf(minuto));
                    intFrmDevolucion.lblSegundo.setText(String.valueOf(segundo));
             }
             
             
             
         }
         
}
}
