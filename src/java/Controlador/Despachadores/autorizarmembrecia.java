/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.CRUD.UsuariomiembroCRUD;

/**
 *
 * @author user
 */
public class autorizarmembrecia extends HttpServlet {
    ///xyzautorizarmembrecia
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
            
       int idusuariomiembro=Integer.parseInt(request.getParameter("idusuariomiembro"));
       String vencimiento2=request.getParameter("vencimiento");
       String estado="ACTIVO";
       Date vencimiento=null;
       
      try{
     
        SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
        vencimiento=sm.parse(vencimiento2);
            
        } catch(ParseException e){
            System.out.println("Error: "+e.getMessage());
        } 
       
       UsuariomiembroCRUD usu=new UsuariomiembroCRUD();
       
       usu.updateMembreciaestadoactivo(idusuariomiembro, estado, vencimiento);
        
       response.sendRedirect(request.getContextPath()+"/validarmembrecias.jsp?exito='exito'");
      
      
      
       
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
