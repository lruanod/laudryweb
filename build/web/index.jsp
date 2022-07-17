<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Municipio"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html"  pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>');</script>
        
        <!-- Se agrega la biblioteca de jquery y enseguida nuestro js de funciones-->
         <script type="text/javascript" src="js/jquery-1.11.2.min.js" ></script>
         <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
          <script type="text/javascript">
        $(document).ready(function(){
           $('.slider').slider();
                                   });
         </script>
        
         
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        <script src="js/validar.js" ></script>
        <script src="js/validarcambiopass.js" ></script>
        
         <%  String  errorsesion = request.getParameter("errorsesion");  if(errorsesion  !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('El tiempo de sesión ha caducado &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
         <%  String  noeditarurl = request.getParameter("noeditarurl");  if(noeditarurl !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Por favor no intente modificar la url puede ser peligroso &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
         <%  String  editarurl = request.getParameter("editarurl");  if(editarurl !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Error el numero de servicio no corresponde a uno valido &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
         <!-- para activar sidenav derecho--> 
         <script type="text/javascript">
            $(document).ready(function(){
        
                  $("#barra").sideNav();
              });       
         </script>    
         
          <!-- para evitar que se regrese atras--> 
         <script type="text/javascript">
              history.forward();   
         </script>    
         
         <%  String  exito2 = request.getParameter("exito2");  if(exito2 !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Actualización realizada con éxito &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
         
         
         <!-- aviso de cerrda la sesion-->  
          <%  String  cambiopass = request.getParameter("cambiopass");  if(cambiopass !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Su clave se actualizo correctamennte &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
         
         <!-- aviso de cerrda la sesion-->  
          <%  String  cerrar = request.getParameter("cerrar");  if(cerrar !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('La sesión fue cerrada con éxito&nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
         
        
          <!-- aviso de bienvenida del usuario-->  
          <%  String  bienvenido = request.getParameter("bienvenido");  if(bienvenido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Bienvenido un gusto tenerlo por acá de nuevo&nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        
        </script>
        
        <%  } %>
         
          <!-- aviso de acceso denegado-->  
         
          <%  String  accesono = request.getParameter("accesono");  if(accesono !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Error el usuario no pudo acceder, vuelva a internarlo&nbsp;&nbsp;<a href="home">OK</a>',9000,'rounded');
             
            });
        
        </script>
        
        <%  } %>
        
         <!-- aviso de registro correcto-->  
        
        <%  String correovalido = request.getParameter("exito");  if(correovalido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('En breve le eviaremos un correo electrónico para confirmar su cuenta&nbsp;&nbsp;<a href="home">OK</a>',9000,'rounded');
             
            });
        
        </script>
        
        <%  } %>
        
         <!-- aviso de activacion de cuenta exitosa-->  
         
         <%  String valido = request.getParameter("valido");  if(valido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('"La activación fue exitosa", por favor le invitamos  a  iniciar  sesión &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        
        </script>
        
        <%  } %>
       
         <!-- aviso  de error de usuario ya registrado-->  
         
        <%  String repetido = request.getParameter("repetido"); if(repetido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('El nombre de "Usuario" o "Correo electrónico" ya se encuentra registrado &nbsp;&nbsp;<a href="home">OK</a>',9000,'rounded');
             
            });
        
        </script>
        
        <%  } %>
       
        
         <!-- aviso de error al enviar el correo-->  
         
        <%  String novalido = request.getParameter("novalido"); if(novalido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Puede que haya ocurrido un error al enviar la solicitud de activación verifique que su correo fue escrito de manera correcta&nbsp;&nbsp;<a href="home">OK</a>',9000,rounded');
             
            });
        
        </script>
        
        <%  } %>
      
        <style type="text/css">
            .parallax-container{
                height: 400px;
            }  
        </style>
        
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
        
        
        
</head>

<body>
    <nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com</div>
			<ul class="NavBar-links col m9">
				<li><a href="home" class="waves-effect">Home</a></li>
				<li><a href="productos" class="waves-effect">Servicios</a></li>
                                  <% if(session.getAttribute("idusuario")==null) {%>
				<li><a href="#RegModal" class="waves-effect modal-trigger">Registrarse</a></li>
                                  <%}%>
                                <% if(session.getAttribute("idusuario")!=null) {%>
				<li><a href="cesta.jsp">Pedido</a></li>
                               
                                <%}%>
                                
                                <% if(session.getAttribute("idusuario")==null) {%>
				<li><a href="#LoginModal" class="waves-effect modal-trigger">Login</a></li>
                                	<%}%>
                                <% if(session.getAttribute("idusuario")!=null) {%>
                                <li>${sessionScope.usuario}:<a href="#"  data-activates="slide-out" class="waves-effect" id="barra"><i class="material-icons">person</i></a></li>
                               	<%}%>
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>

   
                                            
                                            
                                            
                                            
						
                                                
                                                
                                                
                                                
                                                
					
      
    <form id="LoginModal" class="modal modal-fixed-footer"  method="post" action="xyzSesionCliente">
		<div class="modal-content">
			<h5 class="center-align">Login</h5>
			<div class="row">
				
                            <%-- login --%>
                            
                         
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account-circle prefix"></i>
                                        <input id="usuarioOcorreo"  type="text"  name="usuarioOcorreo" class="validate" pattern="[A-Za-z,0-9]{4,20}"  title="Ingresar usuario o correo sin símbolos especiales y no mas de 10 caracteres" required="">
					<label for="usuarioOcorreo">Correo-usuario</label>
                                        
                                        
                                       
				</div>
				<div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
                                        <input id="clave" type="password" name="clave" contclass="validate" required="">
					<label for="clave">Password</label>
				</div>
                            
                         
                        
                        </div>
		</div>
		<div class="modal-footer">
                    
                    
                    <button   type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Enviar"><i class="zmdi zmdi-mail-send"></i> </button>
                    

                        <a href="#!"class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
                           
    </form>    
                            
                            
                               <%-- fin  login --%>
                           
                               
                               
                               <%-- login operador --%>
                               
                <form id="LoginoperadorModal" class="modal modal-fixed-footer"  method="post" action="xyzSesionOperador">
		<div class="modal-content">
			<h5 class="center-align">Login operador</h5>
			<div class="row">
				
                            
                            
                         
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account-circle prefix"></i>
					<input id="usuarioOcorreo"  type="text"  name="usuarioOcorreo" class="validate" pattern="[A-Za-z,0-9]{4,20}"  title="Ingresar usuario o correo sin símbolos especiales y no mas de 10 caracteres">
					<label for="usuarioOcorreo">Correo-usuario</label>
                                        
                                        
                                       
				</div>
				<div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
                                        <input id="clave" type="password" name="clave" contclass="validate" required="" >
					<label for="clave">Password</label>
				</div>
                            
                            
				
                         
                        
                        </div>
		</div>
		<div class="modal-footer">
                    
                    
                    <button   type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Send"><i class="zmdi zmdi-mail-send"></i> </button>
                    

                        <a href="#!"class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cancel"><i class="zmdi zmdi-close"></i></a>
		</div>
                           
    </form>    
                            
                            
                               <%-- fin  login --%>
                               
                               <%-- cambio de contrasena--%>
                                                        
                               <form id="cambiodepassModal" class="modal modal-fixed-footer" method="post" action="xyzcambiopasscli">
		<div class="modal-content">
			<h5 class="center-align">Actualizar contraseña </h5>
			<div class="row">
				
                          
                            
                                <input  id="idusuario" name="idusuario" type="hidden" value="<%=session.getAttribute("usuario")%>">
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
					<input id="pass2" type="password" class="validate"  name="pass2" onkeyup="muestra_seguridad_pass(this.value, this.form)" minlength="5" required/>
                                        &nbsp;<i>seguridad:</i> <input name="seguridad" type="text" style="border: 0px; background-color:ffffff; text-decoration:italic;" onfocus="blur()">
					
                                        <label for="pass2">Contraseña</label>
                                        
                                        
                                        
                                        </div>
                            
                            
                            
                            <div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
					<input id="repass2" type="password" class="validate"  name="repass2">
					<label for="repass2"> Escribe nuevamente la Contraseña</label>
                                        
                                         <div id="mensaje4" class="errores"> La Contraseña no concide</div>
                                        
                            </div>
                            
                        
                        
                        </div>
		</div>
		<div class="modal-footer">
                    
                    
                    <button  id="boton2" type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Enviar"><i class="zmdi zmdi-mail-send"></i> </button>
                    

                        <a href="#!"class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
                           
    </form>                            
                               
                               
                               
                                 <%-- registrar --%>
	
	<form  id="RegModal" class="modal modal-fixed-footer"  method="post" action="agragaruser">
		<div  class="modal-content">
			<h5 class="center-align">Registrarse</h5>
			<div class="row">
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="nombre" type="text"   name="nombre" class="nombre" title="Ingresa este campo solo en letras"  autofocus=""/>
					<label for="nombre">Nombres</label>  
                                        
                                        <div id="mensaje1" class="errores"> Ingresa solo caracteres</div>
				</div>
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="apellidos" type="text" name="apellido" title="Ingresa este campo solo en letras"  class="apellidos" >
					<label for="apellidos">Apellidos</label>
                                        
                                        <div id="mensaje2" class="errores"> Ingresa solo caracteres</div>
                
                                </div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-card prefix"></i>
                                        <input id="nit" type="text" class="validate" name="nit"  required="" pattern="[0-9]{7}"  title="Ingresa 7 digitos">
					<label for="nit">NIT</label>
                                        
                                </div>
                            
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-share prefix"></i>
                                        <input id="direccion" type="text" class="validate" name="direccion"   pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="direccion">Dirección</label>
				</div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-home prefix"></i>
                                        <input id="casa" type="text" class="validate" name="descripcion_casa"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="casa">Descripción de la Casa</label> 
                                        
				 </div>
                                        
                            
                            
                                 <div class="input-field col s12">
					<i class="zmdi zmdi-email prefix"></i>
					<input id="correo" type="email" class="validate" name="correo" title="Ingresa este campo">
					<label for="correo">Correo electrónico</label>
                                       
                                        <div id="mensaje3" class="errores"> Correo no valido</div>
                                        
                                </div>
                            
                            
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-face prefix"></i>
                                        <input id="usuario" type="text" class="validate" name="usuario" pattern="[A-Za-z,0-9]{4,10}"  title="Ingresar letra y numeros sin símbolos especiales y no mas de 10 caracteres" required="">
					<label for="usuario">Nombre Usuario</label>
                                        
                                </div>
                                        
                                  	
				<div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
					<input id="pass" type="password" class="validate"  name="pass" onkeyup="muestra_seguridad_pass(this.value, this.form)" minlength="5" required/>
                                        <i>seguridad:</i> <input name="seguridad" type="text" style="border: 0px; background-color:ffffff; text-decoration:italic;" onfocus="blur()"/>
                                        <label for="pass">Contraseña</label>
                                            
                                </div>
                            
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
                                        <input id="repass" type="password" class="validate"  name="repass" required="">
					<label for="repass"> Escribe nuevamente la Contraseña</label>
                                        
                                        <div id="mensaje4" class="errores"> La Contraseña no concide</div>
                                        
                                </div>
                                  
                                  
                                  
                                         
                            <div class="input-field col s12">
					<i class="zmdi zmdi-local-phone prefix"></i>
                                        <input id="tel" type="tel" class="validate" name="tel" placeholder="+50279487530" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico" >
					<label for="tel">tel</label>
		            </div>
                            
                            
                            <div class="input-field col s12">
					<i class="zmdi zmdi-screen-rotation prefix"></i>
                                        <input id="cel" type="tel" class="validate" name="cel" placeholder="+50254027504" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico">
					<label for="cel">Cel</label>
		            </div>
                            
                            <div class="input-field col s12">
					<i class="zmdi zmdi-card prefix"></i>
                                        <input id="DPI" type="text" class="validate" name="dpi" placeholder="2128182281801" pattern="[0-9]{10,15}" title="Ingresa solo numeros">
					<label for="DPI">DPI</label>
		            </div>
                            
                            
                           
                            
				
				
                            
                            <% 
                            
                            MunicipiosCRUD mu =new MunicipiosCRUD();
                            ArrayList<Municipio> datos2=mu.getMunicipio();/// consulta bd 
                            
                            
                            request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
                            
                            
                            
                            %>
                            
                            
                            
                          
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;<label><font size=4> Selecciona tu municipio </font></label></br>
                                <div class="row">
                                <div class="col s1"><i class=" small material-icons">location_city</i></div> 
                                <div class="col s11">
                                <select name="idmunicipio">   
                             
                                     <c:forEach items="${datos2}" var="dato2">  
                                         
                                         <option value="<c:out value="${dato2.getIdmunicipio()}" />"><c:out value="${dato2.getNombre()}" /></option>
					
				     </c:forEach>
                               </select>
                                </div>
                                </div>
                                  
                                
                                         
		         
                            
                           
                           
                             <input name="idtipousuario" type="hidden"  value="1" />
                            
                            
			</div>
		</div>
		<div class="modal-footer">
                     
                    <p id="bot"> <button type="submit"  name="submit" class="waves-effect btn-flat tooltipped" id="boton"  data-position="top" data-tooltip="Enviar"><i class="zmdi zmdi-mail-send"></i> </button></p>
			
			<a href="#!" class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
	</form>
                                 
                <%-- fin  registraar --%>  
                 <%-- scrooll --%>  
                
                <%  if(session.getAttribute("usuario")!=null)   {%> 
                   <%--  sidenav para ver sesionado--%>    
  <ul id="slide-out" class="side-nav">
    <li style="background-color:#03a9f4;"><div class="user-view">
            
        <div class="center-align">
            
            <a href="#!user"><img class="circle" src="assets/img/sale4.jpg"></a>
           
      
            </br>
            </br>
            
            
           <p style="line-height:10px;"> <i class="small material-icons">child_care</i></p>
              
           <p style="line-height:10px;"><span class="white-text name" >${sessionScope.nombre}</span></p>
           <p style="line-height:10px;"><span class="white-text name" >${sessionScope.apellido}</span></p>
          
           
           <p style="line-height:10px;">   <i class="small material-icons">mail</i> </p>
           <p style="line-height:5px;"><span class="white-text email">${sessionScope.correo}</span></p>
            
           <P style="line-height:5px;"></br></p>
            
            
        </div>
            
    </div></li>
    
  
    <li><a href="membrecia.jsp">Membresías</a></li>
    <li><div class="divider"></div></li>
    <li><a class="waves-effect" href="estadopedido.jsp">Mis pedidos</a></li>
   
    <li><div class="divider"></div></li>
    <li><a href="#cambiodepassModal" class="waves-effect modal-trigger" >Cambiar contraseña</a></li>
    <li><div class="divider"></div></li>
    <li><a class="waves-effect" href="actualizarinfo.jsp">Actualizar dirección</a></li>
    <li><div class="divider"></div></li>
    <li><a class="waves-effect" id="cerraruser" href="xyzCerrarSesion">Cerrar sesión</a></li>
    <li><div class="divider"></div></li>
    
    </ul>

                   <%--   fin sidenav para ver sesionado--%>    
                          
                   <%}%>
                                 
	
  
   
      

   
           <%-- inicio de slader --%>    
                              <div class="slider">
    <ul class="slides fullscreen">
      <li>
          
        <img src="assets/img/lava81.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>¡Ya no te vuelvas loco!</h3>
          <h5 class="light grey-text text-lighten-3">estropeado tu ropa favorita.</h5>
        </div>
      </li>
      <li>
        <img src="assets/img/lava10.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h3>¡Cansado de hacer lo mismo!</h3>
          <h5 class="light grey-text text-lighten-3">perder tiempo y gastando dinero en Detergentes ineficaces.</h5>
        </div>
      </li>
      <li>
        <img src="assets/img/lava5.jpg"> <!-- random image -->
        <div class="caption right-align">
          <h3>Contamos con la mejor tecnología</h3>
          <h5 class="light grey-text text-lighten-3">Para brindarte un buen Servicio.</h5>
        </div>
      </li>
      <li>
        <img src="assets/img/lava3.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>¡Lavar nunca fue tan fácil!</h3>
          <h5 class="light grey-text text-lighten-3">Seguridad,Facilidad y Rapidez.</h5>
        </div>
      </li>
    </ul>
  </div>
                  
                             <%-- fin de slader --%>  
	
		<div class="container valign">
			
                    
                         <div class="row">
				
                   
				<div class="col s12 m12">
                                    <center>
					<h5 class="tittles center-align">Laundryweb.com</h5>
					<p class="flow-text">
						"Lavar  tu ropa nunca ha sido tan fácil y cómodo"
					</p>
                                        
                                    </center>
				</div>
                        </div>
                    
                    
                    
                    
                    
                    
		</div>
	
        
        
      
      <!---   fin banner y mismion-->
      
      
	<section class="full new-prod">
		<h5 class="tittles center-align">Combo de servicios</h5>
		<div class="container">
			<div class="row">
				
                            
                            <!--- cargado todos los combos-->
                           
                           
                <c:forEach items="${datos}" var="dato">
                        <div class="col s12 m6 l4">
					<div class="card hoverable">
						<figure class="card-image">
							<img src="assets/img/<c:out value="${dato.getUrl()}" />" >
							<figcaption class="card-title"><c:out value="${dato.getNombreSer()}" /></figcaption>
						</figure>
						<div class="card-content">
                                                 
							<p>
								<c:out value="${dato.getDescripcionSer()}" />
							</p>
						</div>
						<div class="card-action">
                                                    
                                                    
                                                     <form action="detalleservicio" method="post">
                                                            <input type="hidden" name="abcDFJKlaundry" value="<c:out value="${dato.getIdservicio()}" />"/>
                                                            <button  type="submit" class="btn tooltipped light-#9ccc65 lighten-2" data-position="bottom"  data-delay="50" data-tooltip="Enviar a detallar">Agregar</button>
                                                     </form>
							
						</div>
					</div>
		        </div>	     
		</c:forEach> 
				
                             <!---  fin cargado todos los combos-->
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
			</div>
		</div>
	</section>
       
	<section class="full promo">
		<div class="container">
			<div class="row">
                              <center>
				<div class="col s12">
					<h5 class="tittles center-align">POLITICA DE CALIDAD</h5>
					<p>
						

Nuestro compromiso es exceder las necesidades y expectativas de nuestros clientes, cumpliendo los requerimientos normativos y contractuales, ofreciendo soluciones integrales con talento humano en un ambiente de mejora continua.

					</p>
				</div>
                            
			    <div class="col s12 m4">
			    	<p class="center-align">
			        	
                                    <i class="large material-icons" >business</i>
                                    
			    	</p>
			        <p class="center-align flow-text">Calidad</p>
			        <p>
                                    
			        	LAUNDRYWEB fue fundada en 2017, empresa líder en brindar soluciones en lavado y secado de textiles especializados, ofreciendo un servicio integral de clase mundial a todos nuestros usuarios.


			        </p>
			    </div>
                          
			    <div class="col s12 m4">
			    	<p class="center-align">
                                
			        	<i class="large material-icons" >local_shipping</i>
                                
			    	</p>
			        <p class="center-align flow-text">Servicio domiciliar</p>
			        <p>
			        	Contamos con servicio a domicilio sin costo alguno.
			        </p>
			    </div>
                               
			    <div class="col s12 m4">
			    	<p class="center-align">
			        	
                                    <i class="large material-icons" >payment</i>
			    	</p>
			        <p class="center-align flow-text">Pago en linea</p>
			        <p>
			        	Contamos con el servicio de pago seguro en linea via paypal.
			        </p>
			    </div>
                                
                                 </center>
		    </div>
		</div>	
	</section>
          
          

      
      
      
      
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col s12 m6">
					<h5>Profesionalismo</h5>
					<p>
				 Nos esforzamos con los más altos estándares en nuestro trabajo y conducta, y continuamente aprendemos a mejorar nuestro conocimiento.
					</p>
				</div>
                            
                           
				<div class="col s12 m6">
					<h5 class="center-align">Buscanos en:</h5>
					<ul class="center-align">
						<li><a href="#!"><i class="zmdi zmdi-facebook"></i> &nbsp; Facebook</a></li>
						<li><a href="#!"><i class="zmdi zmdi-twitter"></i> &nbsp; Twitter</a></li>
						<li><a href="#!"><i class="zmdi zmdi-google-plus"></i> &nbsp; Google+</a></li>
						<li><a href="#!"><i class="zmdi zmdi-instagram"></i> &nbsp; Instagram</a></li>
					</ul>	
				</div>
                            
                            <div class="center-align">
                                <a href="#LoginoperadorModal" class="modal-trigger"><i class="small material-icons">people</i><a> 
                                                 </div>
				<div class="col s12 tittles footer-copyright">Laundryweb.com/SEMINARIO &copy; 2017</div> 
			</div>
		</div>
	</footer>
</body>

   
         
</html>