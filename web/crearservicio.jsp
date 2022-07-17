
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
        
        
        
        
        <title>Crear Servicio</title>
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
	<h5 class="tittles center-align">Crear servicio</h5>
		<div class="container valign">
			<div class="row">
              
                       
                
               
                
               
                     </br> <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">
                                
                                  </br>
                                 
                                  
                                
                                        
                                
                        
                                    <form method="post" action="xyzinsertServicio">
                                       
                                        <a class="waves-effect waves-light btn blue">Nombre del servicio</a></br>
                                        <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-movie prefix"></i>
					<input id="Servicio" type="text" class="validate" name="nombreser"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="" >
					<label for="Servicio">Servicio</label>
                                        
				        </div>
                                        <a class="waves-effect waves-light btn blue">Descripción del servicio</a></br>
                                        <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-library prefix"></i>
					<input id="descripcion" type="text" class="validate" name="descripcion"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9,(),.]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="descripcion">Descripción del servicio</label>
                                        
				        </div>
                                       <a class="waves-effect waves-light btn blue">cargar imagen</a></br>
                                        <div class="file-field input-field col s12">
                                            
					
                                            <div class="btn btn-floating btn-small pulse" style='width: 47px; height: 40px'>
                                                <span><i class="zmdi zmdi-image prefix"></i></span>
                                                <input   type="file">
                                                 
                                                </div>
                                        
                                        <div class="file-path-wrapper">
                                            <input  class="file-path validate" type="text" name="url" required="">
                                           
                                        </div>
				        </div>
                                            
       
                                                                   
                           <%       
                              CategoriasCRUD ca=new CategoriasCRUD();
                               
                              ArrayList<Categorias> datos7=ca.getCategorias();
                             
                           
                              request.setAttribute("datos7", datos7);
                            %>
                          <a class="waves-effect waves-light btn blue">Asignar categoria</a></br>          
                             <div class="input-field col s12">
    
                                        <c:forEach items="${datos7}" var="dato7">   
                                        <p>
                                            <input name="idcategoria" checked="" type="radio"  value="<c:out value="${dato7.getIdcategorias()}" />"   id="<c:out value="${dato7.getIdcategorias()}" />" />
                                            <label for="<c:out value="${dato7.getIdcategorias()}" />"><font size=3 color="black"><c:out value="${dato7.getCategoria()}" /></font></label>
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

