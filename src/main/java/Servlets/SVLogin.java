package Servlets;

import Logica.ControloadoraLogica;
import Logica.PasswordUtil;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SVLogin", urlPatterns = {"/SVLogin"})
public class SVLogin extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalida la sesión
        request.getSession().invalidate();
        // Redirige al login u otra página
        response.sendRedirect("index.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        
        //hash de la contraseña
        String hashedPassword = PasswordUtil.hashPassword(contrasenia);
        boolean validacion = false;
        validacion = controlLogico.comprobarIngreso(usuario, hashedPassword);
        
        
        if(validacion == true){
            Usuario user = controlLogico.usuarioId(usuario, hashedPassword);
            HttpSession miSession=request.getSession(true);
            miSession.setAttribute("usuarioLogeado", user);
            response.sendRedirect("dashboard/index.jsp");
        }else{
           response.sendRedirect("loginError.jsp");
        }
        
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
