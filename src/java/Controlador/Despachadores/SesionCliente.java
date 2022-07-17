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
import modelos.CRUD.UsuarioCRUD;
import modelos.Usuario;
import javax.servlet.http.HttpSession;
import modelos.CRUD.MembreciaCRUD;
import modelos.CRUD.UsuariomiembroCRUD;
import modelos.Membrecia;
import modelos.Usuariomiembro;
import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author user
 */
public class SesionCliente extends HttpServlet {
//xyzSesionCliente
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
        
         String usuarioOcorreo= request.getParameter("usuarioOcorreo"); 
         String userinvalido="invalido";
         String clavesha1=request.getParameter("clave");
         String clave=DigestUtils.sha1Hex(clavesha1);
        int idtipousuario=0;
        
          UsuarioCRUD op=new UsuarioCRUD();
          UsuariomiembroCRUD us=new UsuariomiembroCRUD();
          MembreciaCRUD mem=new MembreciaCRUD();
        
        ArrayList<Usuario> datos=op.getSesioncliente(usuarioOcorreo,clave);/// consulta bd 
       request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
                          
                         
                                                 // retrieve your list from the request, with casting 
ArrayList<Usuario> list = (ArrayList<Usuario>) request.getAttribute("datos");
        
        if (list.isEmpty()){
        
            response.sendRedirect(request.getContextPath()+"/home?accesono="+userinvalido+"");
        
                        }
        
        else{
            
             for(Usuario user : list) {
               idtipousuario=user.getTipousuario().getIdtipousuario();
                 
               if(idtipousuario==1){
                                         HttpSession sesion = request.getSession();  
                                           //si coincide usuario y password y además no hay sesión iniciada
                                         sesion.setAttribute("idusuario",user.getIdusuario());
                                         sesion.setAttribute("nombre",user.getNombre());
                                         sesion.setAttribute("apellido", user.getApellido());
                                         sesion.setAttribute("correo", user.getCorreo());
                                         sesion.setAttribute("usuario", user.getUsuario());
                                         sesion.setAttribute("tipousuario", user.getTipousuario().getIdtipousuario());
                                         
        ArrayList<Usuariomiembro> datos2=us.getUsuariomiembroporid(user.getIdusuario());// consulta bd 
        request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                                                  
                                                 // retrieve your list from the request, with casting 
        ArrayList<Usuariomiembro> list2 = (ArrayList<Usuariomiembro>) request.getAttribute("datos2");
        
        if (list2 !=null){ 
        
        for(Usuariomiembro use : list2) {
                                      int idmembrecia= use.getMembrecia().getIdmembrecia();
                                      sesion.setAttribute("idusuariomiembro", use.getIdusuariomiembro());
                                      sesion.setAttribute("inicio", use.getInicio());
                                      sesion.setAttribute("vencimiento", use.getVencimiento());
                                      sesion.setAttribute("ultimopago", use.getUltimoPago());
                                      sesion.setAttribute("saldodisponible", use.getSaldodisponible());
                                      
        ArrayList<Membrecia> datos3=mem.getMembrecia(idmembrecia);// consulta bd 
        request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                                                  
                                                 // retrieve your list from the request, with casting 
        ArrayList<Membrecia> list3 = (ArrayList<Membrecia>) request.getAttribute("datos3");            
                                      
                                      
                for(Membrecia memb : list3) {
                                
                    
                                    
                                     sesion.setAttribute("cuota", memb.getCuota());
                                     sesion.setAttribute("saldo", memb.getSaldo());
                                     
                                     
                                         
                
                
                
                }                      
                                      
                                      
                                      
                                      
                                      
                                      
        }
        
        
        }             
                                         
                                         
                                         String bienvenido="bienvenido";
                                         response.sendRedirect(request.getContextPath()+"/home?bienvenido="+bienvenido+"");
           
                
                     } else{
                    response.sendRedirect(request.getContextPath()+"/home?accesono="+userinvalido+"");
               }
             } // foor user
        }//ese
        
        
        
        
        
        
        
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
