package Servlets;

import Logica.ControloadoraLogica;
import Logica.Docente;
import Logica.PasswordUtil;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SVEditarMaestro", urlPatterns = {"/SVEditarMaestro"})
public class SVEditarMaestro extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        Docente maestro = controlLogico.mostrarMaestroId(id);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("maestro", maestro);
        
        
        response.sendRedirect("dashboard/editarMaestro.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("inputNombre");
        String apellido = request.getParameter("inputApellido");
        String DNI = request.getParameter("inputDNI");
        String fechaNacimientoString = request.getParameter("inputNacimiento");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento= null;

        try {
            // Convertir el String a java.util.Date
            fechaNacimiento = formatter.parse(fechaNacimientoString);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al parsear la fecha");
            return;
        }
        String telefono = request.getParameter("inputTelefono");
        String rol = request.getParameter("inputRol");
        String usuario = request.getParameter("inputUsuario");
        String contrasenia = request.getParameter("inputPassword");
        
        //hasheo de la contraseña
        String hashedPassword = PasswordUtil.hashPassword(contrasenia);
        
         Docente maestro1 = (Docente) request.getSession().getAttribute("maestro");
        
        maestro1.setNombre(nombre);
        maestro1.setApellido(apellido);
        maestro1.setDni(DNI);
        maestro1.setFechaNacimiento(fechaNacimiento);
        maestro1.setTelefono(telefono);
        
        Usuario user = maestro1.getUsuario();
        user.setNombreUsuario(usuario);
        user.setRol(rol);
        user.setContrasenia(hashedPassword);
        
        controlLogico.editarUsuario(user);
        
        maestro1.setUsuario(user);

        controlLogico.editarMestro(maestro1);
        
        response.sendRedirect("SVDocente");
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
