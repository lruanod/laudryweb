
<%@page import="modelos.Usuario"%>
<%@page import="modelos.CRUD.UsuarioCRUD"%>
<%@page import="modelos.Tarifa"%>
<%@page import="modelos.CRUD.TarifaCRUD"%>
<%@page import="modelos.Servicio"%>
<%@page import="modelos.CRUD.ServiciosCRUD"%>
<%@page import="modelos.Detalle"%>
<%@page import="modelos.CRUD.DetalleCRUD"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelos.Factura"%>
<%@page import="modelos.CRUD.FacturaCRUD"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelos.Membrecia"%>
<%@page import="modelos.CRUD.MembreciaCRUD"%>
<%@page import="modelos.Usuariomiembro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.CRUD.UsuariomiembroCRUD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css">
            
        <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>');</script>
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        
         <% if(session.getAttribute("idsucursal")==null) {%>
         <script type="text/javascript">
         location.href ="home?errorsesion=errorsesion";
         </script> 
         <%}%>
        
        
       
        <title>Tarifario</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Operador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazoperador.jsp" class="waves-effect">Home</a></li>
				<li><a href="pedidos.jsp" class="waves-effect">Pedidos</a></li>		
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	
		<div class="container valign">
			<div class="row">
                           
                              <%     
                                    int idcliente=0;
                                    String estado=null;
                                    int idservicio=0;
                                    int idtarifa=0;
                                    String serlavado=null;
                                    BigDecimal tarifaser=null;
                                    String nombreser=null;
                              
                                   
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                               %>
                  
                       <h5 class="tittles center-align">Tarifario</h5>
               
                     </br> <div class="z-depth-3">
                                <div style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">  
                                  </br>
                                 
                                  
                                 
                         
                                    
                            <table class="responsive-table striped">
                                
                                <thead>
                                  <tr>    
                                   <th>Nomebre del Servicio</th>
                                   <th>Tipo de servicio</th>
                                   <th>Tarifa</th>                  
                                  </tr>
                                </thead>
             
                                <tbody>
                                                                 
        <%
                 
                             
                         ArrayList<Tarifa> datos4=tari.getTarifa();/// consulta bd 
                         request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta                 
                         ArrayList<Tarifa> list4 = (ArrayList<Tarifa>) request.getAttribute("datos4");
        
                                  for(Tarifa tarif : list4) {  
                                           idservicio=tarif.getServicio().getIdservicio();
                                           serlavado=tarif.getNombreser();
                                           tarifaser=tarif.getTarifaSer();
                                      
                                           
                                               ArrayList<Servicio> datos3=ser.getServicioporid(idservicio);/// consulta bd 
                                               request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
                                               ArrayList<Servicio> list3 = (ArrayList<Servicio>) request.getAttribute("datos3");
                          
                                                        for(Servicio servi : list3) {
                                      
                                                                    nombreser=servi.getNombreSer(); %>
                                      
                                    
                            
                                  <tr>
                                    <td><%=nombreser%></td>
                                    <td><%=serlavado%></td>
                                    <td><%=tarifaser%></td> 
                                  </tr>
                               
                                                                    
                                                                    
                                  
                                  
                                    
                          
                                                                    
                                                                    
                                                                    
                                                                                   <%  }//servicio
                                           
                                           
                                                              }//tarifa %>
                             
                  
                         
         </tbody>
                                
                                
                            </table>                            
                  
                                           
                                           
                                
     </br>                          
        
   
                                      
              
                           
                         
                              
                            
                                
                             
                    
                    
       
	
              </div>
                   
                  </div>
        
        
        
        
        
     
        
    </body>
</html>
