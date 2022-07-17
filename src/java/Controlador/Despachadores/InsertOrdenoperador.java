/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import static javax.print.attribute.Size2DSyntax.MM;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.CRUD.FacturaCRUD;
import modelos.CRUD.OrdenoperadorCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.Factura;
import modelos.Ordenoperador;
import modelos.Usuario;

/**
 *
 * @author user
 */
public class InsertOrdenoperador extends HttpServlet {
  //xyzInsertOrdenoperador
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
            
          String tiempo=request.getParameter("tiempo");
          int idusuario=Integer.parseInt(request.getParameter("idusuario"));
          int nofactura=Integer.parseInt(request.getParameter("nofactura"));
          String recargo2=request.getParameter("recargo");
          BigDecimal recargo=new BigDecimal(recargo2);
          BigDecimal total  =null;
          String estado="PROCESANDO";
          double recargo3=recargo.doubleValue();
         
          UsuarioCRUD user=new UsuarioCRUD();
          FacturaCRUD fact=new FacturaCRUD();
          OrdenoperadorCRUD ord=new OrdenoperadorCRUD();
         // getFacturaPorIdbuscarn
         //getUsuarioPorIdunion
         //updatefacturaestado
         //getFacturaesnofact
         
      if(recargo3>0){   
          ArrayList<Factura> datos=fact.getFacturaesnofact(nofactura);/// consulta bd 
               request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                         ArrayList<Factura> list = (ArrayList<Factura>) request.getAttribute("datos");
                             for(Factura fact2 : list) {

                                    total=fact2.getTotal();
                                    
                                    
                                                       }
                        
                      fact.updatefacturarecargototal(nofactura, recargo, total.add(recargo));
                   }  
         
         
         
         
       Factura factura=fact.getFacturaPorIdbuscarn(nofactura);
       Usuario usuario=user.getUsuarioPorIdunion(idusuario);
         
          ord.addOrdenoperador(new Ordenoperador(factura,usuario,estado,tiempo));
          
          fact.updatefacturaestado(nofactura, estado);
          
          
         response.sendRedirect(request.getContextPath()+"/pedidos.jsp?exito='exito'");
        
      
        
        
        
        
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
