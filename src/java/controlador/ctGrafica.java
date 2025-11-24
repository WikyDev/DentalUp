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

    public Map<String, Integer> conteoCitasPorMotivo() {
    Map<String, Integer> mapa = new HashMap<>();
    try {
        conexion c = new conexion();
        String sql = "SELECT motivo, COUNT(*) AS total FROM citas GROUP BY motivo";
        ResultSet rs = c.st.executeQuery(sql);
        while (rs.next()) {
            mapa.put(rs.getString("motivo"), rs.getInt("total"));
        }
    } catch (Exception e) {
        System.out.println("Error en conteoCitasPorMotivo: " + e.getMessage());
    }
    return mapa;
}


}

