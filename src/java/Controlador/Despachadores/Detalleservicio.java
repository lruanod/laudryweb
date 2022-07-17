/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.CRUD.ServiciosCRUD;
import modelos.CRUD.TarifaCRUD;
import modelos.Servicio;
import modelos.Tarifa;






/**
 *
 * @author user
 */
public class Detalleservicio extends HttpServlet {
//detalleservicio
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
        request.setCharacterEncoding("UTF-8");
        
        
       
            
            
       try{
        int id=Integer.parseInt(request.getParameter("abcDFJKlaundry"));  //  rescatar  el parametro id 
        
 
   
        
        //// consular el servicio por id
        ServiciosCRUD op=new ServiciosCRUD();
        ArrayList<Servicio> datos=op.getServicioporid(id);
        request.setAttribute("datos", datos);// pasamos los parametros de la consulta
        
        /// cunsular la tarifa y los servicios por id
        TarifaCRUD ta=new TarifaCRUD();
        ArrayList<Tarifa> datos2=ta.getServicioporidtarifa(id);
        request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
        
        
     
         // despachar a
         
       
         request.getRequestDispatcher("detalleservicio.jsp").forward(request, response);
      
         
        }  catch (Exception e) {
            
        response.sendRedirect(request.getContextPath()+"/home?editarurl='editarurl'");
        
        }
        
       
        
        
        
       
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
