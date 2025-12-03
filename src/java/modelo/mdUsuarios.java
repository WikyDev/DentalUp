
package modelo;

/**
 *
 * @author Anthony
 */

//clase de modelo de la tabla de usuarios 
public class mdUsuarios {
    private int id_user;
    private String nombre_user;
    private String password;
    private String rol;

    public mdUsuarios() {
    }

    public mdUsuarios(int id_user, String nombre_user, String password, String rol) {
        this.id_user = id_user;
        this.nombre_user = nombre_user;
        this.password = password;
        this.rol = rol;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getNombre_user() {
        return nombre_user;
    }

    public void setNombre_user(String nombre_user) {
        this.nombre_user = nombre_user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }  
}

