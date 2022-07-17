
<%@page import="modelos.Categorias"%>
<%@page import="modelos.CRUD.CategoriasCRUD"%>
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
         <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
        
        
        <!-- aviso de cerrda la sesion-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="editarmembrecias.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Editar membresias</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
                                <li><a href="AdministrarTarifario.jsp" class="waves-effect">Administrar servicios</a></li>
				
				
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	<h5 class="tittles center-align">administración de membresías</h5>
		<div class="container valign">
			<div class="row">
              
                            </br>
                            
                             <a href="Crearmembrecias.jsp"  class="waves-effect waves-light btn red tooltipped" data-position="" data-tooltip="Crear membresia">Crear Membresía</a>
                            
               
                            
               
                     </br> <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;">
                                
                                              
                        </br>
                                 
                                  
                                  <div class="center-align"> 
                                         <a class="waves-effect waves-light btn blue">TODAS LAS MEMBRESIAS</a>
                                  </div>
                         
                                    
                            <table class="responsive-table highlight">
                                
                                <thead>
                                  <tr>    
                                   <th>Plan</th>
                                   <th>Cuota</th>
                                   <th>Saldo acreditado</th>
                                   <th>Acciones</th>
                                  </tr>
                                </thead>
             
                                <tbody>
                                                                 
        <%
                         String nombre=null;
                         BigDecimal cuota=null;
                         BigDecimal saldo=null;
                         int idmembrecia=0;
                         MembreciaCRUD mem=new MembreciaCRUD();    
                         ArrayList<Membrecia> datos4=mem.getMembreciatodo();/// consulta bd 
                         request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta                 
                         ArrayList<Membrecia> list4 = (ArrayList<Membrecia>) request.getAttribute("datos4");
        
                                  for(Membrecia me : list4) {  
                                          nombre=me.getNombreMem();
                                          cuota=me.getCuota();
                                          saldo=me.getSaldo();
                                          idmembrecia=me.getIdmembrecia();
                                           
                                             
                                    %>
                            
                                  <tr>
                                    <td><%=nombre%></td>
                                    <td><%=cuota%></td>
                                    <td><%=saldo%></td> 
                                    <td>
                                        <form action="editmembrecia.jsp" method="post">
                                            <input type="hidden" name="idmembrecia" value="<%=idmembrecia%>"/>
                                            <button  type="submit" class="tooltipped" data-position="right" data-tooltip="Editar"><i class="small material-icons">create</button> 
                                        </form>
                                        
                                       
                                    
                                    
                                    
                                    </td>
                                  </tr>
                               
                                                                    
                                                                    
                                  
                                  
                                    
                          
                                                                    
                                                                    
                                                                    
                                                                                   <%  }//membrecia %>
                                           
                                           
                                                            
                             
                  
                         
         </tbody>
                                
                                
                            </table>                            
                  
                                           
                                           
                                
     </br>                          
                  
                                                                    
                  
                         
                                  
                  
                                           
                                           
                                
                           
        
   
                                      
              
                           
                         
                              
                            
                                
                             
                    
                      
                         
               
	
                       </div>
                        </div>
                </div>
                 
        
        
        
        
        
     
        
    </body>
</html>

