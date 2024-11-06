package Logica;

import Persistencia.ControladoraPersistencia;
import java.util.Date;
import java.util.List;

public class ControloadoraLogica {
    
    ControladoraPersistencia controlPersistencia = new ControladoraPersistencia();
    
    public void crearUsuario(String usuario, String contrasenia, String rol, Docente maestro){
        Usuario user = new Usuario();
        user.setNombreUsuario(usuario);
        user.setContrasenia(contrasenia);
        user.setRol(rol);
        user.setDocente(maestro);
        controlPersistencia.crearUsuario(user);
    }
    
    
    public Docente crearMaestro(String nombre, String apellido, String DNI, Date fechaNacimiento, String telefono){
        Docente maestro = new Docente();
        maestro.setNombre(nombre);
        maestro.setApellido(apellido);
        maestro.setDni(DNI);
        maestro.setFechaNacimiento(fechaNacimiento);
        maestro.setTelefono(telefono);
        
        Docente docente1=controlPersistencia.crearMaestro(maestro);
        return docente1;
    }
    
    
    public void crearProducto(String nombreProducto, int cantidad) {
        Inventario producto = new Inventario();
        producto.setNombreBien(nombreProducto);
        producto.setCantidad(cantidad);
        
        controlPersistencia.crearProducto(producto);
    }
    
    
    
    
    
    
    
    //MOSTRAR
    public List<Usuario> mostrarUsuarios(){
      return controlPersistencia.mostrarUsuarios();
    }

    public List<Docente> mostrarMaestros() {
        return controlPersistencia.mostrarMaestros();
    }

    public List<Inventario> mostrarProductos() {
       return controlPersistencia.mostrarProductos();
    }

    
}
