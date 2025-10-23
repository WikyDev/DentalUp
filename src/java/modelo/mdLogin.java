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
    private String usuario;
    private String password;
    private String rol;

    public mdLogin() {}

    public mdLogin(String usuario, String password, String rol) {
        this.usuario = usuario;
        this.password = password;
        this.rol = rol;
    }
    
    public boolean validar(String usuario, String password) {
        boolean acceso = false;
        String sql = "SELECT * FROM usuarios WHERE usuario=? AND password=?";
        conexion c = new conexion();
        try (Connection cn = c.getConexion();
            PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, usuario);
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
        return usuario; 
    }
    public void setUsuario(String usuario) { 
        this.usuario = usuario; 
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

