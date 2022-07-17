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
import javax.servlet.http.HttpSession;
import modelos.CRUD.UsuarioCRUD;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author user
 */
public class cambiopasscli extends HttpServlet {
//xyzcambiopasscli
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
        HttpSession sesion = request.getSession(true);//// recuperando la sesion 
        PrintWriter out = response.getWriter();
        String clavesha1 =request.getParameter("pass2");
        String clave=DigestUtils.sha1Hex(clavesha1);
        
    int idusuario=(Integer)sesion.getAttribute("idusuario");
    int tipousuario=(Integer)sesion.getAttribute("tipousuario");
        
        UsuarioCRUD us=new UsuarioCRUD();
        
        
        us.updateUsuariocambiarpass(idusuario, clave);
        
        if(tipousuario==1){
         response.sendRedirect(request.getContextPath()+"/home?cambiopass='exito'");
        }
         
        if(tipousuario==2){
         response.sendRedirect(request.getContextPath()+"/interfazoperador.jsp?cambiopass='exito'");
        }
        
        
        if(tipousuario==3){
         response.sendRedirect(request.getContextPath()+"/interfazadmin.jsp?cambiopass='exito'");
        }
        
         if(tipousuario==4){
         response.sendRedirect(request.getContextPath()+"/interfazmotorista.jsp?cambiopass='exito'");
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
