
package controlador;

/**
 *
 * @author Anthony
 */
import util.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.mdCita;
import java.sql.*;

/**
 * Controlador para operaciones sobre odontólogos (esqueleto).
 * Ajusta columnas según tu tabla 'odontologos' o como la tengas definida.
 */
public class ctOdonto {

    public boolean insertarOdontologo(String id, String nombre, String apellido, String especialidad, String telefono, String email) {
        try {
            conexion c = new conexion();
            String sql = "INSERT INTO odontologos (id_odontologo, nombre, apellido, especialidad, telefono, email) VALUES ('"
                    + id + "','" + nombre + "','" + apellido + "','" + especialidad + "','" + telefono + "','" + email + "')";
            return c.st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            System.out.println("Error insertando odontologo: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<String> listarOdontologos() {
        ArrayList<String> lista = new ArrayList<>();
        try {
            conexion c = new conexion();
            String sql = "SELECT id_odontologo, nombre, apellido FROM odontologos";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getString("id_odontologo") + "," + rs.getString("nombre") + " " + rs.getString("apellido"));
            }
        } catch (Exception e) {
            System.out.println("Error listando odontologos: " + e.getMessage());
        }
        return lista;
    }
    
    // Listar todas las citas de un odontologo
    public ArrayList<mdCita> obtenerCitasPorOdontologo(int idOdontologo) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT c.id_cita, c.id_paciente, c.id_odontologo, c.fecha_cita, "
               + "c.motivo, c.estado, p.nombre AS nombre_paciente "
               + "FROM citas c "
               + "INNER JOIN pacientes p ON c.id_paciente = p.id_paciente "
               + "WHERE c.id_odontologo = ?";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idOdontologo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mdCita c = new mdCita();
                c.setIdCita(rs.getInt("id_cita"));
                c.setIdPaciente(rs.getInt("id_paciente"));
                c.setIdOdontologo(rs.getInt("id_odontologo"));
                c.setFechaCita(rs.getString("fecha_cita"));
                c.setMotivo(rs.getString("motivo"));
                c.setEstado(rs.getString("estado"));
                c.setNombrePaciente(rs.getString("nombre_paciente"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener citas: " + e.getMessage());
        }
        return lista;
    }
}

