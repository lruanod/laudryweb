
<%@page import="modelos.Tipousuario"%>
<%@page import="modelos.CRUD.TipousuarioCRUD"%>
<%@page import="modelos.Municipio"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
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
         <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
            
        <style type="text/css">
         
.errores{
    -webkit-boxshadow: 0 0 10px rgba(0, 0, 0, 0.3);
    -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    -o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    border-radius:10px;
    -webkit-border-radius: 10px;
    background: red;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    color: #fff;
    display: none;
    font-size: 12px;
    margin-top: -40px;
    margin-left: 250px;
    padding: 10px;
    position: absolute;
}
.errores:before{ /* Este es un truco para crear una flechita */
    content: '';
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
    border-right: 8px solid #BC1010;
    border-left: 8px solid transparent;
    left: -16px;
    position: absolute;
    top: 5px;
}


     </style>
     
        <title>agregar-operadores</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
				<li><a href="usuariosOperador.jsp" class="waves-effect">Administración de usuarios</a></li>		
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	        <h5 class="tittles center-align">crear usuario</h5>
		<div class="container valign">
			<div class="row">
                               <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;"> 
                            <form action="xyzaddusuarioOper" method="post" >
                                
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="nombre" type="text"   name="nombre" class="nombre"  autofocus=""  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ]{2,40}"  title="Ingresar letras sin símbolos especiales" required=""/>
					<label for="nombre">Nombres</label>  
                                        
                                      
				</div>
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="apellidos" type="text" name="apellido"  class="apellidos"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ]{2,40}"  title="Ingresar letras sin símbolos especiales" required="" >
					<label for="apellidos">Apellidos</label>
                                        
                                        
                
                                </div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-card prefix"></i>
					<input id="NIt" type="text" class="validate" name="nit" minlength="7" required="" pattern="[0-9]{7}"  title="Ingresa 7 digitos" >
					<label for="NIT">NIT</label>
                                        
                                </div>
                            
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-share prefix"></i>
					<input id="direccion" type="text" class="validate" name="direccion" pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="direccion">Dirección</label>
				</div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-home prefix"></i>
					<input id="casa" type="text" class="validate" name="descripcion_casa" pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="casa">Descripción de la Casa</label>
                                        
				</div>
                                        
                            
                            
                                 <div class="input-field col s12">
					<i class="zmdi zmdi-email prefix"></i>
                                        <input id="correo" type="email" class="validate" name="correo" required="" title="lruano@mail.com" >
					<label for="correo">Correo electrinico</label>
                                       
                                       
                                 </div>
                            
                            
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-face prefix"></i>
					<input id="usuario" type="text" class="validate" name="usuario" pattern="[A-Za-z,0-9]{4,10}"  title="Ingresar letras y numeros sin símbolos especiales y no mas de 10 caracteres" required="">
					<label for="usuario">Nombre Usuario</label>
                                        
                                </div>
                                        
                                  	
				<div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
                                        <input id="pass" type="password" class="validate" value="12345678"  name="pass" />
                                     
                                        <label for="pass">Contraseña por defecto 12345678</label>
                                        
                                </div>
                            
             
                                  
                                <div class="input-field col s12">
					<i class="zmdi zmdi-local-phone prefix"></i>
					<input id="tel" type="text" class="validate" name="tel" placeholder="+50279487530" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico">
					<label for="tel">tel</label>
		                </div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-screen-rotation prefix"></i>
					<input id="cel" type="text" class="validate" name="cel" placeholder="+50254027504" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico">
					<label for="cel">Cel</label>
		                </div>
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-card prefix"></i>
					<input id="DPI" type="text" class="validate" name="dpi" pattern="[0-9]{10,15}" title="Ingresa solo numeros">
					<label for="DPI">DPI</label>
		                </div>
                            
                                  
                            <% 
                            
                            MunicipiosCRUD mu =new MunicipiosCRUD();
                            ArrayList<Municipio> datos2=mu.getMunicipio();/// consulta bd 
                            request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
                            
                            %>
                            
                            
                            <div class="input-field col s12">
                                   <select name="idmunicipio">  
                              <c:forEach items="${datos2}" var="dato2">   
                           
                           <option value="<c:out value="${dato2.getIdmunicipio()}" />"><c:out value="${dato2.getNombre()}" /></option>
                          
                              </c:forEach> 
                                   </select>
                                <label><font size=3 color=black>Municipios</font></label>
                           </div> 
                           
                            
                            
                           
                           
                            
                            <div class="col s12">
					<p> Selecciona el tipo de usuario</p>
                                        
                                        <p>
                                            <input name="idtipousuario" type="radio"  value="2"   id="2"  checked=""/>
                                             <label for="2"><font size=3 color=black>OPERADOR</font></label>
				        </p>
                                        
                                        <p>
				      	     <input name="idtipousuario" type="radio"  value="4"   id="4" />
                                             <label for="4"><font size=3 color=black>MOTORISTA</font></label>
				        </p> 
                                        
                                        <p>
				      	     <input name="idtipousuario" type="radio"  value="3"   id="3" />
                                             <label for="3"><font size=3 color=black>ADMINISTRADOR</font></label>
				        </p>   
                            </div>
                            
                            
                            
                            
                            
                            <center>
                           <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Guardar"><i class="small material-icons">save</i> </button>
                            </center>
                         
                              
                        
                            </form>   
                            
                               </div>
                            
                                
                             
                    
             
                            
        </div>
	
              </div>
                   
                  
        
        
        
        
        
     
        
    </body>
</html>
