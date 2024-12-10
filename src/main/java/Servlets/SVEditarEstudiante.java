package Servlets;

import Logica.Apoderado;
import Logica.ControloadoraLogica;
import Logica.Estudiante;
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


@WebServlet(name = "SVEditarEstudiante", urlPatterns = {"/SVEditarEstudiante"})
public class SVEditarEstudiante extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Estudiante estudiante1 = controlLogico.mostrarEstudianteId(id);
        HttpSession miSession = request.getSession();
        miSession.setAttribute("estudiante1", estudiante1);
        
        
        
        
        
        response.sendRedirect("dashboard/editarEstudiante.jsp");
        
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
        
        Estudiante estudiante1 = (Estudiante) request.getSession().getAttribute("estudiante1");
        
        estudiante1.setNombre(nombreEstudiante);
        estudiante1.setApellido(apellidoEstudiante);
        estudiante1.setDni(DNIEstudiante);
        estudiante1.setFechaNacimiento(fechaNacimientoEstudiante);
        estudiante1.setGrado(grado);
        
        
        
        Apoderado apo = estudiante1.getApoderado();           
        apo.setNombre(nombreApoderado);
        apo.setApellido(apellidoApoderado);
        apo.setDni(DNIApoderado);
        apo.setFechaNacimiento(fechaNacimientoApoderado);
        apo.setParentesco(parentesco);
        apo.setTelefono(telefono);
        controlLogico.editarApoderado(apo);
        
        
        estudiante1.setApoderado(apo);
        
        controlLogico.editarEstudiante(estudiante1);
        


       
        response.sendRedirect("SVEstudiante");
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
