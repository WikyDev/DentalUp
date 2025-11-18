
package controlador;

/**
 *
 * @author Anthony
 */
import modelo.mdPaciente;
import modelo.mdResponsable;
import modelo.mdCita;
import util.conexion;
import java.sql.Statement;
import java.sql.*;
import java.util.ArrayList;

/**
 * Controlador que encapsula la lógica de agendar una cita y obtener las citas del paciente logueado.
 * Opciones del menu paciente 
 * Método principal: registrarCita(...) que guarda paciente, responsable (si aplica) y la cita.
 */

public class ctAgendarCita {

    //Registra una nueva cita 
    public boolean registrarCita(mdCita c) {
        boolean exito = false;
        String sql = "INSERT INTO citas (id_paciente, id_odontologo, fecha_cita, motivo) VALUES (?, ?, ?, ?)";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, c.getIdPaciente());
            ps.setInt(2, c.getIdOdontologo());
            ps.setString(3, c.getFechaCita());
            ps.setString(4, c.getMotivo());
            exito = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al registrar cita: " + e.getMessage());
        }
        return exito;
    }

    // Listar todas las citas de un paciente
    public ArrayList<mdCita> obtenerCitasPorPaciente(int idPaciente) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT c.id_cita, c.id_paciente, c.id_odontologo, c.fecha_cita, c.motivo, c.estado, "
               + "o.nombre_completo AS nombre_odontologo "
               + "FROM citas c "
               + "INNER JOIN odontologos o ON c.id_odontologo = o.id_odontologo "
               + "WHERE c.id_paciente = ?";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mdCita c = new mdCita();
                c.setIdCita(rs.getInt("id_cita"));
                c.setIdPaciente(rs.getInt("id_paciente"));
                c.setIdOdontologo(rs.getInt("id_odontologo"));
                c.setFechaCita(rs.getString("fecha_cita"));
                c.setMotivo(rs.getString("motivo"));
                c.setEstado(rs.getString("estado"));
                c.setNombreOdontologo(rs.getString("nombre_odontologo"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener citas: " + e.getMessage());
        }
        return lista;
    }
    
}


