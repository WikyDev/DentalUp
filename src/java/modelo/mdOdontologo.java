
package modelo;

/**
 *
 * @author Anthony
 */
public class mdOdontologo {
    private long cedula_odontologo;
    private String nombreCompleto;
    private String especialidad;
    private String correo;
    private int idUser;
    
    public mdOdontologo(){
        
    }
    
    public mdOdontologo(long cedula_odontologo, String nombreCompleto, String especialidad, String correo, int idUser){
        this.cedula_odontologo = cedula_odontologo;
        this.nombreCompleto = nombreCompleto;
        this.especialidad = especialidad;
        this.correo = correo;
        this.idUser = idUser;
    }
    
    //Getters y Setters

    public long getCedulaOdontologo() {
        return cedula_odontologo;
    }

    public void setCedulaOdontologo(long cedula_odontologo) {
        this.cedula_odontologo = cedula_odontologo;
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
    
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
    
}
