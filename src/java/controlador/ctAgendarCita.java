
package controlador;

/**
 *
 * @author Anthony
 */
import modelo.mdCita;
import util.conexion;
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
        String sql = "INSERT INTO citas (cedula_paciente, cedula_odontologo, fecha_cita, motivo) VALUES (?, ?, ?, ?)";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, c.getCedulaPaciente());
            ps.setLong(2, c.getCedulaOdontologo());
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
        String sql = "SELECT c.id_cita, c.cedula_paciente, c.cedula_odontologo, c.fecha_cita, c.motivo, c.estado, "
               + "o.nombre_completo AS nombre_odontologo "
               + "FROM citas c "
               + "INNER JOIN odontologos o ON c.cedula_odontologo = o.cedula_odontologo "
               + "WHERE c.cedula_paciente = ?";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mdCita c = new mdCita();
                c.setIdCita(rs.getInt("id_cita"));
                c.setCedulaPaciente(rs.getLong("cedula_paciente"));
                c.setCedulaOdontologo(rs.getLong("cedula_odontologo"));
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
    
    
    //Validar disponibilidad del odontólogo
    public boolean odontologoDisponible(int cedulaOdontologo, String fechaHora) {

        String sql = "SELECT COUNT(*) FROM citas WHERE cedula_odontologo = ? AND fecha_cita = ?";
        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, cedulaOdontologo);
            ps.setString(2, fechaHora);

            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return false; // Si ya existe una cita en ese horario
            }

        } catch (Exception e) {
            System.out.println("Error al validar disponibilidad: " + e.getMessage());
        }

        return true; // Disponible
    }

    
}


