/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.CRUD.OperadorSucursalCRUD;
import modelos.CRUD.SucursalCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.Operadorsucursal;
import modelos.Sucursal;
import modelos.Usuario;
import org.apache.commons.codec.digest.DigestUtils;


/**
 *
 * @author user
 */
public class SesionOperador extends HttpServlet {
//xyzSesionOperador
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
        String usuarioOcorreo= request.getParameter("usuarioOcorreo"); 
        String clavesha1=request.getParameter("clave");
        String clave=DigestUtils.sha1Hex(clavesha1);
        
        int tipousuario=0;
        int idusuario=0;
        int idsucursal=0;
        
        
        
          UsuarioCRUD op=new UsuarioCRUD();
          OperadorSucursalCRUD opsu=new OperadorSucursalCRUD();
          SucursalCRUD su=new SucursalCRUD();
          
        
        ArrayList<Usuario> datos=op.getSesioncliente(usuarioOcorreo,clave);/// consulta bd 
        request.setAttribute("datos", datos);// pasamos los parametros de la consulta
        ArrayList<Usuario> list = (ArrayList<Usuario>) request.getAttribute("datos");
        
        if (list.isEmpty()){
        
            String userinvalido="invalido";
            response.sendRedirect(request.getContextPath()+"/home?accesono="+userinvalido+"");
        
                        }
        
        else{
            
                 for(Usuario user : list) {
                      idusuario=user.getIdusuario();
                      tipousuario=user.getTipousuario().getIdtipousuario();
                      if(tipousuario==1){
                                          String userinvalido="acessono";
                                      
                                         response.sendRedirect(request.getContextPath()+"/home?accesono="+userinvalido+"");
                                     }
                 
                       ArrayList<Operadorsucursal> datos2=opsu.getoOperadorsucursal(idusuario);/// consulta bd 
                       request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
                       ArrayList<Operadorsucursal> list2 = (ArrayList<Operadorsucursal>) request.getAttribute("datos2");
                 for(Operadorsucursal opsuc : list2) {
                                        
                                         idsucursal=opsuc.getSucursal().getIdsucursal();
                                         
                                     
                                         HttpSession sesion = request.getSession();  
                                           //si coincide usuario y password y además no hay sesión iniciada
                                         sesion.setAttribute("idusuario",user.getIdusuario());
                                         sesion.setAttribute("nombre",user.getNombre());
                                         sesion.setAttribute("apellido", user.getApellido());
                                         sesion.setAttribute("correo", user.getCorreo());
                                         sesion.setAttribute("usuario", user.getUsuario());
                                         sesion.setAttribute("tipousuario", user.getTipousuario().getIdtipousuario());
                                         sesion.setAttribute("idsucursal", opsuc.getSucursal().getIdsucursal());
                                     
                       ArrayList<Sucursal> datos3=su.getSucursalIdsucursal(idsucursal);/// consulta bd 
                       request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta
                       ArrayList<Sucursal> list3 = (ArrayList<Sucursal>) request.getAttribute("datos3");
                 for(Sucursal sucu : list3) {                 
                                         sesion.setAttribute("nit", sucu.getNit());   
                                         sesion.setAttribute("nombresucursal", sucu.getNombreSucursal());  
                                         sesion.setAttribute("direccionsucursal", sucu.getDireccion()); 
                                                                 }  //sucursal                                         
                                                         }/////operadorsucursal  
                                           }// usuario          
                                   
                 
                 
                 
                                    if(tipousuario==2){//operador
                                         
                                         String bienvenido="bienvenido";
                                         response.sendRedirect(request.getContextPath()+"/interfazoperador.jsp?bienvenido="+bienvenido+"");
           
                                       }
                                     
                                    if(tipousuario==3){//administrador
                                         
                                         String bienvenido="bienvenido";
                                         response.sendRedirect(request.getContextPath()+"/interfazadmin.jsp?bienvenido="+bienvenido+"");
           
                                       }
                                    
                                    if(tipousuario==4){///motorista
                                         
                                         String bienvenido="bienvenido";
                                         response.sendRedirect(request.getContextPath()+"/interfazmotorista.jsp?bienvenido="+bienvenido+"");
           
                                       }
                                         
                                         
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
