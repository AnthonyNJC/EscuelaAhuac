/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Logica.ControloadoraLogica;
import Logica.Docente;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yo
 */
@WebServlet(name = "SVEditarLogeado", urlPatterns = {"/SVEditarLogeado"})
public class SVEditarLogeado extends HttpServlet {
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioLogeado");
        if(user==null){
            response.sendRedirect("loginNecesario.jsp");
        }else{
            Docente maestro = user.getDocente();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("maestro", maestro);
        
        
        response.sendRedirect("dashboard/editarMaestro.jsp");
        }
        
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
