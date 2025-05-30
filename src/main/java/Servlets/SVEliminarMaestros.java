package Servlets;

import Logica.ControloadoraLogica;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SVEliminarMaestros", urlPatterns = {"/SVEliminarMaestros"})
public class SVEliminarMaestros extends HttpServlet {
    ControloadoraLogica controlLogico= new ControloadoraLogica();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogeado");
        
        if(usuario!=null){
        int id = Integer.parseInt(request.getParameter("id"));
        
        controlLogico.eliminarMaestro(id);
        
        response.sendRedirect("SVDocente");
            
        }else{
            response.sendRedirect("loginNecesario.jsp");
        }
        
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
