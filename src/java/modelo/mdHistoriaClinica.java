
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
    private long cedulaPaciente;
    private long cedulaOdontologo;
    private java.sql.Date fecha;
    private String motivoConsulta;
    private String diagnostico;
    private String tratamiento;
    private String observaciones;
    private String nombrePaciente;
    private String nombreOdontologo;
    private int edad;
    private Date fechaNac;
    private String telefono;
    private String email;

    public mdHistoriaClinica() {
    }

    public mdHistoriaClinica(int id_historia, long cedulaPaciente, long cedulaOdontologo, Date fecha, String motivoConsulta, 
            String diagnostico, String tratamiento, String observaciones, String nombrePaciente, String nombreOdontologo) {
        this.id_historia = id_historia;
        this.cedulaPaciente = cedulaPaciente;
        this.cedulaOdontologo = cedulaOdontologo;
        this.fecha = fecha;
        this.motivoConsulta = motivoConsulta;
        this.diagnostico = diagnostico;
        this.tratamiento = tratamiento;
        this.observaciones = observaciones;
        this.nombrePaciente = nombrePaciente;
        this.nombreOdontologo = nombreOdontologo;
    }

    //Geters y seters
    public int getIdHistoria() {
        return id_historia;
    }

    public void setIdHistoria(int idHistoria) {
        this.id_historia = idHistoria;
    }

    public long getCedulaPaciente() {
        return cedulaPaciente;
    }

    public void setCedulaPaciente(long cedulaPaciente) {
        this.cedulaPaciente = cedulaPaciente;
    }

    public long getCedulaOdontologo() {
        return cedulaOdontologo;
    }

    public void setCedulaOdontologo(long cedulaOdontologo) {
        this.cedulaOdontologo = cedulaOdontologo;
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

    public int getId_historia() {
        return id_historia;
    }

    public void setId_historia(int id_historia) {
        this.id_historia = id_historia;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
    
}

