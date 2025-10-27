/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Anthony
 */

public class mdResponsable {
    private String cedula;
    private String nombre;
    private String apellido;
    private int edad;
    private String telefono;
    private String fechaNac;
    private String email;
    private String tipoRelacion;

    public mdResponsable() {}

    public mdResponsable(String cedula, String nombre, String apellido, int edad, String telefono, String fechaNac, String email, String tipoRelacion) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.telefono = telefono;
        this.fechaNac = fechaNac;
        this.email = email;
        this.tipoRelacion = tipoRelacion;
    }

    // Getters y setters
    public String getCedula() { 
        return cedula; 
    }
    public void setCedula(String cedula) { 
        this.cedula = cedula; 
    }
    public String getNombre() { 
        return nombre; 
    }
    public void setNombre(String nombre) { 
        this.nombre = nombre; 
    }
    public String getApellido() { 
        return apellido; 
    }
    public void setApellido(String apellido) { 
        this.apellido = apellido; 
    }
    public int getEdad() { 
        return edad; 
    }
    public void setEdad(int edad) { 
        this.edad = edad; 
    }
    public String getTelefono() { 
        return telefono; 
    }
    public void setTelefono(String telefono) { 
        this.telefono = telefono; 
    }
    public String getFechaNac() { 
        return fechaNac; 
    }
    public void setFechaNac(String fechaNac) { 
        this.fechaNac = fechaNac; 
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTipoRelacion() {
        return tipoRelacion;
    }
    public void setTipoRelacion(String tipoRelacion) {
        this.tipoRelacion = tipoRelacion;
    }
}

