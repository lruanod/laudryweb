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
public class pagomembrecia extends HttpServlet {
//xyzpagomembrecia
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
        int idusuariomiembro=Integer.parseInt(request.getParameter("idusuariomiembro")); 
        int mespago=Integer.parseInt(request.getParameter("mespago")); 
        BigDecimal saldo=new BigDecimal(request.getParameter("saldo"));
        String ultimopago2= request.getParameter("ultimopago");
        Date ultimopago=null;
       
      

try{
        ///// para fecha actual
        Date myfecha = new Date();
        SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
        String fecha1 = sm.format(myfecha);
        
        ultimopago=sm.parse(fecha1);
        
        } catch(ParseException e){
            System.out.println("Error: "+e.getMessage());
            
        }
        

        mespago+=1;
        UsuariomiembroCRUD usm=new UsuariomiembroCRUD();
          
        usm.updateMembreciaSaldomensual(idusuariomiembro,saldo, mespago, ultimopago);
         
        response.sendRedirect(request.getContextPath()+"/membrecia.jsp?exito='exito'");
       
       
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
