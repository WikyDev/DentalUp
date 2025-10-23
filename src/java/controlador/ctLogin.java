/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author Anthony
 */

import modelo.mdLogin;
import util.conexion;
import java.sql.ResultSet;

/**
 * Controlador simple para validar usuarios. Retorna el rol si las credenciales son correctas, o null si no.
 */
public class ctLogin {

    /*public String validar(String usuario, String password) {
        String rol = null;
        try {
            conexion c = new conexion();
            String sql = "SELECT rol FROM usuarios WHERE usuario='" + usuario + "' AND password='" + password + "'";
            ResultSet rs = c.st.executeQuery(sql);
            if (rs.next()) {
                rol = rs.getString("rol"); // por ejemplo: admin, secre, odonto
            }
        } catch (Exception e) {
            System.out.println("Error en ctLogin: " + e.getMessage());
        }
        return rol;
    }*/
    
    public boolean validarAcceso(String usuario, String password) {
        mdLogin login = new mdLogin();
        return login.validar(usuario, password);
    }
}

