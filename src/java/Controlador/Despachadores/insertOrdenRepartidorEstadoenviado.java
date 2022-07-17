/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.CRUD.FacturaCRUD;
import modelos.CRUD.OrdenrepartidorCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.Factura;
import modelos.Ordenrepartidor;
import modelos.Usuario;

/**
 *
 * @author user
 */
public class insertOrdenRepartidorEstadoenviado extends HttpServlet {
//xyzinsertOrdenRepartidorEstadoenviado
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
           
       int idusuario=Integer.parseInt(request.getParameter("idusuario"));
          int nofactura=Integer.parseInt(request.getParameter("nofactura"));
          String entrega="ENVIADO A ENTREGAR";
          String estado="ENVIADO A ENTREGAR";
          
         
          UsuarioCRUD user=new UsuarioCRUD();
          FacturaCRUD fact=new FacturaCRUD();
          OrdenrepartidorCRUD ord=new OrdenrepartidorCRUD();
           
        
            Factura factura=fact.getFacturaPorIdbuscarn(nofactura);
               Usuario usuario=user.getUsuarioPorIdunion(idusuario);
           
            ord.addOrdenrepartidor(new Ordenrepartidor(factura,usuario,entrega));
               fact.updatefacturaestado(nofactura, estado);
          
             
             
            response.sendRedirect(request.getContextPath()+"/reparto.jsp?exito='exito'");
             
        
        
        
        
        
        
       
       
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
