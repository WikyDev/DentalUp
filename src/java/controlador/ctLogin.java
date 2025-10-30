
package controlador;

/**
 *
 * @author Anthony
 */

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import util.conexion;

/**
 * Controlador simple para validar usuarios. Retorna el rol si las credenciales son 
   correctas, o null si no.
 */
public class ctLogin {

    /**
     * Método principal para validar acceso.
     * Retorna el rol del usuario si las credenciales son correctas.
     */
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

        return rol; // Retorna el rol si existe usuario
    }

    /**
     * Obtiene el id_paciente asociado al usuario logueado.
     */
    public int obtenerIdPaciente(String usuario) {
        int idPaciente = 0;
        String sql = "SELECT p.id_paciente FROM pacientes p " +
                     "INNER JOIN usuarios u ON p.id_user = u.id_user " +
                     "WHERE u.nombre_user = ?";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                idPaciente = rs.getInt("id_paciente");
            }

        } catch (Exception e) {
            System.out.println("Error en obtenerIdPaciente: " + e.getMessage());
        }

        return idPaciente;
    }
}

