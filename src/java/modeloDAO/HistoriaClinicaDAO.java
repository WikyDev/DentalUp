
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
                     "(id_paciente, id_odontologo, fecha, motivoConsulta, diagnostico, tratamiento, observaciones) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, h.getIdPaciente());
            ps.setInt(2, h.getIdOdontologo());
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
    public ArrayList<mdHistoriaClinica> obtenerPorPaciente(int idPaciente) {
        ArrayList<mdHistoriaClinica> lista = new ArrayList<>();
        String sql = "SELECT h.id_historia, h.id_paciente, h.id_odontologo, h.fecha, "
           + "h.motivoConsulta, h.diagnostico, h.tratamiento, h.observaciones, "
           + "o.nombre_completo AS nombre_odontologo "
           + "FROM historias_clinicas h "
           + "INNER JOIN odontologos o ON h.id_odontologo = o.id_odontologo "
           + "WHERE h.id_paciente = ? "
           + "ORDER BY h.fecha DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setIdPaciente(rs.getInt("id_paciente"));
                h.setIdOdontologo(rs.getInt("id_odontologo"));
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
    public ArrayList<mdHistoriaClinica> obtenerPorOdontologo(int idOdonto) {
        ArrayList<mdHistoriaClinica> lista = new ArrayList<>();
        String sql = "SELECT * FROM historias_clinicas WHERE id_odontologo = ? ORDER BY fecha DESC";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idOdonto);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setIdPaciente(rs.getInt("id_paciente"));
                h.setIdOdontologo(rs.getInt("id_odontologo"));
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
    
    /*public ArrayList<mdHistoriaClinica> listarPorPaciente(int idPaciente) {
        ArrayList<mdHistoriaClinica> lista = new ArrayList<>();
        String sql = "SELECT * FROM historias_clinicas WHERE id_paciente = ?";

        try (Connection con = conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)){
            
            ps.setInt(1, idPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setIdPaciente(rs.getInt("id_paciente"));
                h.setIdOdontologo(rs.getInt("id_odontologo"));
                h.setFecha(rs.getDate("fecha_registro"));
                h.setDiagnostico(rs.getString("diagnostico"));
                h.setTratamiento(rs.getString("tratamiento"));
                h.setObservaciones(rs.getString("observaciones"));

                lista.add(h);
            }

        } catch (Exception e) {
            System.out.println("Error listar historias: " + e);
        }

        return lista;
    }*/

    
}