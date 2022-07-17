/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.CRUD.CategoriasCRUD;
import modelos.CRUD.ServiciosCRUD;
import modelos.CRUD.TarifaCRUD;
import modelos.Categorias;
import modelos.Servicio;
import modelos.Tarifa;

/**
 *
 * @author user
 */
public class insertServicio extends HttpServlet {
//xyzinsertServicio
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
        PrintWriter out = response.getWriter();    
        CategoriasCRUD cat=new CategoriasCRUD();
        ServiciosCRUD ser=new ServiciosCRUD();
        
         String nombreser=request.getParameter("nombreser");
         String descripcion=request.getParameter("descripcion");
         String url=request.getParameter("url");
         String estado="ACTIVO";
         
     int idcategoria=Integer.parseInt(request.getParameter("idcategoria")); 
        
       
          Categorias categorias =cat.getCategoriasPorIdbus(idcategoria);
         
        
           ser.addServicio(new Servicio(categorias,nombreser,descripcion,url,estado));
         
     
     response.sendRedirect(request.getContextPath()+"/AdministrarTarifario.jsp?exito='exito'");
        
        
        
        
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
