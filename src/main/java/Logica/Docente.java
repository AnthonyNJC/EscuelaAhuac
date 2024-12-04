package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Docente extends Persona {
    
    
    private String telefono;
    @OneToOne(cascade = CascadeType.ALL)
    private Usuario usuario;

    public Docente(String telefono, Usuario usuario, int id, String dni, String nombre, String apellido, Date fechaNacimiento) {
        super(id, dni, nombre, apellido, fechaNacimiento);
        this.telefono = telefono;
        this.usuario = usuario;
    }
    

    public Docente() {
    }
    
    
    

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
    
}
