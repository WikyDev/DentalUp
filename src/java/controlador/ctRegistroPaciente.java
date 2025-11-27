package controlador;


import java.util.ArrayList;
import modelo.mdPaciente;
import util.conexion;
import java.sql.*;

/**
 * Controlador lógico para registrar pacientes en la tabla usuarios.
 * El rol se asigna automáticamente como 'paciente'.
 */
public class ctRegistroPaciente {

    /**
    * Este metodo hace la inserción en ambas tablas tomando los datos enviados desde la  
    * vista de registro mediante el RegistroPacientesServlet
    */
    public boolean registrarPaciente(mdPaciente paciente, String nombre_user, String password) {
    boolean ok = false;

    String sqlUsuario = "INSERT INTO usuarios (nombre_user, password, rol) VALUES (?, ?, 'paciente')";
    String sqlPaciente = "INSERT INTO pacientes (cedula_paciente, nombre, apellido, edad, telefono, fecha_nac, tiene_OS, tipo_sangre, email, id_user) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (Connection con = conexion.getConexion();
         PreparedStatement psUser = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
         PreparedStatement psPaciente = con.prepareStatement(sqlPaciente)) {

        // Crear usuario
        psUser.setString(1, nombre_user);
        psUser.setString(2, password);
        int filasUser = psUser.executeUpdate();

        if (filasUser == 0) {
            System.out.println("⚠️ No se insertó ningún usuario.");
            return false;
        }

        // Obtener id_user generado
        ResultSet rs = psUser.getGeneratedKeys();
        int idUser = 0;
        if (rs.next()) {
            idUser = rs.getInt(1);
        } else {
            System.out.println("⚠️ No se obtuvo id_user generado.");
            return false;
        }

        // Crear paciente vinculado
        psPaciente.setInt(1, paciente.getCedulaPaciente());
        psPaciente.setString(2, paciente.getNombre());
        psPaciente.setString(3, paciente.getApellido());
        psPaciente.setInt(4, paciente.getEdad());
        psPaciente.setString(5, paciente.getTelefono());
        psPaciente.setString(6, paciente.getFechaNac());
        psPaciente.setString(7, paciente.getTieneOS());
        psPaciente.setString(8, paciente.getTipoSangre());
        psPaciente.setString(9, paciente.getEmail());
        psPaciente.setInt(10, idUser);

        int filas = psPaciente.executeUpdate();
        ok = filas > 0;

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("❌ Error en registrarPaciente: " + e.getMessage());
    }

    return ok;
}
}

