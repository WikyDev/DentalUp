
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

            ps.setLong(1, h.getCedulaPaciente());
            ps.setLong(2, h.getCedulaOdontologo());
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
    public ArrayList<mdHistoriaClinica> obtenerPorPaciente(long cedulaPaciente) {
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

            ps.setLong(1, cedulaPaciente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                mdHistoriaClinica h = new mdHistoriaClinica();
                h.setIdHistoria(rs.getInt("id_historia"));
                h.setCedulaPaciente(rs.getLong("cedula_paciente"));
                h.setCedulaOdontologo(rs.getLong("cedula_odontologo"));
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
                h.setCedulaPaciente(rs.getLong("cedula_paciente"));
                h.setCedulaOdontologo(rs.getLong("cedula_odontologo"));
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

    public mdHistoriaClinica obtenerPorId(int idHistoria) {
    String sql = "SELECT h.id_historia, h.cedula_paciente, h.cedula_odontologo, h.fecha, "
               + "h.motivoConsulta, h.diagnostico, h.tratamiento, h.observaciones, "
               + "CONCAT (p.nombre, ' ', p.apellido) AS nombrePaciente, "
               + "p.edad, p.telefono, p.fecha_nac, p.email, "
               + "o.nombre_completo AS nombreOdontologo "
               + "FROM historias_clinicas h "
               + "INNER JOIN pacientes p ON h.cedula_paciente = p.cedula_paciente "
               + "INNER JOIN odontologos o ON h.cedula_odontologo = o.cedula_odontologo "
               + "WHERE h.id_historia = ?";

    mdHistoriaClinica h = null;

    try (Connection con = conexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, idHistoria);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            h = new mdHistoriaClinica();
            h.setIdHistoria(rs.getInt("id_historia"));
            h.setCedulaPaciente(rs.getLong("cedula_paciente"));
            h.setCedulaOdontologo(rs.getLong("cedula_odontologo"));
            h.setFecha(rs.getDate("fecha"));
            h.setMotivoConsulta(rs.getString("motivoConsulta"));
            h.setDiagnostico(rs.getString("diagnostico"));
            h.setTratamiento(rs.getString("tratamiento")); 
            h.setObservaciones(rs.getString("observaciones"));
            
            //datos traídos con JOIN
            h.setNombrePaciente(rs.getString("nombrePaciente"));
            h.setEdad(rs.getInt("edad"));
            h.setTelefono(rs.getString("telefono"));
            h.setFechaNac(rs.getDate("fecha_nac"));
            h.setEmail(rs.getString("email"));
            h.setNombreOdontologo(rs.getString("nombreOdontologo"));
        }

    } catch (Exception e) {
        System.out.println("Error obtener historia: " + e.getMessage());
    }

    return h;
}

public boolean actualizar(mdHistoriaClinica h) {

    String sql = "UPDATE historias_clinicas SET motivoConsulta=?, diagnostico=?, tratamiento=?, observaciones=? "
               + "WHERE id_historia=?";

    try (Connection con = conexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, h.getMotivoConsulta());
        ps.setString(2, h.getDiagnostico());
        ps.setString(3, h.getTratamiento());
        ps.setString(4, h.getObservaciones());
        ps.setInt(5, h.getIdHistoria());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        System.out.println("Error al actualizar historia clínica: " + e.getMessage());
        return false;
    }
}

    

    
}