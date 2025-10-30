
package modelo;

/**
 *
 * @author Anthony
 */

public class mdResponsable {
    private int cedulaResponsable;
    private String nombre;
    private String apellido;
    private int edad;
    private String telefono;
    private String fechaNac;
    private String email;
    private String tipoRelacion;

    public mdResponsable() {}

    public mdResponsable(int cedulaResponsable, String nombre, String apellido, int edad,
                       String telefono, String fechaNac, String email, String tipoRelacion) {
        this.cedulaResponsable = cedulaResponsable;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.telefono = telefono;
        this.fechaNac = fechaNac;
        this.email = email;
        this.tipoRelacion = tipoRelacion;
    }

    // Getters y Setters
    public int getCedulaResponsable() { return cedulaResponsable; }
    public void setCedulaResponsable(int cedulaResponsable) { this.cedulaResponsable = cedulaResponsable; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }

    public int getEdad() { return edad; }
    public void setEdad(int edad) { this.edad = edad; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getFechaNac() { return fechaNac; }
    public void setFechaNac(String fechaNac) { this.fechaNac = fechaNac; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getTipoRelacion() { return tipoRelacion; }
    public void setTipoRelacion(String tipoRelacion) { this.tipoRelacion = tipoRelacion; }
}


