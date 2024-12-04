package Servlets;

import Logica.ControloadoraLogica;
import Logica.Docente;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SVUsuarios", urlPatterns = {"/SVUsuarios"})
public class SVUsuarios extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlLogico.mostrarUsuarios();
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaUsuarios", listaUsuarios);
        
        System.out.println("lista: "+ listaUsuarios );
        response.sendRedirect("dashboard/mostrarUsuarios.jsp");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
