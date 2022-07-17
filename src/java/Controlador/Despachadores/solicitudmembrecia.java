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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.*;
import modelos.CRUD.MembreciaCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.CRUD.UsuariomiembroCRUD;


/**
 *
 * @author user
 */
public class solicitudmembrecia extends HttpServlet {
//xyzsolicitudmembrecia
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
        HttpSession session = request.getSession(true);//// recuperando la sesion 
            
        int idusuario=(Integer)session.getAttribute("idusuario");
        int idmembrecia=Integer.parseInt(request.getParameter("idmembrecia"));
        String estado="PENDIENTE";
        double saldodisponible2=0;
        BigDecimal saldodisponible=new BigDecimal(saldodisponible2);
        int mespago=0;
        int mesmax=12;  
        String ultimopago2="1992-06-30";
        Date ultimopago=null;
        Date inicio=null;
        
        try{
        ///// para fecha actual
        Date myfecha = new Date();
        SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
        String fecha1 = sm.format(myfecha);
        ultimopago=sm.parse(ultimopago2);
        
        inicio=sm.parse(fecha1);
        
        } catch(ParseException e){
            System.out.println("Error: "+e.getMessage());
        }
       
         UsuariomiembroCRUD usm=new UsuariomiembroCRUD();
         MembreciaCRUD mem=new MembreciaCRUD();
         UsuarioCRUD us=new UsuarioCRUD();
         Membrecia membrecia=mem.getMembresiaPorIdbus(idmembrecia);
         Usuario usuario=us.getUsuarioPorIdunion(idusuario);
         
         
    
       usm.addUsuariomiembro(new Usuariomiembro(membrecia,usuario,inicio,inicio,ultimopago,estado,saldodisponible,mespago,mesmax));// agregado a tabla usuariomiembro
          
       response.sendRedirect(request.getContextPath()+"/membrecia.jsp?exito2='exito'");
        
       
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
