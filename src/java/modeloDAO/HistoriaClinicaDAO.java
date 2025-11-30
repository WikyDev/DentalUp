
package modeloDAO;

import modelo.mdHistoriaClinica;
import util.conexion;

import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Anthony
 */
public class HistoriaClinicaDAO {

    // INSERTAR NUEVA HISTORIA CLÍNICA
    public boolean insertar(mdHistoriaClinica h) {
        String sql = "INSERT INTO historias_clinicas " +
                     "(cedula_paciente, cedula_odontologo, fecha, motivoConsulta, diagnostico, tratamiento, observaciones) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, h.getCedulaPaciente());
            ps.setInt(2, h.getCedulaOdontologo());
            ps.setDate(3, h.getFecha());
            ps.setString(4, h.getMotivoConsulta());
            ps.setString(5, h.getDiagnostico());
            ps.setString(6, h.getTratamiento());
            ps.setString(7, h.getObservaciones());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error insertando historia clínica: " + e.getMessage());
            return false;
        }
    }

    // OBTENER HISTORIAS DE UN PACIENTE
    public ArrayList<mdHistoriaClinica> obtenerPorPaciente(int cedulaPaciente) {
        ArrayList<mdHistoriaClinica> lista = new ArrayList<>();
        String sql = "SELECT h.id_historia, h.cedula_paciente, h.cedula_odontologo, h.fecha, "
           + "h.motivoConsulta, h.diagnostico, h.tratamiento, h.observaciones, "
           + "o.nombre_completo AS nombre_odontologo "
           + "FROM historias_clinicas h "
           + "INNER JOIN odontologos o ON h.cedula_odontologo = o.cedula_odontologo "
           + "WHERE h.cedula_paciente = ? "
           + "ORDER BY h.fecha DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cedulaPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setCedulaPaciente(rs.getInt("cedula_paciente"));
                h.setCedulaOdontologo(rs.getInt("cedula_odontologo"));
                h.setFecha(rs.getDate("fecha"));
                h.setMotivoConsulta(rs.getString("motivoConsulta"));
                h.setDiagnostico(rs.getString("diagnostico"));
                h.setTratamiento(rs.getString("tratamiento"));
                h.setObservaciones(rs.getString("observaciones"));
                h.setNombreOdontologo(rs.getString("nombre_odontologo"));

                lista.add(h);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo historias: " + e.getMessage());
        }

        return lista;
    }

    // (OPCIONAL) OBTENER HISTORIAS REGISTRADAS POR UN ODONTÓLOGO
    public ArrayList<mdHistoriaClinica> obtenerPorOdontologo(int cedulaOdontologo) {
        ArrayList<mdHistoriaClinica> lista = new ArrayList<>();
        String sql = "SELECT * FROM historias_clinicas WHERE cedula_odontologo = ? ORDER BY fecha DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cedulaOdontologo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setCedulaPaciente(rs.getInt("cedula_paciente"));
                h.setCedulaOdontologo(rs.getInt("cedula_odontologo"));
                h.setFecha(rs.getDate("fecha"));
                h.setMotivoConsulta(rs.getString("motivoConsulta"));
                h.setDiagnostico(rs.getString("diagnostico"));
                h.setTratamiento(rs.getString("tratamiento"));
                h.setObservaciones(rs.getString("observaciones"));

                lista.add(h);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo historias por odontólogo: " + e.getMessage());
        }

        return lista;
    }
  
}