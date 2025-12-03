
package modelo;

/**
 *
 * @author Anthony
 */

public class mdCita {
    private int idCita;
    private int cedulaPaciente;
    private int cedulaOdontologo;
    private String fechaCita;
    private String motivo;
    private String estado;
    private String nombrePaciente;
    private String apellidoPaciente;
    private String nombreOdontologo;
    
    public static final String ESTADO_PENDIENTE = "PENDIENTE";
    public static final String ESTADO_ATENDIDA = "ATENDIDA";

    public mdCita() {}

    public mdCita(int cedulaPaciente, int cedulaOdontologo, String fechaCita, String motivo, String estado) {
        this.cedulaPaciente = cedulaPaciente;
        this.cedulaOdontologo = cedulaOdontologo;
        this.fechaCita = fechaCita;
        this.motivo = motivo;
        this.estado = estado;
    }

    public mdCita(int idCita, int cedulaPaciente, int cedulaOdontologo, String fechaCita, String motivo, String estado) {
        this.idCita = idCita;
        this.cedulaPaciente = cedulaPaciente;
        this.cedulaOdontologo = cedulaOdontologo;
        this.fechaCita = fechaCita;
        this.motivo = motivo;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public int getCedulaPaciente() {
        return cedulaPaciente;
    }

    public void setCedulaPaciente(int cedulaPaciente) {
        this.cedulaPaciente = cedulaPaciente;
    }

    public int getCedulaOdontologo() {
        return cedulaOdontologo;
    }

    public void setCedulaOdontologo(int cedulaOdontologo) {
        this.cedulaOdontologo = cedulaOdontologo;
    }

    public String getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(String fechaCita) {
        this.fechaCita = fechaCita;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }
    
    public String getApellidoPaciente() {
        return apellidoPaciente;
    }

    public void setApellidoPaciente(String apellidoPaciente) {
        this.apellidoPaciente = apellidoPaciente;
    }

    public String getNombreOdontologo() {
        return nombreOdontologo;
    }

    public void setNombreOdontologo(String nombreOdontologo) {
        this.nombreOdontologo = nombreOdontologo;
    }
    
    
}



