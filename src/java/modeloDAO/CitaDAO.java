
package modeloDAO;


import modelo.mdCita;
import util.conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Anthony
 */
public class CitaDAO {

    // Obtener citas por paciente
    public ArrayList<mdCita> obtenerCitasPorPaciente(int cedulaPaciente) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE cedula_paciente = ? ORDER BY fecha_cita DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cedulaPaciente);
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
            System.out.println("Error obteniendo citas del paciente: " + e.getMessage());
        }

        return lista;
    }

    // Obtener citas por odontólogo
    public ArrayList<mdCita> obtenerCitasPorOdontologo(int cedulaOdontologo) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE cedula_odontologo = ? ORDER BY fecha_cita ASC";

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
    
    // Actualizar una cita (fecha, motivo, cedula_odontologo)
    public boolean actualizar(mdCita cita) {
        String sql = "UPDATE citas SET cedula_odontologo = ?, fecha_cita = ?, motivo = ? WHERE id_cita = ?";
        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cita.getCedulaOdontologo());
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
    
    /**
    * Obtiene todas las citas de un paciente usando su CÉDULA.
    * Se apoya en las tablas: citas, pacientes, odontologos.
    */
    public ArrayList<modelo.mdCita> obtenerCitasPorCedulaPaciente(int cedulaPaciente) {
        ArrayList<modelo.mdCita> lista = new ArrayList<>();
 
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
                // OJO: aquí uso idPaciente / idOdontologo como nombre de campo,
                // pero realmente guardan la CÉDULA del paciente y del odontólogo
                 mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("cedula_paciente"),    // idPaciente = cedula_paciente
                        rs.getInt("cedula_odontologo"),  // idOdontologo = cedula_odontologo
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );

                c.setNombrePaciente(rs.getString("nombre_paciente"));
                c.setApellidoPaciente(rs.getString("apellido_paciente"));
                c.setNombreOdontologo(rs.getString("nombre_odontologo"));

                lista.add(c);
           }

        } catch (SQLException e) {
            System.out.println("Error obteniendo citas por cédula de paciente: " + e.getMessage());
        }

        return lista;
    }
    
    public ArrayList<mdCita> listarTodasLasCitas() {
        ArrayList<mdCita> lista = new ArrayList<>();

        String sql =
            "SELECT c.id_cita, c.cedula_paciente, c.cedula_odontologo, c.fecha_cita, " +
            "c.motivo, c.estado, " +
            "p.nombre AS nombre_paciente, p.apellido AS apellido_paciente, " +
            "o.nombre_completo AS nombre_odontologo " +
            "FROM citas c " +
            "LEFT JOIN pacientes p ON c.cedula_paciente = p.cedula_paciente " +
            "LEFT JOIN odontologos o ON c.cedula_odontologo = o.cedula_odontologo " +
            "ORDER BY c.fecha_cita DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                mdCita c = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("cedula_paciente"),
                        rs.getInt("cedula_odontologo"),
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );

                c.setNombrePaciente(rs.getString("nombre_paciente"));
                c.setApellidoPaciente(rs.getString("apellido_paciente"));
                c.setNombreOdontologo(rs.getString("nombre_odontologo"));

                lista.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error listando citas: " + e.getMessage());
        }

        return lista;
    }
    
    // ==========================
    //  MÉTODO NUEVO PARA SECRETARIO (con filtros opcionales)
    // ==========================
    public ArrayList<mdCita> listarCitasParaSecretario(Integer cedulaPaciente, String estado) {
        ArrayList<mdCita> lista = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
            "SELECT c.id_cita, c.cedula_paciente, c.cedula_odontologo, " +
            "       c.fecha_cita, c.motivo, c.estado, " +
            "       p.nombre AS nombre_paciente, p.apellido AS apellido_paciente, " +
            "       o.nombre_completo AS nombre_odontologo " +
            "FROM citas c " +
            "LEFT JOIN pacientes p ON c.cedula_paciente = p.cedula_paciente " +
            "LEFT JOIN odontologos o ON c.cedula_odontologo = o.cedula_odontologo " +
            "WHERE 1=1 "
        );

        List<Object> params = new ArrayList<>();

        // Filtro cédula
        if (cedulaPaciente != null) {
            sql.append(" AND c.cedula_paciente = ? ");
            params.add(cedulaPaciente);
        }

        // Filtro estado
        if (estado != null && !estado.trim().isEmpty()
                && !"TODOS".equalsIgnoreCase(estado.trim())) {
            sql.append(" AND c.estado = ? ");
            params.add(estado.trim());
        }

        sql.append(" ORDER BY c.fecha_cita DESC");

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdCita cita = new mdCita(
                        rs.getInt("id_cita"),
                        rs.getInt("cedula_paciente"),
                        rs.getInt("cedula_odontologo"),
                        rs.getString("fecha_cita"),
                        rs.getString("motivo"),
                        rs.getString("estado")
                );

                cita.setNombrePaciente(rs.getString("nombre_paciente"));
                cita.setApellidoPaciente(rs.getString("apellido_paciente"));
                cita.setNombreOdontologo(rs.getString("nombre_odontologo"));

                lista.add(cita);
            }

        } catch (SQLException e) {
            System.out.println("Error en listarCitasParaSecretario(): " + e.getMessage());
        }

        return lista;
    }

}