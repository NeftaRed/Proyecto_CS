/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.ModeloDevolucion;
import Vista.intFrmDevolucion;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.JOptionPane;
/**
 *
 * @author Anthony Can
 */
public class ctrlDevolucion  {

    private intFrmDevolucion vistaint;
    private ModeloDevolucion modelo;

    public ctrlDevolucion(intFrmDevolucion vistaint, ModeloDevolucion modelo ) {
          this.vistaint = vistaint;
          this.modelo = modelo;
          
          modelo.bloquear();
          modelo.mostrarDevolucion(intFrmDevolucion.txtBuscar.getText());
          vistaint.btnNuevo.addActionListener(new Activar());
          vistaint.txtBuscar.addKeyListener(new contador());
          vistaint.btnCancelar.addActionListener(new Desactivar());
          vistaint.btnCapturar.addActionListener(new capturarDate());
          intFrmDevolucion.txtObservacion.addKeyListener(new contador ());
          intFrmDevolucion.txtRefrescar.addActionListener(new refrescar());
    }
    
  public class Activar implements ActionListener {
         @Override
         public void actionPerformed(ActionEvent evt){   
              modelo.activar();    
         }                
    }
  public class Desactivar implements ActionListener {
         @Override
         public void actionPerformed(ActionEvent evt){   
              modelo.bloquear();    
         }                
    }
  
  public class capturarDate implements ActionListener {
         @Override
         public void actionPerformed(ActionEvent evt){   
             try {
                  modelo.insertDevolucion();
             } catch (Exception e) {
                  JOptionPane.showMessageDialog(null,"Revise que todos los campos esten llenos correctamente");
             }
        }        
   }
   public class refrescar implements ActionListener {
         @Override
         public void actionPerformed(ActionEvent evt){  
              intFrmDevolucion.txtBuscar.setText(null);
             modelo.mostrarDevolucion(intFrmDevolucion.txtBuscar.getText());
        }        
   }
  public class contador implements KeyListener {             
         @Override
         public void keyTyped(KeyEvent ke) {
           
            modelo.activar();
            int contador = intFrmDevolucion.txtObservacion.getText().length();
            String contenedor = intFrmDevolucion.txtObservacion.getText();
            intFrmDevolucion.lblContador.setText(String.valueOf(contador+1));
            
                if(contador+1>69){
                    String CadenaNueva = contenedor.substring(0, contenedor.length()-1);
                    intFrmDevolucion.txtObservacion.setText(CadenaNueva);
                }   
        }
        @Override
        public void keyPressed(KeyEvent ke) {
        }
        @Override
        public void keyReleased(KeyEvent ke) {
             modelo.mostrarDevolucion(intFrmDevolucion.txtBuscar.getText());
        }
   }
 
    
}
