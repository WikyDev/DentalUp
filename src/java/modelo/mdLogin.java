/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import util.conexion;
import java.sql.*;

/**
 *
 * @author Anthony
 */
public class mdLogin {
    private String nombre_user;
    private String password;
    private String rol;

    public mdLogin() {}

    public mdLogin(String nombre_user, String password, String rol) {
        this.nombre_user = nombre_user;
        this.password = password;
        this.rol = rol;
    }
    
    public boolean validar(String nombre_user, String password) {
        boolean acceso = false;
        String sql = "SELECT * FROM usuarios WHERE nombre_user=? AND password=?";
        conexion c = new conexion();
        try (Connection cn = c.getConexion();
            PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, nombre_user);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acceso = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return acceso;
    }

    public String getUsuario() { 
        return nombre_user; 
    }
    public void setUsuario(String usuario) { 
        this.nombre_user = usuario; 
    }
    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }
    public String getRol() { 
        return rol; 
    }
    public void setRol(String rol) { 
        this.rol = rol; 
    }
}

