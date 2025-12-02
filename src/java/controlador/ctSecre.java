package controlador;

import modeloDAO.CitaDAO;
import modelo.mdCita;
import java.util.ArrayList;

/**
 * Controlador para funcionalidades del secretario:
 * - Buscar citas por paciente (cédula)
 * - Listar citas (si luego lo necesitas)
 * - Eliminar / marcar atendida (si se requiere)
 */
public class ctSecre {

    private final CitaDAO citaDAO = new CitaDAO();

    /**
     * Lista todas las citas de un paciente por su cédula.
     * Esto es lo que va a usar vs_buscarCita.jsp.
     */
    public ArrayList<mdCita> buscarCitasPorPaciente(int cedulaPaciente) {
        return citaDAO.obtenerCitasPorPaciente(cedulaPaciente);
    }

    /**
     * (Opcional) si luego quieres listar todas las citas del sistema
     * podríamos agregar un método en CitaDAO para eso y llamarlo aquí.
     */
    // public ArrayList<mdCita> listarTodasLasCitas() { ... }

    /**
     * (Opcional) marcar cita como atendida desde el módulo de secretario.
     */
    public boolean marcarCitaComoAtendida(int idCita) {
        return citaDAO.marcarComoAtendida(idCita);
    }

    /**
     * (Opcional) si decides permitir eliminación física de citas.
     * Para eso habría que crear en CitaDAO un método eliminar(int idCita).
     */
    // public boolean eliminarCita(int idCita) { ... }
}
