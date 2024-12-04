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
    
    public Estudiante crearEstudiante(String nombre, String apellido, String dni, Date fecha, String grado){
        Estudiante alumno = new Estudiante();
        alumno.setNombre(nombre);
        alumno.setApellido(apellido);
        alumno.setDni(dni);
        alumno.setFechaNacimiento(fecha);
        alumno.setGrado(grado);
        
        Estudiante alumno1 = controlPersistencia.crearEstudiante(alumno);
        return alumno1;
    }
    
    public void crearApoderado(String nombreApoderado, String apellidoApoderado, String DNIApoderado, Date fechaNacimientoApoderado, String parentesco, String telefono, Estudiante estudiante1) {
        Apoderado apoderado = new Apoderado();
        apoderado.setNombre(nombreApoderado);
        apoderado.setApellido(apellidoApoderado);
        apoderado.setDni(DNIApoderado);
        apoderado.setFechaNacimiento(fechaNacimientoApoderado);
        apoderado.setParentesco(parentesco);
        apoderado.setTelefono(telefono);
        apoderado.setEstudiante(estudiante1);
        
        controlPersistencia.crearApoderado(apoderado);
    }

    
    
    public void crearProducto(String nombreProducto, long codigo, String marca, String modelo, Date fecha, String tipo, String centroCostos, String ubicacion, String estado) {
        Inventario producto = new Inventario();
        producto.setNombreBien(nombreProducto);
        producto.setCodigo(codigo);
        producto.setMarca(marca);
        producto.setModelo(modelo);
        producto.setFechaAlta(fecha);
        producto.setTipoIngreso(tipo);
        producto.setCentroCosto(centroCostos);
        producto.setUbicacionFisica(ubicacion);
        producto.setEstado(estado);
        
        
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

    public List<Estudiante> mostrarEstudiantes() {
        return controlPersistencia.mostrarEstudiantes();
    }
    
    
    //ELIMINAR

    public void eliminarProducto(int id) {
        
        controlPersistencia.eliminarProducto(id);
    }

    public void eliminarMaestro(int id) {
        controlPersistencia.eliminarMaestro(id);
    }

    public void eliminarEstudiante(int id) {
        controlPersistencia.eliminarEstudiante(id);
    }

    

    
    
}
