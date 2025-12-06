
package modelo;

/**
 *
 * @author Anthony
 */

//clase de modelo de la tabla de administradores 
public class mdAdmin {
    private long cedulaAdmin;
    private String nombreCompleto;
    private String correo;
    private int idUser;
    
    
    public mdAdmin(){
        
    }
    
    public mdAdmin(long cedulaAdmin, String nombreCompleto, String correo, int idUser){
        this.cedulaAdmin = cedulaAdmin;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.idUser = idUser;
    }

    public long getCedulaAdmin() {
        return cedulaAdmin;
    }

    public void setCedulaAdmin(long cedulaAdmin) {
        this.cedulaAdmin = cedulaAdmin;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
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

