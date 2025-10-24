/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Anthony
 */
public class mdAgendar {
    private String idPaciente;
    private String idOdontologo;
    private String fechaCita;
    private String motivo;

    public mdAgendar() {}

    public mdAgendar(String idPaciente, String idOdontologo, String fechaCita, String motivo) {
        this.idPaciente = idPaciente;
        this.idOdontologo = idOdontologo;
        this.fechaCita = fechaCita;
        this.motivo = motivo;
    }

    public String getIdPaciente() { 
        return idPaciente; 
    }
    public void setIdPaciente(String idPaciente) { 
        this.idPaciente = idPaciente; 
    }
    public String getIdOdontologo() { 
        return idOdontologo; 
    }
    public void setIdOdontologo(String idOdontologo) { 
        this.idOdontologo = idOdontologo;
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
}

