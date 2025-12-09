/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package controlador;

/**
 *
 * @author Anthony
 */
import util.conexion;
import modelo.mdOdontologo;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.mdCita;
import java.sql.*;

/**
 * Controlador para operaciones sobre odontólogos (esqueleto).
 */
public class ctOdonto {

    public boolean insertarOdontologo(long cedula, String nombre_completo, String especialidad, String correo) {
        try {
            conexion c = new conexion();
            String sql = "INSERT INTO odontologos (cedula_odontologo, nombre_completo, especialidad, correo) VALUES ('" + cedula + "','" + nombre_completo + "','" + especialidad + "','" + correo + "')";
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
            String sql = "SELECT cedula_odontologo, nombre_completo, especialidad FROM odontologos";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getInt("cedula_odontologo") + "," + rs.getString("nombre_completo") + " " + rs.getString("especialidad"));
            }
        } catch (Exception e) {
            System.out.println("Error listando odontologos: " + e.getMessage());
        }
        return lista;
    }
    
    // Listar todas las citas de un odontologo
    public ArrayList<mdCita> obtenerCitasPorOdontologo(long cedulaOdontologo) {
        ArrayList<mdCita> lista = new ArrayList<>();
        String sql = "SELECT c.id_cita, c.cedula_paciente, c.cedula_odontologo, c.fecha_cita, "
               + "c.motivo, c.estado, p.nombre AS nombre_paciente "
               + "FROM citas c "
               + "INNER JOIN pacientes p ON c.cedula_paciente = p.cedula_paciente "
               + "WHERE c.cedula_odontologo = ?";
        try (Connection con = conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, cedulaOdontologo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mdCita c = new mdCita();
                c.setIdCita(rs.getInt("id_cita"));
                c.setCedulaPaciente(rs.getLong("cedula_paciente"));
                c.setCedulaOdontologo(rs.getLong("cedula_odontologo"));
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
    
    public ArrayList<mdOdontologo> obtenerTodos() {
        ArrayList<mdOdontologo> lista = new ArrayList<>();
        String sql = "SELECT cedula_odontologo, CONCAT(nombre_completo) AS nombre_completo, especialidad, correo, id_user FROM odontologos";

        try (Connection con = conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                mdOdontologo o = new mdOdontologo(
                        rs.getLong("cedula_odontologo"),
                        rs.getString("nombre_completo"),
                        rs.getString("especialidad"),
                        rs.getString("correo"),
                        rs.getInt("id_user")
                );
                lista.add(o);
            }

        } catch (Exception e) {
            System.out.println("Error listando odontólogos: " + e.getMessage());
        }

        return lista;
    }
}

