package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Grado implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idGrado;
    private String ordenGrado;
    @OneToMany(mappedBy = "grade")
    private List<Estudiante> listaEstudiantes;
    @OneToOne
    private Docente docente;

    public Grado() {
    }

    public Grado(int idGrado, String ordenGrado, List<Estudiante> listaEstudiantes, Docente docente) {
        this.idGrado = idGrado;
        this.ordenGrado = ordenGrado;
        this.listaEstudiantes = listaEstudiantes;
        this.docente = docente;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public String getOrdenGrado() {
        return ordenGrado;
    }

    public void setOrdenGrado(String ordenGrado) {
        this.ordenGrado = ordenGrado;
    }

    public List<Estudiante> getListaEstudiantes() {
        return listaEstudiantes;
    }

    public void setListaEstudiantes(List<Estudiante> listaEstudiantes) {
        this.listaEstudiantes = listaEstudiantes;
    }

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }
    
    
    
    
}
