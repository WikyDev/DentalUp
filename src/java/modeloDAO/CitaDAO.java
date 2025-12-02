package modeloDAO;

import modelo.mdCita;
import util.conexion;
import java.sql.*;
import java.util.ArrayList;

/**
 * DAO para gestionar las citas en la base de datos.
 * Mapea cedula_paciente / cedula_odontologo de la BD
 * a los campos idPaciente / idOdontologo del modelo mdCita.
 */
public class CitaDAO {

    // Obtener citas por paciente (cedula del paciente)
    public ArrayList<mdCita> obtenerCitasPorPaciente(int cedulaPaciente) {
        ArrayList<mdCita> lista = new ArrayList<>();

        String sql =
            "SELECT c.id_cita, " +
            "       c.cedula_paciente, " +
            "       c.cedula_odontologo, " +
            "       c.fecha_cita, " +
            "       c.motivo, " +
            "       c.estado, " +
            "       p.nombre AS nombre_paciente, " +
            "       p.apellido AS apellido_paciente, " +
            "       o.nombre_completo AS nombre_odontologo " +
            "FROM citas c " +
            "LEFT JOIN pacientes p ON c.cedula_paciente = p.cedula_paciente " +
            "LEFT JOIN odontologos o ON c.cedula_odontologo = o.cedula_odontologo " +
            "WHERE c.cedula_paciente = ? " +
            "ORDER BY c.fecha_cita DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cedulaPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("cedula_paciente"),    // <-- mapeo a idPaciente
                        rs.getInt("cedula_odontologo"),  // <-- mapeo a idOdontologo
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );

                // Seteamos nombres para que el frontend pueda mostrarlos
                String nomPac = rs.getString("nombre_paciente");
                String apePac = rs.getString("apellido_paciente");
                if (nomPac != null && apePac != null) {
                    c.setNombrePaciente(nomPac + " " + apePac);
                } else if (nomPac != null) {
                    c.setNombrePaciente(nomPac);
                }

                c.setNombreOdontologo(rs.getString("nombre_odontologo"));

                lista.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo citas del paciente: " + e.getMessage());
        }

        return lista;
    }

    // Obtener citas por odontólogo (cedula del odontólogo)
    public ArrayList<mdCita> obtenerCitasPorOdontologo(int cedulaOdontologo) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql =
            "SELECT * FROM citas " +
            "WHERE cedula_odontologo = ? " +
            "ORDER BY fecha_cita ASC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cedulaOdontologo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("cedula_paciente"),
                        rs.getInt("cedula_odontologo"),
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
                        rs.getInt("cedula_paciente"),
                        rs.getInt("cedula_odontologo"),
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

    // Insertar nueva cita
    public boolean insertar(mdCita cita) {
        String sql =
            "INSERT INTO citas (cedula_paciente, cedula_odontologo, fecha_cita, motivo, estado) " +
            "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cita.getIdPaciente());     // aquí idPaciente = cedula_paciente
            ps.setInt(2, cita.getIdOdontologo());   // aquí idOdontologo = cedula_odontologo
            ps.setString(3, cita.getFechaCita());
            ps.setString(4, cita.getMotivo());
            ps.setString(5, cita.getEstado() != null ? cita.getEstado() : mdCita.ESTADO_PENDIENTE);

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error insertando cita: " + e.getMessage());
        }

        return false;
    }

    // Cambia el estado de una cita a ATENDIDA
    public boolean marcarComoAtendida(int idCita) {
        String sql =
            "UPDATE citas SET estado = 'ATENDIDA' " +
            "WHERE id_cita = ?";

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

}
