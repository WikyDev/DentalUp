/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author Anthony
 */
import modelo.mdPaciente;
import modelo.mdResponsable;
import modelo.mdAgendar;
import util.conexion;
import java.sql.Statement;

/**
 * Controlador que encapsula la lógica de agendar una cita.
 * Método principal: registrarCita(...) que guarda paciente, responsable (si aplica) y la cita.
 * Usa util.conexion y Statement (compatibilidad con tu proyecto original).
 */
public class ctAgendarCita {

    public boolean registrarCita(mdPaciente paciente, mdResponsable responsable, mdAgendar cita) {
        boolean exitoPaciente = false;
        boolean exitoResponsable = true;
        boolean exitoCita = false;

        try {
            conexion c = new conexion();
            Statement st = c.st;

            // Insertar paciente
            String sqlPaciente = String.format("INSERT INTO pacientes (id_paciente, nombre, apellido, edad, telefono, fecha_nac, tiene_OS, tipo_sangre, email) VALUES ('%s','%s','%s','%d','%s','%s','%s','%s','%s')",
                    paciente.getIdPaciente(), paciente.getNombre(), paciente.getApellido(), paciente.getEdad(), paciente.getTelefono(), paciente.getFechaNac(), paciente.getTieneOS(), paciente.getTipoSangre(), paciente.getEmail());
            exitoPaciente = (st.executeUpdate(sqlPaciente) > 0);

            // Insertar responsable si viene
            if (responsable != null && responsable.getCedula() != null && !responsable.getCedula().isEmpty()) {
                String sqlResp = String.format("INSERT INTO responsables (cedula_responsable, nombre, apellido, edad, telefono, fecha_nac, email, tipo_relacion) VALUES ('%s','%s','%s','%d','%s','%s','%s','%s')",
                        responsable.getCedula(), responsable.getNombre(), responsable.getApellido(), responsable.getEdad(), responsable.getTelefono(), responsable.getFechaNac(), responsable.getEmail(), responsable.getTipoRelacion());
                exitoResponsable = (st.executeUpdate(sqlResp) > 0);

                // actualizar paciente con cedula responsable
                if (exitoResponsable) {
                    String sqlUpdate = String.format("UPDATE pacientes SET cedula_responsable = '%s' WHERE id_paciente = '%s'",
                            responsable.getCedula(), paciente.getIdPaciente());
                    st.executeUpdate(sqlUpdate);
                }
            }

            // Insertar cita
            String sqlCita = String.format("INSERT INTO citas (id_paciente, id_odontologo, fecha_cita, motivo) VALUES ('%s','%s','%s','%s')",
                    cita.getIdPaciente(), cita.getIdOdontologo(), cita.getFechaCita(), cita.getMotivo());
            exitoCita = (st.executeUpdate(sqlCita) > 0);

            // cerrar conexión si tu clase lo requiere (la clase util.conexion original puede manejarlo internamente)
            try { if (c.st != null) c.st.close(); } catch (Exception ignore) {}

        } catch (Exception e) {
            System.out.println("Error en ControladorAgendarCita: " + e.getMessage());
        }

        return exitoPaciente && exitoResponsable && exitoCita;
    }
}

