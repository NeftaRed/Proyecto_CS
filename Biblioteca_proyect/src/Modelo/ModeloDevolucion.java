/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Vista.intFrmDevolucion;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.swing.JOptionPane;
import java.util.Date;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Anthony Can
 */
public class ModeloDevolucion {
        Connection conectar;
        Date date = null;
        Connection conectConexion = conexion ();
        
    public Connection conexion (){
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
           conectar=DriverManager.getConnection("jdbc:mysql://localhost/bibliotecabd","root","");
           JOptionPane.showMessageDialog(null,"Conexion Exitosa");
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return conectar;
    }
    
    public void insertDevolucion (){
              Date fecha =  intFrmDevolucion.dtcDate.getDate();
              SimpleDateFormat formatoDate = new SimpleDateFormat ("yyyy/MM/d");
              String hora = intFrmDevolucion.lblHora.getText()+":"+intFrmDevolucion.lblMinuto.getText()+":"+intFrmDevolucion.lblSegundo.getText();
            
            try {
                PreparedStatement ppt = conectConexion.prepareStatement("INSERT INTO devolucion (fecha,hora,estadoprestamo)"
                        + " VALUES(?,?,?)");
                
                ppt.setString(1, formatoDate.format(fecha));
                ppt.setString(2, hora);
                ppt.setString(3, intFrmDevolucion.txtObservacion.getText());
                ppt.executeUpdate();
                
                JOptionPane.showMessageDialog(null,"Captura Exitosa");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null,"La Captura No Fue Exitosa ");
            }
    }
    public void mostrarDevolucion(String datoSearch){
        DefaultTableModel tableModel = new DefaultTableModel(); 
        
        tableModel.addColumn("ID devolucion");
        tableModel.addColumn("Fecha");
        tableModel.addColumn("Hora");
        tableModel.addColumn("Estado prestamo");
        intFrmDevolucion.tblDevolucion.setModel(tableModel);
        
        String sql;
        if (datoSearch.equals("")) {
            sql ="SELECT * FROM devolucion";
        } else {
            sql ="SELECT * FROM devolucion WHERE id_devolucion='"+datoSearch+"'";
        }
        String datos []= new String [4];
        try {
            Statement st = conectConexion.createStatement();
            ResultSet rset = st.executeQuery(sql);
            while(rset.next()){
                datos [0]= rset.getString(1);
                datos [1]= rset.getString(2);
                datos [2]= rset.getString(3);
                datos [3]= rset.getString(4);
                tableModel.addRow(datos);
            }
                intFrmDevolucion.tblDevolucion.setModel(tableModel);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Hay un erro. No se pudo mostrar");
        }
    }
    
   public void activar (){
    intFrmDevolucion.btnCancelar.setEnabled(true);
    intFrmDevolucion.btnCapturar.setEnabled(true);
    intFrmDevolucion.txtObservacion.setEnabled(true);
    intFrmDevolucion.dtcDate.setEnabled(true);
    intFrmDevolucion.txtRefrescar.setEnabled(true);
    intFrmDevolucion.btnNuevo.setEnabled(false);

} 
   public void bloquear (){
    intFrmDevolucion.btnNuevo.setEnabled(true);
    intFrmDevolucion.btnCancelar.setEnabled(false);
    intFrmDevolucion.btnCapturar.setEnabled(false);
    intFrmDevolucion.txtRefrescar.setEnabled(false);
    intFrmDevolucion.txtObservacion.setEnabled(false);
    intFrmDevolucion.dtcDate.setEnabled(false);
    
    intFrmDevolucion.txtObservacion.setText(null);
    intFrmDevolucion.dtcDate.setDate(date);

   }
    
}
