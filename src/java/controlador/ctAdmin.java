package controlador;

import util.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Operaciones comunes de administración (esqueleto). Ajusta según las columnas reales de tu tabla usuarios/administradores.
 * @author Anthony
 */
public class ctAdmin {

    public boolean crearUsuario(String usuario, String clave, String rol) {
        try {
            conexion c = new conexion();
            String sql = "INSERT INTO usuarios (usuario, clave, rol) VALUES ('" + usuario + "','" + clave + "','" + rol + "')";
            return c.st.executeUpdate(sql) > 0;
        } catch (Exception e) {
            System.out.println("Error creando usuario: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<String> listarUsuarios() {
        ArrayList<String> lista = new ArrayList<>();
        try {
            conexion c = new conexion();
            String sql = "SELECT usuario, rol FROM usuarios";
            ResultSet rs = c.st.executeQuery(sql);
            while (rs.next()) {
                lista.add(rs.getString("usuario") + "," + rs.getString("rol"));
            }
        } catch (Exception e) {
            System.out.println("Error listando usuarios: " + e.getMessage());
        }
        return lista;
    }
}
