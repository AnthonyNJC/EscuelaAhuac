package Servlets;

import Logica.ControloadoraLogica;
import Logica.Estudiante;
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

@WebServlet(name = "SVEstudiante", urlPatterns = {"/SVEstudiante"})
public class SVEstudiante extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Estudiante> listaEstudiantes = new ArrayList<Estudiante>();
        listaEstudiantes = controlLogico.mostrarEstudiantes();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaEstudiantes", listaEstudiantes);
        
        response.sendRedirect("dashboard/mostrarEstudiantes.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreEstudiante = request.getParameter("inputNombreEstudiante");
        String apellidoEstudiante = request.getParameter("inputApellidoEstudiante");
        String DNIEstudiante = request.getParameter("inputDNIEstudiante");
        String fechaNacimientoEstudianteString = request.getParameter("inputNacimientoEstudiante");
        String grado = request.getParameter("inputGrado");
        
        String nombreApoderado = request.getParameter("inputNombreApoderado");
        String apellidoApoderado = request.getParameter("inputApellidoApoderado");
        String DNIApoderado = request.getParameter("inputDNIApoderado");
        String fechaNacimientoApoderadoString = request.getParameter("inputNacimientoApoderado");
        String parentesco = request.getParameter("inputParentesco");
        String telefono = request.getParameter("inputTelefono");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimientoEstudiante= null;
        Date fechaNacimientoApoderado= null;

        try {
            // Convertir el String a java.util.Date
            fechaNacimientoEstudiante = formatter.parse(fechaNacimientoEstudianteString);
            fechaNacimientoApoderado = formatter.parse(fechaNacimientoApoderadoString);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al parsear la fecha");
            return;
        }


        Estudiante estudiante1 =controlLogico.crearEstudiante(nombreEstudiante, apellidoEstudiante, DNIEstudiante, fechaNacimientoEstudiante, grado);
        
        controlLogico.crearApoderado(nombreApoderado, apellidoApoderado, DNIApoderado, fechaNacimientoApoderado, parentesco, telefono, estudiante1);
        
        response.sendRedirect("dashboard/index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
