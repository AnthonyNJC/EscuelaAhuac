package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Estudiante extends Persona {
    
    @OneToOne(cascade = CascadeType.ALL)
    private Apoderado apoderado;
    private String grado;

    public Estudiante() {
    }

    public Estudiante(Apoderado apoderado, String grado, int id, String dni, String nombre, String apellido, Date fechaNacimiento) {
        super(id, dni, nombre, apellido, fechaNacimiento);
        this.apoderado = apoderado;
        this.grado = grado;
    }

    public Apoderado getApoderado() {
        return apoderado;
    }

    public void setApoderado(Apoderado apoderado) {
        this.apoderado = apoderado;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }
    
    
    
    
    
    
}
