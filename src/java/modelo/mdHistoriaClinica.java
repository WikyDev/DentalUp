
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
    private String diagnostico;
    private String tratamiento;
    private Date fecha_registro;

    public mdHistoriaClinica() {}

    public mdHistoriaClinica(int id_historia, int id_paciente, String diagnostico, String tratamiento, Date fecha_registro) {
        this.id_historia = id_historia;
        this.id_paciente = id_paciente;
        this.diagnostico = diagnostico;
        this.tratamiento = tratamiento;
        this.fecha_registro = fecha_registro;
    }

    public int getId_historia() {
        return id_historia;
    }

    public void setId_historia(int id_historia) {
        this.id_historia = id_historia;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
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

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
}

