/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import classes.Articulo;
import classes.Servicio;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.CRUD.ServiciosCRUD;
import modelos.CRUD.TarifaCRUD;
import modelos.Tarifa;

/**
 *
 * @author user
 */
public class DeleteItem extends HttpServlet {
    //borrariteml

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
        
         
         
        int idtarifa= Integer.parseInt(request.getParameter("idtarifa"));
        
        
        HttpSession sesion = request.getSession(true);//// recuperando la sesion 
        
        ArrayList<Articulo>articulos=sesion.getAttribute("cesta")==null ? null:(ArrayList) sesion.getAttribute("cesta");
       // si la varible sesion  ya tiene una variable llamada cesta en caso de que no  se crea un nuevo array list si ya exite se recupera 
       
       if(articulos != null){
              for(Articulo a : articulos){/// recorriendo la lista para remover  el articulo seleccionado
                       if(a.getIdtarifa() == idtarifa){
                           articulos.remove(a);
                           break;
                        }
               }
       }
       
       double total=0;
       
     //  Controladorservicio cs = new Controladorservicio();
     
        
       
        ServiciosCRUD op=new ServiciosCRUD();
        TarifaCRUD tar=new TarifaCRUD();
        
        
       
       for(Articulo a : articulos){/// recorriendo la lista para remover  el articulo seleccionado
           
      //  ArrayList<Servicio> datos=op.getServicioporid(a.getIdservicio());/// consulta bd 
        ArrayList<modelos.Tarifa> datos =tar.getTarifaporid(a.getIdtarifa());
                                                  
                                                   
                                                    
                                                       
                                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
                                                 
                                                 // retrieve your list from the request, with casting 
ArrayList<Tarifa> list = (ArrayList<Tarifa>) request.getAttribute("datos");

// print the information about every category of the list
for(Tarifa tari: list) {
  
    
double tarifa= tari.getTarifaSer().doubleValue();
    
//double tarifa = ser.getTarifaSer().doubleValue(); // The double you want

 //Servicio servicio = cs.getServicio(a.getIdservicio());
 
           total += a.getCantidad() * tarifa;

  
    }
           
          
           
           
           
            }
        
        response.getWriter().print(Math.round(total* 100.0)/100.0);
        
        
        
        
        
        
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
