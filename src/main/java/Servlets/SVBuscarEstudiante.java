package Servlets;

import Logica.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SVBuscarEstudiante", urlPatterns = {"/SVBuscarEstudiante"})
public class SVBuscarEstudiante extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println(request.getParameter("inputGrado"));
        String salon = request.getParameter("inputGrado");
        
        List<Estudiante> listaEstudiantes = (List) request.getSession().getAttribute("listaEstudiantes");
        
         List<Estudiante> listaFiltrada = new ArrayList<>();
        if (salon != null && !salon.isEmpty()) {
            for (Estudiante est : listaEstudiantes) {
                System.out.println(est.getGrado());
                if (est.getGrado().equals(salon)) {
                    listaFiltrada.add(est);
                }
            }
        } else {
            listaFiltrada = null;  // Si no se selecciona un salón, muestra null
        }
        
        HttpSession mySession = request.getSession();
        System.out.println(listaFiltrada);
        
         mySession.setAttribute("listaFiltrada", listaFiltrada);
         response.sendRedirect("dashboard/mostrarEstudiantesFiltrados.jsp");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
