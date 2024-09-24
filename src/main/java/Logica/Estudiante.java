package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Estudiante extends Persona implements Serializable{
    
    @OneToOne
    private Apoderado apoderado;
    @ManyToOne
    @JoinColumn(name = "id_estudiante_grado")
    private Grado grado;

    public Estudiante() {
    }

    public Estudiante(Apoderado apoderado, Grado grado, int id, String dni, String nombre, String apellido, Date fechaNacimiento) {
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

    public Grado getGrado() {
        return grado;
    }

    public void setGrado(Grado grado) {
        this.grado = grado;
    }
    
    
    
    
    
    
}
