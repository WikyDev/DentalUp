package controlador;

import util.conexion;
import java.util.ArrayList;

/**
 * Controlador lógico para registrar pacientes en la tabla usuarios.
 * El rol se asigna automáticamente como 'paciente'.
 */
public class ctRegistroPaciente {

    public boolean registrarPaciente(String nombre, String password) {
        try {
            conexion c = new conexion();
            ArrayList<String> datos = new ArrayList<>();

            // Los valores que se insertarán en la tabla usuarios
            datos.add(nombre);       // nombre_user
            datos.add(password);     // password
            datos.add("paciente");   // Rol fijo, nunca viene del formulario

            // Inserta en la tabla 'usuarios'
            return c.insertar("usuarios", "nombre_user, password, rol", datos);

        } catch (Exception e) {
            System.out.println("Error registrando paciente: " + e.getMessage());
            return false;
        }
    }
}

