package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Apoderado extends Persona {
    
    private String parentesco;
    private String telefono;
    @OneToOne(mappedBy = "apoderado", cascade = CascadeType.ALL, orphanRemoval = true)
    private Estudiante estudiante;

    public Apoderado() {
    }

    public Apoderado(String parentesco, String telefono, Estudiante estudiante, int id, String dni, String nombre, String apellido, Date fechaNacimiento) {
        super(id, dni, nombre, apellido, fechaNacimiento);
        this.parentesco = parentesco;
        this.telefono = telefono;
        this.estudiante = estudiante;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }
    
    
    
    
}
