/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import classes.Articulo;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.CRUD.FacturaCRUD;
import modelos.CRUD.SucursalCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.CRUD.UsuariomiembroCRUD;
import modelos.*;
import modelos.CRUD.DetalleCRUD;
import modelos.CRUD.ServiciosCRUD;
import modelos.CRUD.TarifaCRUD;


/**
 *
 * @author user
 */
public class insertfactura extends HttpServlet {
//xyzinsertfactura
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
        Date fecha=null;
        
        try{
        ///// para fecha actual
        Date myfecha = new Date();
        SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
        String fecha1 = sm.format(myfecha);
        
        fecha=sm.parse(fecha1);
        
        } catch(ParseException e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        ///// fin fecha actual
        
        //// recoger lo del formulario
       double grantotal= Double.parseDouble(request.getParameter("grantotal"));
       int idusuario=Integer.parseInt(request.getParameter("idusuario"));
       BigDecimal total= new BigDecimal(request.getParameter("total"));
       BigDecimal totalpagar= new BigDecimal(request.getParameter("totalpagar"));                                 
       BigDecimal descuento= new BigDecimal(request.getParameter("descuento"));                                  
       int idsucursal=Integer.parseInt(request.getParameter("idsucursal"));                                 
       String entrega=request.getParameter("recoger"); 
       BigDecimal recargo= new BigDecimal("0");
       int idusuariomiembro=0;
       BigDecimal saldo = null;
       BigDecimal resta = null;
       BigDecimal descuento2 = new BigDecimal("0");
       int nofactura=0;
       int idservicio=0;
       int cantidad=0;
       double subtotal2=0;
       double precio=0;
       int idtarifa=0;
       BigDecimal subtotal=null;
       
       String estado="PENDIENTE";
       String estado2="PAGADO";
       
     /// fin recoger lo de formulario
        
      UsuariomiembroCRUD usm=new UsuariomiembroCRUD();
       FacturaCRUD fac=new FacturaCRUD();
       SucursalCRUD suc=new SucursalCRUD();
       UsuarioCRUD us=new UsuarioCRUD();
       ServiciosCRUD ser=new ServiciosCRUD();
       TarifaCRUD tar=new TarifaCRUD();
       DetalleCRUD dell=new DetalleCRUD();
       
       Sucursal sucursal=suc.getSucursalPorId(idsucursal);
       Usuario usuario=us.getUsuarioPorIdunion(idusuario);
       
       HttpSession sesion = request.getSession(true);//// recuperando la sesion 
       ArrayList<Articulo>articulos=sesion.getAttribute("cesta")==null ? null:(ArrayList) sesion.getAttribute("cesta");
       
       ArrayList<Usuariomiembro> datos=usm.getUsuariomiembroporid(idusuario);                  
       request.setAttribute("datos", datos);// pasamos los parametros de la consulta
       ArrayList<Usuariomiembro> list = (ArrayList<Usuariomiembro>) request.getAttribute("datos");
           
      
       
      
       if(list.isEmpty()){
           /// aqui
               
           /// logica para cliente ocacional
           
            fac.addFactura(new Factura(sucursal,usuario,fecha,recargo,descuento2,totalpagar,entrega,estado));
            
              if(articulos != null){   /// agregando a detalle
              for(Articulo a : articulos){/// recorriendo la lista para agregar a detalle
                       
      ArrayList<Factura> datos2=fac.getFacturaporidcli(idusuario);
      request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
      ArrayList<Factura> list2 = (ArrayList<Factura>) request.getAttribute("datos2");
      
      
      
      for(Factura  nof : list2) {      
          nofactura=nof.getNofactura();
             }
      
      Factura factura=fac.getFacturaPorIdbuscarn(nofactura);
      
      ArrayList<Tarifa> datos3=tar.getTarifaporid(a.getIdtarifa());
     
      request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta
      ArrayList<Tarifa> list3 = (ArrayList<Tarifa>) request.getAttribute("datos3");
      
      
      for(Tarifa  tari: list3) {      
          
          idservicio=tari.getServicio().getIdservicio();
          
          precio=tari.getTarifaSer().doubleValue();
          
          idtarifa=tari.getIdtarifa();
             }
      
       Servicio servicio=ser.getServicioPorIdbus(idservicio);
       
    
       cantidad =a.getCantidad();
       subtotal2=precio*cantidad;
       subtotal=new BigDecimal(subtotal2);
     
            dell.addDetalle(new Detalle(factura,servicio,cantidad,subtotal,idtarifa));
      
                  
               }  ///  fin recorriendo la lista para agregar a detalle
       } /// fin de agregar a detalle
           
           
           
           
           //  fin aqui
   
           /// para estado pendiente
        
      
        fac.updatefacturaestado(nofactura, estado2);
        
        
        /// fin de estado pendiente
        
        
        sesion.setAttribute("cesta", null);  
           
           
         response.sendRedirect(request.getContextPath()+"/cesta.jsp?exito='exito'");
        
       }   else {  
           
            // logica para cliente miembro
           
              if(grantotal<=0){
            //// para descontar  en membrecia
            
             for(Usuariomiembro use : list) { 
             
             idusuariomiembro=use.getIdusuariomiembro();
             saldo=use.getSaldodisponible();
             resta=saldo.subtract(descuento); 
             
             }
            
            usm.updateMembreciaSaldo(idusuariomiembro,resta);
             
            /// fin para descontar en mebrecia
     
              
           fac.addFactura(new Factura(sucursal,usuario,fecha,recargo,descuento,totalpagar,entrega,estado));
           
        
      
       
       if(articulos != null){   /// agregando a detalle
              for(Articulo a : articulos){/// recorriendo la lista para agregar a detalle
                       
     
      ArrayList<Factura> datos2=fac.getFacturaporidcli(idusuario);
      request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
      ArrayList<Factura> list2 = (ArrayList<Factura>) request.getAttribute("datos2");
      
      
      
      for(Factura  nof : list2) {      
          nofactura=nof.getNofactura();
             }
      
      Factura factura=fac.getFacturaPorIdbuscarn(nofactura);
      
      ArrayList<Tarifa> datos7=tar.getTarifaporid(a.getIdtarifa());
     
      request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta
      ArrayList<Tarifa> list7 = (ArrayList<Tarifa>) request.getAttribute("datos7");
      
      
      for(Tarifa  tari: list7) {      
          
          idservicio=tari.getServicio().getIdservicio();
          
          precio=tari.getTarifaSer().doubleValue();
          idtarifa=tari.getIdtarifa();
          
             }
      
       Servicio servicio=ser.getServicioPorIdbus(idservicio);
       
      
       cantidad =a.getCantidad();
       
       subtotal2=precio*cantidad;
       
       subtotal=new BigDecimal(subtotal2);
     
            dell.addDetalle(new Detalle(factura,servicio,cantidad,subtotal,idtarifa));
          
                  
               }  ///  fin recorriendo la lista para agregar a detalle
       } /// fin de agregar a detalle
       
        /// para estado pendiente
        
      
        fac.updatefacturaestado(nofactura, estado2);
        
        
        /// fin de estado pendiente
        
        
        sesion.setAttribute("cesta", null); 
        response.sendRedirect(request.getContextPath()+"/cesta.jsp?exito='exito'");
           
           }
           
           
       if(grantotal>=0){
            //// para descontar  en membrecia
            
            
             for(Usuariomiembro use : list) { 
             
             idusuariomiembro=use.getIdusuariomiembro();
             saldo=use.getSaldodisponible();
             resta=saldo.subtract(descuento); 
             
             }
            
            usm.updateMembreciaSaldo(idusuariomiembro, resta);
             
            /// fin para descontar en mebrecia
     
               
           fac.addFactura(new Factura(sucursal,usuario,fecha,recargo,descuento,totalpagar,entrega,estado));
           
             if(articulos != null){   /// agregando a detalle
              for(Articulo a : articulos){/// recorriendo la lista para agregar a detalle
                       
      ArrayList<Factura> datos2=fac.getFacturaporidcli(idusuario);
      request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
      ArrayList<Factura> list2 = (ArrayList<Factura>) request.getAttribute("datos2");
      
      
      
      for(Factura  nof : list2) {      
          nofactura=nof.getNofactura();
          
             }

      
      Factura factura=fac.getFacturaPorIdbuscarn(nofactura);
      
      ArrayList<Tarifa> datos8=tar.getTarifaporid(a.getIdtarifa());
     
      request.setAttribute("datos8", datos8);// pasamos los parametros de la consulta
      ArrayList<Tarifa> list8 = (ArrayList<Tarifa>) request.getAttribute("datos8");
      
      
      for(Tarifa  tari: list8) {      
          
          idservicio=tari.getServicio().getIdservicio();
          
          precio=tari.getTarifaSer().doubleValue();
          idtarifa=tari.getIdtarifa();
          
          
             }
      
       Servicio servicio=ser.getServicioPorIdbus(idservicio);
       
      
       cantidad =a.getCantidad();
      
       
      
      subtotal2=precio*cantidad;
      
      subtotal=new BigDecimal(subtotal2);
        
            dell.addDetalle(new Detalle(factura,servicio,cantidad,subtotal,idtarifa));
      
                  
               }  ///  fin recorriendo la lista para agregar a detalle
       } /// fin de agregar a detalle
       
           
            /// para estado pendiente
        
      
        fac.updatefacturaestado(nofactura, estado2);
        
        
        /// fin de estado pendiente
        
        
        sesion.setAttribute("cesta", null); 
        response.sendRedirect(request.getContextPath()+"/cesta.jsp?exito='exito'");
           
           
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
