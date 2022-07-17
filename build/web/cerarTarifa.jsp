

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
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="validarmembrecias.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Crear Tarifario</title>
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
	<h5 class="tittles center-align">crear tarifa</h5>
		<div class="container valign">
			<div class="row">
                     </br> <div class="z-depth-3"style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">                               
                                  </br>
                                
                                        
                               
                        
                                    <form method="post" action="xyzinserTarifa"> 
                                      
                                        <a class="waves-effect waves-light btn blue">Nombre del tipo de servicio</a></br>
                                        <div class="input-field col s12">
                                               
					<i class="zmdi zmdi-local-laundry-service prefix"></i>
					<input id="nombreser" type="text" class="validate" name="nombreser"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="" >
					<label for="nombreser"> Nombre del servicio </label>
				        </div>
                                          
                                        <a class="waves-effect waves-light btn blue">Tarifa del servicio</a></br>
                                        <div class="input-field col s12">
                                           
					<i class="zmdi zmdi-money prefix"></i>
                                        <input id="tarifa" type="number" class="validate" name="tarifa" required="">
					<label for="tarifa"> Tarifa </label>
				        </div>
                                                                   
                           <%       
                              ServiciosCRUD ser=new ServiciosCRUD();
                               
                              ArrayList<Servicio> datos7=ser.getServiciotodo();
                             
                           
                              request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta
                            
                            %>
                             <a class="waves-effect waves-light btn blue">Asignar tarifa a:</a></br>               
                            <div class="input-field col s12">
                              
                                        <c:forEach items="${datos7}" var="dato7">   
                                        <p>
                                            <input name="idservicio" checked="" type="radio"  value="<c:out value="${dato7.getIdservicio()}" />"   id="<c:out value="${dato7.getIdservicio()}" />" />
                                             <label for="<c:out value="${dato7.getIdservicio()}" />"><font size=3 color="black"><c:out value="${dato7.getNombreSer()}" />&nbsp;<c:out value="${dato7.getDescripcionSer()}" /></font></label>
				        </p>
                                         </c:forEach> 
                                    
                                        </br>      
                            </div>     
                                                                        
                            <center>
                                  <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Guardar"><i class="small material-icons">save</i> </button>
                            </center>                                  
                                    </form>                                                      
     </br>                          
                       </div>
                        </div>
                </div>

    </body>
</html>

