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
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Controlador para las funcionalidades del secretario (agenda, búsqueda de citas, reportes).
 * Métodos básicos: listarCitas, buscarCitasPorPaciente, eliminarCita.
 */
public class ctSecre {

    public ArrayList<String> listarCitas() {
        ArrayList<String> lista = new ArrayList<>();
        try {
            conexion c = new conexion();
            String sql = "SELECT id_cita, id_paciente, id_odontologo, fecha_cita FROM citas ORDER BY fecha_cita";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getInt("id_cita") + "," + rs.getString("id_paciente") + "," + rs.getString("id_odontologo") + "," + rs.getString("fecha_cita"));
            }
        } catch (Exception e) {
            System.out.println("Error listando citas: " + e.getMessage());
        }
        return lista;
    }

    public ArrayList<String> buscarCitasPorPaciente(String idPaciente) {
        ArrayList<String> lista = new ArrayList<>();
        try {
            conexion c = new conexion();
            String sql = "SELECT id_cita, id_odontologo, fecha_cita FROM citas WHERE id_paciente = '" + idPaciente + "'";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getInt("id_cita") + "," + rs.getString("id_odontologo") + "," + rs.getString("fecha_cita"));
            }
        } catch (Exception e) {
            System.out.println("Error buscando citas por paciente: " + e.getMessage());
        }
        return lista;
    }

    public boolean eliminarCita(String idCita) {
        try {
            conexion c = new conexion();
            String sql = "DELETE FROM citas WHERE id_cita = '" + idCita + "'";
            return c.st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            System.out.println("Error eliminando cita: " + e.getMessage());
            return false;
        }
    }
}

