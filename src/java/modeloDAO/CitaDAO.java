
package modeloDAO;


import modelo.mdCita;
import util.conexion;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Anthony
 */
public class CitaDAO {

    // Obtener citas por paciente
    public ArrayList<mdCita> obtenerCitasPorPaciente(int idPaciente) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE id_paciente = ? ORDER BY fecha_cita DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("id_paciente"),
                        rs.getInt("id_odontologo"),
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );
                lista.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo citas del paciente: " + e.getMessage());
        }

        return lista;
    }

    // Obtener citas por odontólogo
    public ArrayList<mdCita> obtenerCitasPorOdontologo(int idOdontologo) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE id_odontologo = ? ORDER BY fecha_cita ASC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idOdontologo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("id_paciente"),
                        rs.getInt("id_odontologo"),
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );
                lista.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo citas del odontólogo: " + e.getMessage());
        }

        return lista;
    }

    // Obtener una cita por ID
    public mdCita obtenerCitaPorId(int idCita) {
        String sql = "SELECT * FROM citas WHERE id_cita = ?";
        mdCita cita = null;

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idCita);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cita = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("id_paciente"),
                        rs.getInt("id_odontologo"),
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo cita por ID: " + e.getMessage());
        }

        return cita;
    }

    // Cambia el estado de una cita a ATENDIDA cuando un odontologo genera la historia clinica 
    public boolean marcarComoAtendida(int idCita) {
        String sql = "UPDATE citas SET estado = 'ATENDIDA' "
                + "WHERE id_cita = ?";

        try (Connection con = conexion.getConexion(); 
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idCita);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            System.out.println("Error al actualizar estado de cita: " + e.getMessage());
            return false;
        }
    }
    
    // Actualizar una cita (fecha, motivo, id_odontologo)
    public boolean actualizar(mdCita cita) {
        String sql = "UPDATE citas SET id_odontologo = ?, fecha_cita = ?, motivo = ? WHERE id_cita = ?";
        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cita.getIdOdontologo());
            ps.setString(2, cita.getFechaCita()); // formato: "YYYY-MM-DD HH:MM"
            ps.setString(3, cita.getMotivo());
            ps.setInt(4, cita.getIdCita());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("Error actualizando cita: " + e.getMessage());
            return false;
        }
    }

    // Eliminar una cita por ID
    public boolean eliminar(int idCita) {
        String sql = "DELETE FROM citas WHERE id_cita = ?";
        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idCita);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("Error eliminando cita: " + e.getMessage());
            return false;
        }
    }

}