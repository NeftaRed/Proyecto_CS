/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bdConector;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author USUARIO
 */
public class csConectorMYSQL {
    
    public String url="jdbc:mysql://localhost/aplicacion";
    
    public String usuario="root";
    
    public String pass="";

    public csConectorMYSQL() {
        
    }
    
    public Connection Conectar(){
        
        Connection direccion=null;
        
        try {
            
            Class.forName("org.gjt.mm.mysql.Driver");
            
            direccion = DriverManager.getConnection(url, usuario, pass);
            
        } catch (Exception e) {
            
            JOptionPane.showMessageDialog(null, e);
            
        }
                
        return direccion;
    }
}
