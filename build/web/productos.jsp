<%@page import="modelos.Servicio"%>
<%@page import="modelos.CRUD.ServiciosCRUD"%>
<%@page import="modelos.Categorias"%>
<%@page import="modelos.CRUD.CategoriasCRUD"%>
<%@page import="modelos.Municipio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Products</title>
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
        
         <!-- para activar sidenav derecho--> 
         <script type="text/javascript">
            $(document).ready(function(){
        
                  $("#barra").sideNav();
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
        
</head>
<body>
    
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
    
                                 <%-- registrar --%>
	
	<form  id="RegModal" class="modal modal-fixed-footer"  method="post" action="agragaruser">
		<div  class="modal-content">
			<h5 class="center-align">Registrarse</h5>
			<div class="row">
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="nombre" type="text"   name="nombre" class="nombre"  title="Ingresa este campo solo en letras" autofocus=""/>
					<label for="nombre">Nombres</label>  
                                        
                                        <div id="mensaje1" class="errores"> Ingresa solo caracteres</div>
				</div>
                            
				<div class="input-field col s12">
					<i class="zmdi zmdi-account prefix"></i>
					<input id="apellidos" type="text" name="apellido"  class="apellidos" title="Ingresa este campo solo en letras" >
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
	<div class="full ShoppingCart valign-wrapper">
		<div class="container valign">
			<div class="row valign-wrapper">
				<div class="col s12 m6 valign">
					<p class="center-align" style="color: #2F9FF3;">
						<i class="zmdi zmdi-shopping-cart zmdi-hc-5x"></i>		
					</p>
					<p class="center-align">
						<a class="btn-floating waves-effect waves-light red tooltipped" data-position="bottom" data-tooltip="Empty cart" style="margin-right: 17px;"><i class="zmdi zmdi-delete"></i></a>
						<a class="btn-floating waves-effect waves-light green tooltipped" data-position="bottom" data-tooltip="Confirm purchase"><i class="zmdi zmdi-money"></i></a>
					</p>
				</div>
				<div class="col s12 m6 valign">
					<table class="centered highlight responsive-table">
				        <thead>
				          	<tr>
								<th>Servicio</th>
								<th>Precio</th>
				          	</tr>
				        </thead>
				        <tbody>
                                            
                                            
                                            
                                            
                                            
					        <tr>
                                                    <td>nombre</td>
					            <td>Qprecio</td>
					        </tr>
					        <tr>
					            <td>Product #2</td>
					            <td>$7</td>
					        </tr>
					        <tr>
					            <td>Product #3</td>
					            <td>$7</td>
					        </tr>
				        	<tr>
				        		<td>Total</td>
				        		<td>$21</td>
				        	</tr>
                                                
                                                
                                                
				        </tbody>
      				</table>	
				</div>
			</div>
		</div>
	</div>
	<section>
                  

                      
		<div class="container">
			<div class="row">
				<h4 class="center-align tittles">Servicios Disponibles</h4>
                 <div class="col s12 ">                
            <div class="z-depth-3">
    <div style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">  
    </br>
            
<table class=" responsive-table bordered highlight centered">
      <thead>
          <tr>
              <th bgcolor="#42a5f5" > <a class="waves-effect waves-light btn blue darken-4">Categoria</a></th>
              <th bgcolor="#42a5f5" > <a class="waves-effect waves-light btn blue darken-4">Busqueda</a></th>
           
          </tr>
      </thead>

      <tbody>
          
          <%  
             CategoriasCRUD cate=new CategoriasCRUD();
             ArrayList<Categorias> datos3= cate.getCategorias();
             
             request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
             ArrayList<Categorias> list = (ArrayList<Categorias>) request.getAttribute("datos3");

                                              for(Categorias cat : list) {
                                             
                                              String nombre=cat.getCategoria();
                                              int idcategoria=cat.getIdcategorias();
          %>
          
         <tr>
            <td> <a class="waves-effect waves-light btn #9ccc65"><%=nombre%></></td>
            
             <td>
                    <form action="productos" method="post">
                 
                            <input name="abcDFJKlrresasdasdasd12aundry" value="<%=idcategoria%>" type="hidden"/>
                
                             <button  type="submit" class="tooltipped" data-position="right" data-tooltip="Buscar"><i class="small material-icons">youtube_searched_for</button>
                    </form>
             </td>
          </tr>
                                                
         <% }  %>
          
      </tbody>
</table>
            
            
    </br>
   </div>
 </div>
                 </div>
         </br>
         
         
         
         <%    if(request.getParameter("abcDFJKlrresasdasdasd12aundry")!=null){
             
           
             int idcategoria=Integer.parseInt(request.getParameter("abcDFJKlrresasdasdasd12aundry"));
             
              // if(isNumeric(idcategoria)){
                  
                  //response.sendRedirect(request.getContextPath()+"/home?editarurl='editarurl'");
                 
              // }
         
         
             ServiciosCRUD ser=new ServiciosCRUD();
         
             ArrayList<Servicio> datos4= ser.getServicioidcategoria(idcategoria);
             request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta                 
             ArrayList<Servicio> list4 = (ArrayList<Servicio>) request.getAttribute("datos4");

                                              for(Servicio serv : list4) {
                                             
                                            String url= serv.getUrl();
                                            String nombreser=serv.getNombreSer();
                                            int idservicio=serv.getIdservicio();
                                            String descripcion=serv.getDescripcionSer();  %>
                                            
                                            
                                      <div class="col s12 m6 l4">
                                          </br> </br>
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<img class="activator" src="assets/img/<%=url%>">
						</div>
						<div class="card-content">
							<span class="card-title activator grey-text text-darken-4"><%=nombreser%><i class="zmdi zmdi-more-vert right"></i></span>
                                                        <!--- <span class="card-title activator grey-text text-darken-1">Precio:Q." /></span>-->
							<p>
                                                           <!---  <a class="btn tooltipped light-#9ccc65 lighten-2" data-position="bottom"  data-delay="50" data-tooltip="Enviar a detallar" href="detalleservicio?abcDFJKlaundry=<%=idservicio%>">Agregar</a>-->
                                                        <form action="detalleservicio" method="post">
                                                            <input type="hidden" name="abcDFJKlaundry" value="<%=idservicio%>"/>
                                                            <button  type="submit" class="btn tooltipped light-#9ccc65 lighten-2" data-position="bottom"  data-delay="50" data-tooltip="Enviar a detallar">Agregar</button>
                                                        </form>
                                                        
                                                        </p>
						</div>
						<div class="card-reveal">
                                                    <div class="center-align"><span class="card-title grey-text text-darken-4"><%=nombreser%><i class="zmdi zmdi-close right"></i></span></div>
                                                        <div class="center-align"><%=descripcion%></p></div>
						</div>
					</div>
				    </div>       
                                            
                                            
                                       
                                             <% }
          


         %>
                                
                               
	 <%} else{%>

  <!--- cargado todos los servicios-->
                            <c:forEach items="${datos}" var="dato">
                                 
                                 <div class="col s12 m6 l4">
                                     </br>
                                     </br>
					<div class="card">
                                           
						<div class="card-image waves-effect waves-block waves-light">
							<img class="activator" src="assets/img/<c:out value="${dato.getUrl()}" />">
						</div>
						<div class="card-content">
							<span class="card-title activator grey-text text-darken-4"><c:out value="${dato.getNombreSer()}" /><i class="zmdi zmdi-more-vert right"></i></span>
                                                        <!--- <span class="card-title activator grey-text text-darken-1">Precio:Q." /></span>-->
                                                        <p>
                                                            <form action="detalleservicio" method="post">
                                                            <input type="hidden" name="abcDFJKlaundry" value="<c:out value="${dato.getIdservicio()}" />"/>
                                                            <button  type="submit" class="btn tooltipped light-#9ccc65 lighten-2" data-position="bottom"  data-delay="50" data-tooltip="Enviar a detallar">Agregar</button>
                                                            </form>
                                                        </p>
						</div>
						<div class="card-reveal">
                                                    <div class="center-align"><span class="card-title grey-text text-darken-3"><c:out value="${dato.getNombreSer()}" /><i class="zmdi zmdi-close right"></i></span></div>
                                                    <div class="center-align"><c:out value="${dato.getDescripcionSer()}" /></div>
						</div>
					</div>
				</div>
                                      
                            </c:forEach> 
                                 <!--- fin cargado todos los servicios-->



        <%}%>			 
				
				
				
				
				
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
				<div class="col s12 tittles footer-copyright">LAUNDRYWEB.COM &copy; 2017</div>
			</div>
		</div>
	</footer>
</body>
</html>