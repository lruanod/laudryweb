/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import classes.Articulo;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class Addcesta extends HttpServlet {
    
     //agregarproducto

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
        
         int id=Integer.parseInt(request.getParameter("idtarifa"));  //  rescatar  el parametro id 
         int cantidad = Integer.parseInt(request.getParameter("cantidad")); 
       
        
        HttpSession sesion = request.getSession(true);//// recuperando la sesion 
        
        ArrayList<Articulo>articulos=sesion.getAttribute("cesta")==null ? new ArrayList<>():(ArrayList) sesion.getAttribute("cesta");
       // si la varible sesion  ya tiene una variable llamada cesta en caso de que no  se crea un nuevo array list si ya exite se recupera
       
       
       boolean flag = false;
        if (articulos.size()>0) {
            /// recorriendo mi array list si ya exite un articulo en mi carrio
            for(Articulo a : articulos){
                if(id == a.getIdtarifa()){
                    a.setCantidad(a.getCantidad()+ cantidad);
                    
                    flag=true;  //// encuentra el articulo
                    
                    break;
                    
                }
            }
            
        }
        /// articulo no existia en la cesta
        if( !flag) {
            articulos.add(new Articulo(id, cantidad));  // agragamos a la cesta
        }
        
        sesion.setAttribute("cesta", articulos); /// agregamos a la variable sesiion para que se mantenga entre las paginas
     
        response.sendRedirect("cesta.jsp");
        
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
