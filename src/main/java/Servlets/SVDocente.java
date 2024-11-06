package Servlets;

import Logica.ControloadoraLogica;
import Logica.Docente;
import Logica.Usuario;
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
