
package modelo;

/**
 *
 * @author Anthony
 */

//clase de modelo de la tabla de secretarios 
public class mdSecretario {
    private int cedulaSecretario;
    private String nombreCompleto;
    private String telefono;
    private String correo;
    private int idUser;
            
    public mdSecretario(){
        
    }
    
    public mdSecretario(int cedulaSecretario, String nombreCompleto, String telefono, String correo, int idUser){
        this.cedulaSecretario = cedulaSecretario;
        this.nombreCompleto = nombreCompleto;
        this.telefono = telefono;
        this.correo = correo;
        this.idUser = idUser;
    }

    public int getCedulaSecretario() {
        return cedulaSecretario;
    }

    public void setCedulaSecretario(int cedulaSecretario) {
        this.cedulaSecretario = cedulaSecretario;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

