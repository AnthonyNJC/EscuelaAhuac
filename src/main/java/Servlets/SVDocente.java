package Servlets;

import Logica.ControloadoraLogica;
import Logica.Docente;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SVDocente", urlPatterns = {"/SVDocente"})
public class SVDocente extends HttpServlet {
    
    ControloadoraLogica controlLogica = new ControloadoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Docente> listaDocentes = new ArrayList<Docente>();
        listaDocentes = controlLogica.mostrarMaestros();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaDocentes", listaDocentes);
        
        response.sendRedirect("dashboard/mostrarMaestros.jsp");
        
        
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

        Docente docente1 =controlLogica.crearMaestro(nombre, apellido, DNI, fechaNacimiento, telefono);
        
        controlLogica.crearUsuario(usuario, contrasenia, rol, docente1);
        
        response.sendRedirect("dashboard/index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
