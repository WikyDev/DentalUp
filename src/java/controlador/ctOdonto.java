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
 * Controlador para operaciones sobre odontólogos (esqueleto).
 * Ajusta columnas según tu tabla 'odontologos' o como la tengas definida.
 */
public class ctOdonto {

    public boolean insertarOdontologo(String id, String nombre, String apellido, String especialidad, String telefono, String email) {
        try {
            conexion c = new conexion();
            String sql = "INSERT INTO odontologos (id_odontologo, nombre, apellido, especialidad, telefono, email) VALUES ('"
                    + id + "','" + nombre + "','" + apellido + "','" + especialidad + "','" + telefono + "','" + email + "')";
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
            String sql = "SELECT id_odontologo, nombre, apellido FROM odontologos";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getString("id_odontologo") + "," + rs.getString("nombre") + " " + rs.getString("apellido"));
            }
        } catch (Exception e) {
            System.out.println("Error listando odontologos: " + e.getMessage());
        }
        return lista;
    }
}

