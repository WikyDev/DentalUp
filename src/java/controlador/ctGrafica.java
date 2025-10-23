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
import java.util.HashMap;
import java.util.Map;

/**
 * Controlador para obtener datos que alimenten gráficas.
 * Devuelve un mapa (ejemplo: conteo por mes, por tratamiento, etc.).
 * Ajusta las consultas SQL a tus necesidades de reporte.
 */
public class ctGrafica {

    public Map<String, Integer> conteoCitasPorMes() {
        Map<String, Integer> mapa = new HashMap<>();
        try {
            conexion c = new conexion();
            String sql = "SELECT DATE_FORMAT(fecha_cita, '%Y-%m') as mes, COUNT(*) as total FROM citas GROUP BY mes";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                mapa.put(rs.getString("mes"), rs.getInt("total"));
            }
        } catch (Exception e) {
            System.out.println("Error en ControladorGrafica: " + e.getMessage());
        }
        return mapa;
    }
}

