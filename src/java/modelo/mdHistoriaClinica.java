
package modelo;

/**
 *
 * @author Anthony
 */
/**
 * Modelo por el momento sin funcion.
 * se va corrigiendo a medida que se agrega la funcion de ver historia en el menu de paciente.
 * El contenido es simplemente temporal
*/

import java.sql.Date;

public class mdHistoriaClinica {
    private int id_historia;
    private int id_paciente;
    private int id_odontologo;
    private java.sql.Date fecha;
    private String motivoConsulta;
    private String diagnostico;
    private String tratamiento;
    private String observaciones;
    private String nombrePaciente;
    private String nombreOdontologo;

    public mdHistoriaClinica() {
    }

    public mdHistoriaClinica(int id_historia, int id_paciente, int id_odontologo, Date fecha, String motivoConsulta, String diagnostico, String tratamiento, String observaciones) {
        this.id_historia = id_historia;
        this.id_paciente = id_paciente;
        this.id_odontologo = id_odontologo;
        this.fecha = fecha;
        this.motivoConsulta = motivoConsulta;
        this.diagnostico = diagnostico;
        this.tratamiento = tratamiento;
        this.observaciones = observaciones;
    }

    //Geters y seters
    public int getIdHistoria() {
        return id_historia;
    }

    public void setIdHistoria(int idHistoria) {
        this.id_historia = idHistoria;
    }

    public int getIdPaciente() {
        return id_paciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.id_paciente = idPaciente;
    }

    public int getIdOdontologo() {
        return id_odontologo;
    }

    public void setIdOdontologo(int idOdontologo) {
        this.id_odontologo = idOdontologo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMotivoConsulta() {
        return motivoConsulta;
    }

    public void setMotivoConsulta(String motivoConsulta) {
        this.motivoConsulta = motivoConsulta;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreOdontologo() {
        return nombreOdontologo;
    }

    public void setNombreOdontologo(String nombreOdontologo) {
        this.nombreOdontologo = nombreOdontologo;
    }
    
    
}

