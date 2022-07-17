
<%@page import="modelos.Usuario"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
<%@page import="modelos.CRUD.UsuarioCRUD"%>
<%@page import="modelos.Municipio"%>
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>');</script>
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        <script src="js/validar.js" ></script>
        <script src="js/validarcambiarpassoper.js"></script>
        
         <% if(session.getAttribute("idsucursal")!=null) {%>
         <script type="text/javascript">
         location.href ="home?errorsesion=errorsesion";
         </script> 
         <%}%>
         
        <!-- para validar sesion--> 
         <% if(session.getAttribute("idusuario")==null) {%>
         <script type="text/javascript">
         location.href ="home?errorsesion=errorsesion";
         </script> 
         <%}%>
         
        <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
          <!-- para activar sidenav derecho--> 
         <script type="text/javascript">
           
            $(document).ready(function(){
        
                  $("#barra").sideNav();
              });       
         </script>
         
        <script type="text/javascript">
             $(document).ready(function(){
        $("#enlace").trigger('click');
            
                                         });
        
        </script>
        
        <!-- aviso de pago exitoso-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('Su pago fue Realizado con Exito &nbsp;&nbsp;<a href="membrecia.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        <!-- aviso de asociacion exitoso-->  
          <%  String  exito2 = request.getParameter("exito2");  if(exito2 !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('En término de 24 horas procesaremos su contratación de servicio &nbsp;&nbsp;<a href="membrecia.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        <script type="text/javascript">
        $(document).ready(function(){
           $('.slider').slider();
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
        
        <title>Actualizar informacion</title>
    </head>
    <body>
        
         <%-- cambio de contrasena--%>
                                                        
                               <form id="cambiodepassModal" class="modal modal-fixed-footer" method="post" action="xyzcambiopasscli">
		<div class="modal-content">
			<h5 class="center-align">Login</h5>
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
    <li><a class="waves-effect" id="cerraruser" href="xyzCerrarSesion">Cerrar sesión</a></li>
    <li><div class="divider"></div></li>
    
    </ul>

                   <%--   fin sidenav para ver sesionado--%>    
                          
                   <%}%>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com</div>
			<ul class="NavBar-links col m9">
				<li><a href="home" class="waves-effect">Home</a></li>
				<li><a href="productos" class="waves-effect">Servicios</a></li>
				<li><a href="cesta.jsp" >Pedido</a></li>
                                 <% if(session.getAttribute("idusuario")!=null) {%>
                                <li>${sessionScope.usuario}:<a href="#"  data-activates="slide-out" class="waves-effect" id="barra"><i class="material-icons">person</i></a></li>
                               	<%}%>
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	               <h5 class="tittles center-align">Editar información</h5>
		<div class="container valign">
			<div class="row">
                            
                            
                              <% 
                                    int idusuario=(Integer)session.getAttribute("idusuario");
                                    String tel=null;
                                    String direccion=null;
                                    String cel=null;
                                    String nombremuni=null;
                                    String descripcioncasa=null;
                                    int idmunicipio=0;
                                    
                                  
                                    UsuarioCRUD us=new UsuarioCRUD();
                                    MunicipiosCRUD mu=new MunicipiosCRUD();
                                   
                                    ArrayList<Usuario> datos=us.getUsuarioporid(idusuario);
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                    
                                    ArrayList<Usuario> list = (ArrayList<Usuario>) request.getAttribute("datos");


                                      for(Usuario usu : list) {
                                      
                                      tel=usu.getTel();
                                      direccion=usu.getDireccion();
                                      descripcioncasa=usu.getDescripcionCasa();
                                      cel=usu.getCel();
                                      idmunicipio=usu.getMunicipio().getIdmunicipio();
                                      
                                      
                                    ArrayList<Municipio> datos2=mu.getMunicipioporid(idmunicipio);
                                    request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                    
                                    ArrayList<Municipio> list2 = (ArrayList<Municipio>) request.getAttribute("datos2");


                                      for(Municipio muni : list2) {
                                      
                                      
                                      nombremuni=muni.getNombre();
                                      
                                      
                                      
                                      } }
                                   
                                   %>
                                  
                                   
                                   
           <div class="z-depth-3">
    <div style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">  
    </br>                              
    <form action="xyzactualizarinfouser" method="post">

        
                                <div class="input-field col s12">
					<i class="zmdi zmdi-share prefix"></i>
					<input id="direccion" type="text" class="validate" name="direccion" value="<%=direccion%>" pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="direccion">Dirección</label>
				</div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-home prefix"></i>
					<input id="casa" type="text" class="validate" name="descripcion_casa" value="<%=descripcioncasa%>" pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9]{4,100}"  title="Ingresar letras y numeros sin símbolos especiales" required="">
					<label for="casa">Descripción de la Casa</label>
                                        
				</div>
                                       
                                        <%       
                             
                             
                              ArrayList<Municipio> datos4=mu.getMunicipio();/// consulta bd 
                           
                             request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta
                            
                            
                            %>
                            
                            
                           
                           
                            
        
        
        
        
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account-box prefix"></i>
                                        <input id="tel" type="text" class="validate" name="tel" value="<%=tel%>" placeholder="+50279487530" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico">
					<label for="tel">tel</label>
		                </div>
                            
                            
                                <div class="input-field col s12">
					<i class="zmdi zmdi-account-box prefix"></i>
					<input id="cel" type="text" class="validate" name="cel" value="<%=cel%>" placeholder="+50279487530" pattern="[+]{1}[0-9]{11}" title="Ingresa + seguido del codigo de área seguido del número telefónico" >
					<label for="cel">Cel</label>
		                </div>
                            
                     
                                        
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;<label><font size=4> Selecciona tu municipio Anterior:(<%=nombremuni%>)  </font></label></br>
                                <div class="row">
                                <div class="col s1">&nbsp;&nbsp;<i class=" small material-icons ">location_city</i></div> 
                                <div class="col s10">
                                <select name="idmunicipio">   
                             
                                     <c:forEach items="${datos4}" var="dato4">  
                                         
                                         <option value="<c:out value="${dato4.getIdmunicipio()}" />"><c:out value="${dato4.getNombre()}" /></option>
					
				     </c:forEach>
                                </select>
                                </div>
                                </div>
                                
                                        
                            <center>
                           <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Guardar"><i class="small material-icons">save</i> </button>
                            </center>
        
    </form>
      
                  
    </br></div></div>   
         
         
        


                                        
                           
                      
                        </div></br>
                             <%-- inicio de slader --%>    
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
                             
                             
                             
                             
                             
                             <%-- fin de slader --%>    
                    
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
        
     
       
        
        
    </body>
</html>
