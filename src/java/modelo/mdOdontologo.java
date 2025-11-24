
package modelo;

/**
 *
 * @author Anthony
 */
public class mdOdontologo {
    private int idOdonto;
    private String nombreCompleto;
    private String especialidad;
    private String correo;
    
    public mdOdontologo(){
        
    }
    
    public mdOdontologo(int idOdonto, String nombreCompleto, String especialidad, String correo){
        this.idOdonto = idOdonto;
        this.nombreCompleto = nombreCompleto;
        this.especialidad = especialidad;
        this.correo = correo;
    }
    
    //Getters y Setters

    public int getIdOdonto() {
        return idOdonto;
    }

    public void setIdOdonto(int idOdonto) {
        this.idOdonto = idOdonto;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
    
}
