package Servlets;

import Logica.ControloadoraLogica;
import Logica.Inventario;
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


@WebServlet(name = "SVEditarProducto", urlPatterns = {"/SVEditarProducto"})
public class SVEditarProducto extends HttpServlet {
    ControloadoraLogica controlLogico = new ControloadoraLogica();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id =Integer.parseInt(request.getParameter("id"));
        
        Inventario producto = controlLogico.mostrarProductoId(id);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("producto", producto);
        
        response.sendRedirect("dashboard/editarProducto.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("inputNombre");
        long codigo = Long.parseLong(request.getParameter("inputCodigo"));
        String marca = request.getParameter("inputMarca");
        String modelo = request.getParameter("inputModelo");
        String fechaString = request.getParameter("inputFecha");
        String tipo = request.getParameter("inputTipo");
        String centroCostos = request.getParameter("inputCentroCostos");
        String ubicacion = request.getParameter("inputUbicacion");
        String estado = request.getParameter("inputEstado");
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha= null;

        try {
            // Convertir el String a java.util.Date
            fecha = formatter.parse(fechaString);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al parsear la fecha");
            System.out.println("Error en la fecha");
            return;
        }
        
        Inventario producto = (Inventario) request.getSession().getAttribute("producto");
        
        producto.setNombreBien(nombre);
        producto.setCodigo(codigo);
        producto.setMarca(marca);
        producto.setModelo(modelo);
        producto.setFechaAlta(fecha);
        producto.setTipoIngreso(tipo);
        producto.setCentroCosto(centroCostos);
        producto.setUbicacionFisica(ubicacion);
        producto.setEstado(estado);
        
        controlLogico.editarProducto(producto);
        
        
        
        response.sendRedirect("SVInventario");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
