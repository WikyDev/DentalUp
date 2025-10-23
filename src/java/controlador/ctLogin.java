/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author Anthony
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.conexion;

/**
 * Controlador simple para validar usuarios. Retorna el rol si las credenciales son correctas, o null si no.
 */
public class ctLogin {
      //metodo de validación de usuarios
      public String validarAcceso(String usuario, String password) {
        String rol = null;
        String sql = "SELECT rol FROM usuarios WHERE nombre_user = ? AND password = ?";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    rol = rs.getString("rol");
                }
            }

        } catch (Exception e) {
            System.out.println("Error en validarAcceso: " + e.getMessage());
        }

        return rol; // Devuelve el rol si el usuario existe
    }
}

