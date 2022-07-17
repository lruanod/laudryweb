
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
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="reporte.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Reporte</title>
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
	
        <h5 class="tittles center-align">Generar reportes</h5>
		<div class="container valign">
			<div class="row">
                            </br>
            <div class="z-depth-3">
                     <div style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">  
                 </br>
             
                 <form action="xyzImprimirReporte" method="post">
                                  
                                   <a class="waves-effect waves-light btn blue">Fecha Inicio:</a>
                                   
                                <div class="input-field col s12">
					<i class="zmdi zmdi-developer-board prefix"></i>
                                        <input id="inicio" type="date" class="validate" name="inicio" required="">
					
                                </div> </br>
                
                                    <a class="waves-effect waves-light btn blue">Fecha Final:</a>
                                   
                                <div class="input-field col s12">
					<i class="zmdi zmdi-developer-board prefix"></i>
                                        <input id="fin" type="date" class="validate" name="fin" required="">
					
		                </div></br>
                                <a class="waves-effect waves-light btn blue">Selecionar tipo de estado</a>    
                                <div class="input-field col s12">
					<p>
				      	     <input name="estado" type="radio"  value="GENERAL"   id="GENERAL" checked="" />
                                             <label for="GENERAL"><font size=3 color=black>GENERAL</font></label> 
                                        </p>    
                                        <P>    
                                             <input name="estado" type="radio"  value="ENTREGADO"   id="ENTREGADO" />
                                             <label for="ENTREGADO"><font size=3 color=black>ENTREGADO</font></label>
				        </p>
                                        <P>    
                                             <input name="estado" type="radio"  value="PROCESANDO"   id="PROCESANDO" />
                                             <label for="PROCESANDO"><font size=3 color=black>PROCESANDO</font></label>
				        </p>
				        
                                         <P>    
                                             <input name="estado" type="radio"  value="ENVIADO A RECOGER"   id="ENVIADO A RECOGER" />
                                             <label for="ENVIADO A RECOGER"><font size=3 color=black>ENVIADO A RECOGER</font></label>
				        </p>
                                        
                                         <P>    
                                             <input name="estado" type="radio"  value="ENVIADO A ENTREGAR"   id="ENVIADO A ENTREGAR" />
                                             <label for="ENVIADO A ENTREGAR"><font size=3 color=black>ENVIADO A ENTREGAR</font></label>
				        </p>
                                    
                                        <P>    
                                             <input name="estado" type="radio"  value="PAGADO"   id="PAGADO" />
                                             <label for="PAGADO"><font size=3 color=black>PAGADO</font></label>
				        </p>
                                    
                              </div>
                                    
                     
                     
                             <center>
                                   <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Imprimir"><i class="small material-icons">local_printshop</i> </button>
                             </center>
                         
                 </form>
   
   
                 </br>
              </div>
           </div> 
                            
                            
                            
                            
                            
                            
                                   
         
                          
                </div>
	
                       </div>
                   
                 
        
        
        
        
        
     
        
    </body>
</html>

