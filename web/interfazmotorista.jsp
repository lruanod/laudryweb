<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Municipio"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
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
        
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        <script src="js/validar.js" ></script>
        <script src="js/validarcambiarpassoper.js" ></script>
         <!-- para validar sesion--> 
         <% if(session.getAttribute("idsucursal")==null) {%>
         <script type="text/javascript">
         location.href ="home?errorsesion=errorsesion";
         </script> 
         <%}%>
        
         <script type="text/javascript">
        $(document).ready(function(){
           $('.slider').slider();
                                   });
         </script>
        
        
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
         
         
         <!-- aviso de cerrda la sesion-->  
          <%  String  cambiopass = request.getParameter("cambiopass");  if(cambiopass !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Su clave se actualizo correctamennte &nbsp;&nbsp;<a href="interfazmotorista.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
         
         
        
          <!-- aviso de bienvenida del usuario-->  
          <%  String  bienvenido = request.getParameter("bienvenido");  if(bienvenido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){          
             Materialize.toast('Bienvenido un gusto Tenerlo por acá de nuevo &nbsp;&nbsp;<a href="interfazmotorista.jsp">OK</a>',9000, 'rounded');   
            });
        
        </script>
        
        <%  } %>
         
       
       
        
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

                                                         
                              
                               <%-- cambio de contrasena--%>
                                                        
                               <form id="cambiodepassModal" class="modal modal-fixed-footer" method="post" action="xyzcambiopasscli">
		<div class="modal-content">
			<h5 class="center-align">Login</h5>
			<div class="row">
				
                            <%-- cambio de contrasena --%>
                            
                                <input  id="idusuario" name="idusuario" type="hidden" value="<%=session.getAttribute("usuario")%>">
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
					<input id="pass" type="password" class="validate"  name="pass2" onkeyup="muestra_seguridad_pass(this.value, this.form)" minlength="5" required/>
                                        &nbsp;<i>seguridad:</i> <input name="seguridad" type="text" style="border: 0px; background-color:ffffff; text-decoration:italic;" onfocus="blur()"/>
					
                                        <label for="pass2">Contraseña</label>
                                        
                                        
                                        
                                        </div>
                            
                            
     
                            <div class="input-field col s12">
					<i class="zmdi zmdi-lock prefix"></i>
					<input id="repass" type="password" class="validate"  name="repass2">
					<label for="repass2"> Escribe nuevamente la Contraseña</label>
                                        
                                         <div id="mensaje4" class="errores"> La Contraseña no concide</div>
                                        
                            </div>
                            
                        
                        
                        </div>
		</div>
		<div class="modal-footer">
                    
                    
                    <button  id="boton2" type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Send"><i class="zmdi zmdi-mail-send"></i> </button>
                    

                        <a href="#!"class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cancel"><i class="zmdi zmdi-close"></i></a>
		</div>
                           
    </form>                            
                               
                               
                                 
                
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
               <li><a href="#cambiodepassModal" class="waves-effect modal-trigger" >Cambiar contraseña</a></li>
               <li><div class="divider"></div></li>
               <li><a class="waves-effect" id="cerraruser" href="xyzCerrarSesion">Cerrar sesión</a></li>
               <li><div class="divider"></div></li>
    </ul>

                   <%--   fin sidenav para ver sesionado--%>    
                          
                   <%}%>
                                 
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Motorista</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazmotorista.jsp" class="waves-effect">Home</a></li>
                                <li><a href="reparto.jsp" class="waves-effect">Reparto</a></li>
				<li><a href="solicitudes.jsp" class="waves-effect">Recoger</a></li>
                                <li><a href="validarpedidos.jsp" class="waves-effect">Entregado</a></li>
                                <li>${sessionScope.usuario}:<a href="#"  data-activates="slide-out" class="waves-effect" id="barra"><i class="material-icons">person</i></a></li>         	
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
<!--- banner y mismion-->


	<header class="full header valign-wrapper">
		<div class="container valign">
			
                    
                         <div class="row">
				
                            
                            
                            
                            <div class="col s12  m40">
					<figure>
                                            
                                            
                                            
                                            
						<img src="assets/img/mascota.jpg"  alt="Header" class="responsive-img center-box">
                                                
                                                
                                                
                                                
                                                
					</figure>
				</div>
				<div class="col s12 m40">
                                    <center>
					<h5 class="tittles center-align">Laundryweb.com</h5>
					<p class="flow-text">
						"Lavar  tu ropa nunca ha sido tan fácil y cómodo"
                  


					</p>
                                        
                                        </center>
				</div>
                        </div>
                    
                    
                    
                    
                    
                    
		</div>
	
        
        
        
        
        </header>
      
      <!---   fin banner y mismion-->
      
      
	<section class="full new-prod">
		<h5 class="tittles center-align">Interfaz motorista</h5>
		<div class="container">
			<div class="row">
				
                            
                            <!--- slider-->
                           
 <div class="slider">
    <ul class="slides">
      <li>
          
        <img src="assets/img/lava81.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>¡Ya no te vuelvas loco!</h3>
          <h5 class="light grey-text text-lighten-3">estropeado tu ropa favorita.</h5>
        </div>
      </li>
      <li>
        <img src="assets/img/lava71.jpg"> <!-- random image -->
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
          <h3>¡Lavar nunca fue tan Fácil!</h3>
          <h5 class="light grey-text text-lighten-3">Seguridad,Facilidad y Rapidez.</h5>
        </div>
      </li>
    </ul>
  </div>
                             <!---fin de slider-->
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
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
			        <p class="center-align flow-text">Servicio Domiciliar</p>
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
                            
                           
				<div class="col s12 tittles footer-copyright">Laundryweb.com &copy; 2017</div> 
			</div>
		</div>
	</footer>
</body>

   
         
</html>