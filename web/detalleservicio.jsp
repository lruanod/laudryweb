

<%@page import="modelos.Municipio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        <script src="js/validar.js" ></script>
        <script src="js/validarcambiopass.js" ></script>
        
          <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
        
        <% if(session.getAttribute("idusuario")==null) {%>
          <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Debe de iniciar sesión para solicitar servicio &nbsp;&nbsp;<a href="home">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%}%>
         <!-- para activar sidenav derecho--> 
         <script type="text/javascript">
            $(document).ready(function(){
        
                  $("#barra").sideNav();
              });       
         </script>    
         
        
        
        <script type="text/javascript">
var contador=1; 
function incrementar() { 

                            document.contador.cantidad.value= contador++; 

                       } 


function decrementar() { if(contador>=1) {

                                           document.contador.cantidad.value= contador--; 

                                         }

                       } 

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
                
        <title>detalle de la cesta</title>
       
   
    </head>
    <body>
        
      
       
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
					<input id="apellidos" type="text" name="apellido"  title="Ingresa este campo solo en letras" class="apellidos" >
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
                                        <input id="correo" type="email" class="validate" name="correo" title="Ingresa este campo" >
					<label for="correo">Correo electrónico</label>
                                       
                                        <div id="mensaje3" class="errores"> Correo no valido</div>
                                        
                                </div>
                            
                            
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-face prefix"></i>
                                        <input id="usuario" type="text" class="validate" name="usuario" pattern="[A-Za-z,0-9]{4,10}"  title="Ingresar usuario sin símbolos especiales y no mas de 10 caracteres" required="">
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
                                        <input id="DPI" type="text" class="validate" name="dpi" placeholder="2128182281801" pattern="[0-9]{10,15}" title="Ingresa solo numeros ">
					<label for="DPI">DPI</label>
		            </div>
                            
                            
                            
                           
                            
				
				
                            
                            <% 
                            
                            MunicipiosCRUD mu =new MunicipiosCRUD();
                            ArrayList<Municipio> datos5=mu.getMunicipio();/// consulta bd 
                            
                            
                            request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta
                            
                            
                            
                            %>
                            
                            
                            
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;<label><font size=4> Selecciona tu municipio </font></label></br>
                                <div class="row">
                                <div class="col s1"><i class=" small material-icons">location_city</i></div> 
                                <div class="col s11">
                                <select name="idmunicipio">   
                             
                                     <c:forEach items="${datos5}" var="dato5">  
                                         
                                         <option value="<c:out value="${dato5.getIdmunicipio()}" />"><c:out value="${dato5.getNombre()}" /></option>
					
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
                   
                   
                   
 <%-- cambio de contrasena--%>
                                                        
                               <form id="cambiodepassModal" class="modal modal-fixed-footer" method="post" action="xyzcambiopasscli">
		<div class="modal-content">
			<h5 class="center-align">Actualizar contraseña</h5>
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
                               	
  
  <form id="LoginModal" class="modal modal-fixed-footer"  method="post" action="xyzSesionCliente">
		<div class="modal-content">
			<h5 class="center-align">Login</h5>
			<div class="row">
				
                            <%-- login --%>
                            
                         
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account-circle prefix"></i>
                                        <input id="usuarioOcorreo"  type="text"  name="usuarioOcorreo" class="validate" pattern="[A-Za-z,0-9]{2,10}"  title="Ingresar usuario o correo sin símbolos especiales y no mas de 10 caracteres" required="">
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
                                <h5 class="tittles center-align">Detalle del servicio</h5>
		<div class="container valign">
                      
			<div class="row valign-wrapper">
                            
                            <!--   m= ancho  y s= altura-->
                            
                            
                                       
                                                        
                           
                            
                            <!--      imagen con su descripcion-->
                            
				<div class="col s12 m12 l12">
                                        <h6 class="tittles center-align">servicio seleccionado</h6>
					<p class="center-align">
                                            
					<div class="card hoverable large" style="border-style:ridge; border-width: 15px; border-color: grey lighten-4">
                                            
						<figure class="card-image">
                                                    <c:forEach items="${datos}" var="dato">
							<img src="assets/img/<c:out value="${dato.getUrl()}" />" >
							<figcaption class="card-title"><c:out value="${dato.getNombreSer()}" /></figcaption>
						</figure>
						<div class="card-content">
							<p>
								<c:out value="${dato.getDescripcionSer()}" />
							</p>
						</div>
						
                                                          
                                                        
					</div>
                                            
				      	
				</div>
                                                        
                            <!--     fin imagen con su descripcion-->
                                                      
                            
                            
   
          
                             <!--     opciones de servicio y cantidad-->                            
                                <div class="col s10 m9">
                                    </br>
                                    
       <div class="z-depth-3">
          
             <div class="card hoverable" style="border-style:ridge; border-width: 15px; border-color: grey lighten-4">
           
                
       <table class=" responsive-table bordered highlight centered">
      <thead>
          <tr>
              <th bgcolor="#42a5f5"> <a class="waves-effect waves-light btn blue darken-4">Selección</a></th>
              <th bgcolor="#42a5f5"> <a class="waves-effect waves-light btn blue darken-4">Servicio</a></th>
              <th bgcolor="#42a5f5"> <a class="waves-effect waves-light btn blue darken-4">Tarifa</a></th>
           
          
      </thead>

      <tbody>
                                             
                                    <form action="agregarproducto" method="POST" name="contador">  
                                         <c:forEach items="${datos2}" var="dato2">                
                                             
         <tr>
            <td>
                <input checked="" class="with-gap" name="idtarifa"  value="<c:out value="${dato2.getIdtarifa()}"/>" type="radio" id="<c:out value="${dato2.getIdtarifa()}"/>" />
                <label for="<c:out value="${dato2.getIdtarifa()}"/>"></label>
            </td>
            <td> <a class="waves-effect waves-light btn #9ccc65"><c:out value="${dato2.getNombreser()}"/></a></td>
            <td> <a class="waves-effect waves-light btn #9ccc65">Q<c:out value="${dato2.getTarifaSer()}"/></a></td>
         </tr> 
               
                                                     
                                                    
                                                    
                                         </c:forEach>      
          </tbody>
         </table>                        
                                    
                                            <input type="hidden" value="<c:out value="${dato.getIdservicio()}" />" name="idservicio">
                                                  
                                            
					  
                                                    
                                           <div class="center-align">
                                                
                                            <div class="col s12"> <label> <a class="waves-effect waves-light btn blue darken-4">Cantidad de Servicios</a></label></div>
                                          </div>
                                            <div class="center-align">
    
                                            <div class="col s12 m10 l4 ">      <button type= "button" onClick="incrementar()" value="aumentar"class="btn-floating waves-effect waves-light blue tooltipped" data-position="bottom" data-tooltip="+"><i class="large material-icons" >exposure_plus_1</i></button> </div> 
                                                    
                                                    
                                            <div class="col s12 m10 l4  ">      <input name="cantidad" value="1" id="txt-cantidad" type="text" class="center-align" > </div>
                                                    
                                                    
                                            <div class="col s12 m10 l4 ">      <button type= "button" onClick="decrementar()" value="disminuir"class="btn-floating waves-effect waves-light blue tooltipped" data-position="bottom" data-tooltip="-"><i class="large material-icons" >exposure_neg_1</i></button> </div>
                                            
                                            </div>   
                                           
                                                  
                                                    
                                                  
                                                      
                                                
				    
                                            </br> </br> </br> </br><div class="col s12 m12"> 
                                                <%  if(session.getAttribute("usuario")!=null)   {%> 
                                                <div class="center-align">
                                                <a class="btn tooltipped light-blue lighten-2"   data-position="bottom"  data-delay="50" data-tooltip="Agregar al pedido">  <button type= "submit" class="waves-effect waves-purple btn secondary-cotent blue" >
                                                        Agregar</button></a>  
                                                </div>
                                                            <%}%>
                                                            </div>
           
                                                            
                                           
                                        </c:forEach> 
                                    </form>   
                                    
                                                          </br>
                                                      
                                                    </div>
                                                 </div>
                                           </div>
                                    
                                                                                                              
                                                    
                                                        
                                        
                           
                             
			</div>
		</div>
	
        
        
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
				<div class="col s12 tittles footer-copyright">LAUNDRYWEB.COM &copy; 2017</div>
			</div>
		</div>
	</footer>
        
     
        <script type="text/javascript">
  
        </script>
        
        
    </body>
</html>
