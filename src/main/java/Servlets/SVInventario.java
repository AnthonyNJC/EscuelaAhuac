package Servlets;

import Logica.ControloadoraLogica;
import Logica.Inventario;
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

@WebServlet(name = "SVInventario", urlPatterns = {"/SVInventario"})
public class SVInventario extends HttpServlet {
    
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Inventario> listaProductos = new ArrayList<Inventario>();
        listaProductos = controlLogico.mostrarProductos();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaProductos", listaProductos);
        
        response.sendRedirect("dashboard/mostrarInventario.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreProducto = request.getParameter("inputNombre");
        int cantidad = Integer.parseInt(request.getParameter("inputCantidad"));
        
        controlLogico.crearProducto(nombreProducto, cantidad);
        
        response.sendRedirect("dashboard/index.jsp");
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
