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
import modelos.CRUD.UsuarioCRUD;

/**
 *
 * @author user
 */
public class modificarusuario extends HttpServlet {
//xyzmodificarusuario
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
        String nombre= request.getParameter("nombre"); 
        String apellido=request.getParameter("apellido");
        String nit=request.getParameter("nit");
        String direccion=request.getParameter("direccion");
        String usuario =  request.getParameter("usuario");
        String descripcioncasa=request.getParameter("descripcion_casa");
        String estado=request.getParameter("estado");
        String correo=request.getParameter("correo");
        String tel= request.getParameter("tel");
        String cel= request.getParameter("cel");
        String dpi=request.getParameter("dpi");
        int idmunicipio=Integer.parseInt(request.getParameter("idmunicipio"));
        int idtipousuario=Integer.parseInt(request.getParameter("idtipousuario"));
        int idusuario=Integer.parseInt(request.getParameter("idusuario"));
        
       
        UsuarioCRUD us=new UsuarioCRUD();
        
        
        us.updateUsuario(idusuario, nombre, apellido, nit, direccion, descripcioncasa, correo, usuario, tel, cel, dpi, idmunicipio, idtipousuario, estado);
       
        response.sendRedirect(request.getContextPath()+"/usuariosOperador.jsp?exito='exito'");
        
        
       
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
