
package modelo;

/**
 *
 * @author Anthony
 */

public class mdCita {
    private int idCita;
    private int idPaciente;
    private int idOdontologo;
    private String fechaCita;
    private String motivo;

    public mdCita() {}

    public mdCita(int idPaciente, int idOdontologo, String fechaCita, String motivo) {
        this.idPaciente = idPaciente;
        this.idOdontologo = idOdontologo;
        this.fechaCita = fechaCita;
        this.motivo = motivo;
    }

    public mdCita(int idCita, int idPaciente, int idOdontologo, String fechaCita, String motivo) {
        this.idCita = idCita;
        this.idPaciente = idPaciente;
        this.idOdontologo = idOdontologo;
        this.fechaCita = fechaCita;
        this.motivo = motivo;
    }

    // Getters y Setters
    public int getIdCita() { return idCita; }
    public void setIdCita(int idCita) { this.idCita = idCita; }

    public int getIdPaciente() { return idPaciente; }
    public void setIdPaciente(int idPaciente) { this.idPaciente = idPaciente; }

    public int getIdOdontologo() { return idOdontologo; }
    public void setIdOdontologo(int idOdontologo) { this.idOdontologo = idOdontologo; }

    public String getFechaCita() { return fechaCita; }
    public void setFechaCita(String fechaCita) { this.fechaCita = fechaCita; }

    public String getMotivo() { return motivo; }
    public void setMotivo(String motivo) { this.motivo = motivo; }
}



