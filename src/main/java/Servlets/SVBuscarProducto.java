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

@WebServlet(name = "SVBuscarProducto", urlPatterns = {"/SVBuscarProducto"})
public class SVBuscarProducto extends HttpServlet {
    ControloadoraLogica controlLogico = new ControloadoraLogica();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println(request.getParameter("inputGrado"));
        String salon = request.getParameter("inputGrado");
        
        List<Inventario> listaProductos = (List) request.getSession().getAttribute("listaProductos");
        
         List<Inventario> listaFiltrada = new ArrayList<>();
        if (salon != null && !salon.isEmpty()) {
            for (Inventario inv : listaProductos) {
                System.out.println(inv.getTipoIngreso());
                if (inv.getTipoIngreso().equals(salon)) {
                    listaFiltrada.add(inv);
                }
            }
        } else {
            listaFiltrada = null;  // Si no se selecciona un salón, muestra null
        }
        
        HttpSession mySession = request.getSession();
        System.out.println(listaFiltrada);
        
         mySession.setAttribute("listaFiltrada", listaFiltrada);
         response.sendRedirect("dashboard/mostrarProductosFiltrados.jsp");
        
        
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
