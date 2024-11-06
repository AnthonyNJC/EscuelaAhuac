package Persistencia;

import Logica.Docente;
import Logica.Inventario;
import Logica.Usuario;
import java.util.List;

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

   

    
    
    
    
    
    
    
    
}
