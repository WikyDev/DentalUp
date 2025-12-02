
package modelo;

/**
 *
 * @author Anthony
 */

public class mdPaciente {
    private int idPaciente;
    private String nombre;
    private String apellido;
    private int edad;
    private String telefono;
    private String fechaNac;
    private String tieneOS;
    private String tipoSangre;
    private String email;
    private Integer cedulaResponsable;

    public mdPaciente() {}

    public mdPaciente(int idPaciente, String nombre, String apellido, int edad, String telefono, String fechaNac,
                    String tieneOS, String tipoSangre, String email, Integer cedulaResponsable) {
        this.idPaciente = idPaciente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.telefono = telefono;
        this.fechaNac = fechaNac;
        this.tieneOS = tieneOS;
        this.tipoSangre = tipoSangre;
        this.email = email;
        this.cedulaResponsable = cedulaResponsable;
    }

    // Getters y Setters
    public int getIdPaciente() { return idPaciente; }
    public void setIdPaciente(int idPaciente) { this.idPaciente = idPaciente; }

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

    public String getTieneOS() { return tieneOS; }
    public void setTieneOS(String tieneOS) { this.tieneOS = tieneOS; }

    public String getTipoSangre() { return tipoSangre; }
    public void setTipoSangre(String tipoSangre) { this.tipoSangre = tipoSangre; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Integer getCedulaResponsable() { return cedulaResponsable; }
    public void setCedulaResponsable(Integer cedulaResponsable) { this.cedulaResponsable = cedulaResponsable; }
}

