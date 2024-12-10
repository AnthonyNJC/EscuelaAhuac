package Persistencia;

import Logica.Apoderado;
import Logica.Docente;
import Logica.Estudiante;
import Logica.Inventario;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    
    ApoderadoJpaController apoderadoJPA =new ApoderadoJpaController();
    DocenteJpaController docenteJPA =new DocenteJpaController();
    EstudianteJpaController estudianteJPA =new EstudianteJpaController();
    InventarioJpaController inventarioJPA =new InventarioJpaController();
    PersonaJpaController personaJPA =new PersonaJpaController();
    UsuarioJpaController usuarioJPA =new UsuarioJpaController();
    
    
    //CREAR: USUARIOS, MAESTROS
    
    public void crearUsuario(Usuario user){
        usuarioJPA.create(user);
    }
    public Docente crearMaestro(Docente maestro){
        docenteJPA.create(maestro);
        return  docenteJPA.findDocente(maestro.getId());
    }
    
    public void crearProducto(Inventario producto) {
        inventarioJPA.create(producto);
    }
    
    public Estudiante crearEstudiante(Estudiante alumno) {
        estudianteJPA.create(alumno);
        return estudianteJPA.findEstudiante(alumno.getId());
    }
    
     public void crearApoderado(Apoderado apoderado) {
         apoderadoJPA.create(apoderado);
    }
    
    
    
    
    
    
    
    
    
    
    
    //MOSTRAR; MAESTROS, USUARIOS
    
    public List<Usuario> mostrarUsuarios(){
       return usuarioJPA.findUsuarioEntities();
    }

    public List<Docente> mostrarMaestros() {
       return docenteJPA.findDocenteEntities();
    }

    public List<Inventario> mostrarProductos() {
        return inventarioJPA.findInventarioEntities();
    }

    public List<Estudiante> mostrarEstudiantes() {
        return estudianteJPA.findEstudianteEntities();
    }
    
    //MOSTRAR POR ID
    
    public Estudiante mostrarEstudianteId(int id) {
       return estudianteJPA.findEstudiante(id);
    }
     public Docente mostrarMaestroId(int id) {
         return docenteJPA.findDocente(id);
     }
     public Inventario mostrarProductoId(int id) {
         return inventarioJPA.findInventario(id);
    }
    
    
    
    
    
    //ELIMINAR

    public void eliminarProducto(int id) {
        try {
            inventarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarMaestro(int id) {
        try {
            docenteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarEstudiante(int id) {
        try {
            estudianteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    //EDITAR

    public void editarEstudiante(Estudiante estudiante1) {
        try {
            estudianteJPA.edit(estudiante1);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarApoderado(Apoderado apo) {
        try {
            apoderadoJPA.edit(apo);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarUsuario(Usuario user) {
        try {
            usuarioJPA.edit(user);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarMaestro(Docente maestro1) {
        try {
            docenteJPA.edit(maestro1);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarProducto(Inventario producto) {
        try {
            inventarioJPA.edit(producto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

   


    

   

    

   

    
    
    
    
    
    
    
    
}
