

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
        <!-- para validar sesion--> 
         <% if(session.getAttribute("idsucursal")==null) {%>
         <script type="text/javascript">
         location.href ="home?errorsesion=errorsesion";
         </script> 
         <%}%>
        
        
        <!-- aviso de cerrda la sesion-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="AdministrarTarifario.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Administrar servicios</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
				
				
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	<h5 class="tittles center-align">Administración de servicios</h5>
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
               
                 </br> 
                 <a href="cerarTarifa.jsp" class="waves-effect waves-light btn deep-purple tooltipped" data-position="" data-tooltip="Crear tarifas">CREAR TARIFAS</a>
                 <a  href="crearservicio.jsp" class="waves-effect waves-light btn red tooltipped" data-position="" data-tooltip="Crear servicio">CREAR SERVICIOS</a>
                 <a href="gestionCategoria.jsp"  class="waves-effect waves-light btn orange tooltipped" data-position="" data-tooltip="Crear categoria"> CREAR CATEGORIAS</a>
                 <a href="editarmembrecias.jsp"  class="waves-effect waves-light btn green tooltipped" data-position="" data-tooltip="Editar membresia">EDITAR MEMBRESIAS</a>
                    <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;">
                                
                                  </br>
                                 
                                  
                                  <div class="center-align"> 
                                         <a class="waves-effect waves-light btn blue">TODOS LOS SERVICIOS</a>
                                  </div>
                         
                                    
                            <table class="responsive-table highlight" >
                                
                                <thead>
                                  <tr>    
                                   <th>Nomebre del Servicio</th>
                                   <th>Tipo de servicio</th>
                                   <th>Tarifa</th>
                                   <th>Acciones</th>
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
                                           idtarifa=tarif.getIdtarifa();
                                      
                                           
                                               ArrayList<Servicio> datos3=ser.getServicioporid(idservicio);/// consulta bd 
                                               request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
                                               ArrayList<Servicio> list3 = (ArrayList<Servicio>) request.getAttribute("datos3");
                          
                                                        for(Servicio servi : list3) {
                                      
                                                                    nombreser=servi.getNombreSer(); %>
                                      
                                    
                            
                                  <tr>
                                    <td><%=nombreser%></td>
                                    <td><%=serlavado%></td>
                                    <td><%=tarifaser%></td> 
                                    <td>
                                        <form action="editartarifa.jsp" method="post">
                                            <input type="hidden" name="idtarifa" value="<%=idtarifa%>" />
                                            <button  type="submit" class="tooltipped" data-position="right" data-tooltip="Editar"><i class="small material-icons">create</button> 
                                        </form>
                                       
                                    
                                    
                                    </td>
                                  </tr>
                               
                                                                    
                                                                    
                                  
                                  
                                    
                          
                                                                    
                                                                    
                                                                    
                                                                                   <%  }//servicio
                                           
                                           
                                                              }//tarifa %>
                             
                  
                         
         </tbody>
                                
                                
                            </table>                            
                  
                                           
                                           
                                
     </br>                          
        
   
                                      
              
                           
                         
                              
                            
                                
                             
                    
                      
                         
               
	
                       </div>
                        </div>
                </div>
                 
        
        
        
        
        
     
        
    </body>
</html>

