<%-- 
    Document   : detalleservicio
    Created on : 7/09/2017, 05:30:15 PM
    Author     : user
--%>
<%@page import="modelos.CRUD.UsuariomiembroCRUD"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelos.CRUD.UsuarioCRUD"%>
<%@page import="modelos.CRUD.DepartamentosCRUD"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.*"%>
<%@page import="modelos.CRUD.SucursalCRUD"%>
<%@page import="modelos.Tarifa"%>
<%@page import="modelos.CRUD.TarifaCRUD"%>
<%@page import="modelos.Servicio"%>
<%@page import="java.util.Map"%>
<%@page import="modelos.CRUD.ServiciosCRUD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="classes.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%  HttpSession sesion = request.getSession(true);//// recuperando la sesion 

 double saldodisponible=0;
 double grantotal=0;
 double grantotalpositivo=0;
 double descuentos=0;
 double totalpagar=0;
 int idus=0;
 int idus2=0;
 String nombre2;
 String direccion2;
 
 
 
 
 int numero=0;
 int numero2=0;
 
 
 int aleatorios=(int)(Math.random()*500)+1;
     
        
        ArrayList<Articulo>articulos=sesion.getAttribute("cesta")==null ? null:(ArrayList) sesion.getAttribute("cesta");
       // si la varible sesion  ya tiene una variable llamada cesta en caso de que no  se crea un nuevo array list si ya exite se recupera   %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>');</script>
	<script src="js/materialize.min.js" ></script>
	<script src="js/main.js" ></script>
        <script src="js/validar.js" ></script>
        <script src="js/validarcambiopass.js" ></script>
        
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
       
       
       <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
        
         <!-- aviso de cerrda la sesion-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('Su pedido fue Realizado con Exito',4000, 'rounded');
             
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
        
        
        
        <title>Pedido</title>
    </head>
    
     
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
    <li><a class="waves-effect" href="actualizarinfo.jsp">Actualizar dirección</a></li>
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
				 <% if(session.getAttribute("idusuario")!=null) {%>
                                <li>${sessionScope.usuario}:<a href="#"  data-activates="slide-out" class="waves-effect" id="barra"><i class="material-icons">person</i></a></li>
                               	<%}%>
                               
					
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	
                   <h5 class="tittles center-align">Realizando Pedido</h5>
                    
		<div class="container">
			<div class="row">
				<div class="col s12  m40">
                                    <div class="card hoverable">
					<figure>
                                            
                                            
                                            
                                            
						<img src="assets/img/mascotamejorada2.jpg"  alt="Header" class="responsive-img center-box">
                                                
                                                
                                                
                                                
                                                
					</figure>
                                    </div>
				</div>
					
                                            
                                            
	                        <%if(session.getAttribute("idusuario")!=null) {    
                                
                                int idusuariooo=(Integer)session.getAttribute("idusuario");

 
 if(request.getParameter("numero")!=null){
 
   numero=Integer.parseInt(request.getParameter("numero"));
   numero2=1;
    }
                                
                                %>
			
                                          <h5 class="tittles center-align">Detalle del pedido</h5>
                                        <div class="card hoverable" style="border-style:ridge; border-width: 15px; border-color: grey lighten-4">   
				<div class="col s11 m12" id="cesta-container">
					<table class="centered highlight responsive-table" id="shop-table" >
				        <thead>
				          	<tr>
								<th>Prenda</th>
                                                                <th>Unidades</th>
                                                                <th>Tipo de Servicio</th>
								<th>Precio</th>
                                                                <th>Total</th>
                                                                <th>Eliminar</th>
				          	</tr>
				        </thead>
				        <tbody>
                                            
                                            
                                            
                                         
                                       
                                            
                                            <%
                                                
                                                
                                                 ServiciosCRUD op=new ServiciosCRUD();
                                                 TarifaCRUD to=new TarifaCRUD();
                                                 
                                                
                                               //Controladorservicio cs= new Controladorservicio();
                                               double total =0;
                                               
                                             
                                               
                                             
                                               if(articulos != null){
                                                   
                                                 for(Articulo a: articulos){/// recorreindo todos los articulos en el carro
                                                 
                                                     ArrayList<Tarifa> datos=to.getTarifaporid(a.getIdtarifa());/// consulta bd 
                                                     request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
                                                 
                                                 // retrieve your list from the request, with casting 
ArrayList<Tarifa> list = (ArrayList<Tarifa>) request.getAttribute("datos");

// print the information about every category of the list
for(Tarifa tar : list) {
  
                             
  
                            double tarifa = tar.getTarifaSer().doubleValue(); // para el calculo de la tarifa
                            int id2=tar.getIdtarifa();

                            int id= tar.getServicio().getIdservicio();
                            
                            String tiposer =tar.getNombreser();
                             
                             total +=a.getCantidad()*tarifa;// para calculo del todal
                             
                             
                             ArrayList<Servicio> datos2=op.getServicioporid(id);/// consulta bd 
                                                     
                             request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta

                             ArrayList<Servicio> list2 = (ArrayList<Servicio>) request.getAttribute("datos2");

// print the information about every category of the list
for(Servicio ser : list2) {
    
    
       String  nombre = ser.getNombreSer();
       int  idservicio = ser.getIdservicio();
       
                         
                                               
                                                   
                                                 
                                                     
                                            %>
                                            
                                            
                                            
                                            
                                      
                                           
                                                  
                                         
                                            
					    <tr>
                                        <input type="hidden" value="<%=tar.getIdtarifa()%>" name="idtarifa">
                                        
                                        <td><%=nombre%></td>
                                                    <td><input type="text" value="<%= a.getCantidad()%>" id="txt-cantidad"  class="center-align"  name="cantidad"/></td>
                                                    <td><%=tiposer%></td>
                                                    <td>Q.<%=tarifa%>   </td>
                                                    <td>Q.<%=Math.round(tarifa*a.getCantidad()*100.00) /100.00 %>     </td>
                                                        <%-- <%=Math.round(servicio.getTarifa_ser()*a.getCantidad()*100.0) /100.0 %>--%> 
                                                 
                                                  
                                                     <%--  mandar el idservicio al javascript --%> 
                                                
                                                
                                                    <td> 
                                                       <span id="idarticulo" style="display:none;"><%=tar.getIdtarifa()%></span>
                                                        <a class="btn-floating waves-effect waves-light red tooltipped" id="deleteitem"  data-position="bottom" data-tooltip="Eliminar" >
                                                            <i class="zmdi zmdi-delete"></i></a>
                                                    </td>
					         
                                            </tr>
                                     
					        
                                       <%  } } } }%>
                                       
                                     
                                                
				        </tbody>
      				</table>	
                                       
                                </div>
                                     <%   if(articulos == null){%>
                                       
                                       
                                                
                                     <h5>"No hay servicios en el Pedido"</h5></br>

                                                    
                                                 
                                                 
                                            <%  }%>
                                       
                                       
                                       
                                       
                                        <a href="productos">Seguir comprando</a>
                                        <i class="material-icons">shop_two</i>
                                       
                                       
				</div>
			
                                </div>
	 
                                       
                                    
                                       
                                             <!--     fin de detalle del pedido-->
                                            
               
                                 
                                            
                                            
                                   <%  if(session.getAttribute("idusuariomiembro")!=null)   {
                                    
                                       
                                        
                                     
                                      // BigDecimal saldodisponible=(BigDecimal)session.getAttribute("saldodisponible");
                                      
                                    
                                       


  UsuariomiembroCRUD us=new UsuariomiembroCRUD();
  ArrayList<Usuariomiembro> datos2=us.getUsuariomiembroporid(idusuariooo);// consulta bd 
        request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                                                  
                                                 // retrieve your list from the request, with casting 
        ArrayList<Usuariomiembro> list2 = (ArrayList<Usuariomiembro>) request.getAttribute("datos2");
        
         
        
        for(Usuariomiembro use : list2) { 
            
            saldodisponible=use.getSaldodisponible().doubleValue();
            
            grantotal=saldodisponible-total;
            
            grantotalpositivo=Math.abs(grantotal);
            
           
            
            
             if(grantotal>=0){ totalpagar=0; descuentos=total; } 
             else { totalpagar=grantotalpositivo;  descuentos=total+grantotal; }
            
        }
       
     
                
             



                                   
                                   %>            
                                            
                                       
               <%--          tabla  de totales   con miembrecia--%>                        
                <div class=" col s12 m12">
					<table class="centered highlight responsive-table">
				        <thead>
				          	<tr>
								<th>DETALLE</th>
                                                              
                                                                <th>SUBTOTALES</th>
								
                                                                
				          	</tr>
				        </thead>
				        <tbody>
                                            
				        <tr>
              
                                            <td> 
                                                
                                                    <p> <span class="waves-effect waves-light btn">SUB TOTAL</span></p>
                                                    <p> <span class="waves-effect waves-light btn">SALDO DE DISPONIBLE</span></P>
                                                    <p> <span class="waves-effect waves-light btn">DESCUENTOS</span></p>
                                                    <p> <span class="waves-effect waves-light btn">SALDO RESIDUAL</span></p>
                                                    <p> <span class="waves-effect waves-light btn">PAGAR----></span></p>
                                                
                                            
                                            </td>
                                                       
                                            
                                            
                                            
                                                  

                                                  
                                                
                                        
                                                   <td>

                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text " id="txt-subtotal" >Q. <%=Math.round(total*100.0)/100.0%></span></p>
                                                                           
                                                            
                                                             
                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text">Q.<%=saldodisponible%></span></P>

                                                       <% if (grantotal<1){
                                                                  %>
                                                                 
                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text">Q.<%=descuentos%></span></p>
                                                         
                                                     <% } else {%>
                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text">Q.<%=total%></span></p>
                                                     
                                                     <%}%>
                                                      
                                                      
                                                      
                                                      <p><span  class="waves-effect waves-light btn grey lighten-5 black-text" id="txt-total">Q.<%=grantotal%></span></p>
                                                         
                                                   
                                                      <p> <a href="#sucursal" class="waves-effect  tooltipped waves-light btn modal-trigger " data-position="bottom"  data-delay="50" data-tooltip="Pagar la orden">pagar</a></p>
                                                   
                                                  <td>
                                      
                                                   </tr>
					                                                  
				        </tbody>


				        </table>


	         </div>                         
                                       
                               
             
                                       
                                                        
               <%--       fin   tabla  de totales  con membrecia --%>   
               
               
               <%}    else {       totalpagar=total;%>    
               
                <%--          tabla  de totales   sin miembrecia--%>                        
                <div class=" col s12 m12">
					<table class="centered highlight responsive-table">
				        <thead>
				          	<tr>
								<th>DETALLE</th>
                                                              
                                                                <th>SUBTOTALES</th>
								
                                                                
				          	</tr>
				        </thead>
				        <tbody>
                                            
				        <tr>
              
                                            <td> 
                                                
                                                    <p> <span class="waves-effect waves-light btn">SUB TOTAL</span></p>
                                                    <p> <span class="waves-effect waves-light btn">DESCUENTOS (no aplica)</span></p>
                                                    <p> <span class="waves-effect waves-light btn">TOTAL</span></p>
                                                    <p> <span class="waves-effect waves-light btn">PAGAR----></span></p>
                                                
                                            
                                            </td>
                                                       
                                            
                                            
                                            
                                                    
                                                  
                                                
                                        
                                                   <td>

                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text " id="txt-subtotal" >Q. <%=Math.round(total*100.0)/100.0%></span></p>

                                                      <p><span class="waves-effect waves-light btn grey lighten-5 black-text">Q.0</span></p>

                                                      <p><span  class="waves-effect waves-light btn grey lighten-5 black-text" id="txt-total">Q.<%=Math.round(total*100.0)/100.0%></span></p>
                                                            
                                                   
                                                      <p> <a href="#sucursal" class="waves-effect waves-light btn modal-trigger">pagar</a></p>
                                                   
                                                  <td>
                                      
                                                   </tr>
					                                                  
				        </tbody>


				        </table>
                </div>                         
                                       
                               
              
                                       
                                                        
               <%--       fin   tabla  de totales  sin membrecia --%>   
               
               
               
               <%}%>
               
               </div>
               
            <%-- modal para eviar pago a paypa --%>
   <%-- logica para el pago de cliente miembro con exceso--%>         
 <%if(grantotal<0&&session.getAttribute("idusuariomiembro")!=null){%>
                            
   <form id="sucursal" class="modal modal-fixed-footer"  action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"   >
		<div class="modal-content">
			<h5 class="center-align">Pagos y solicitud de pedido</h5>
			<div class="row">
                               <div class="col s12">
                                   
                                   <%-- sesionando = null aleatorio --%>
                                   
                    <% 
                      if(session.getAttribute("sesionAlea")==null){  
                          
                                             session.setAttribute("sesionAlea", aleatorios); 
                                                                  }
                     %>                                  
                                   
 
 <% if(saldodisponible<=total&&session.getAttribute("idusuariomiembro")!=null) {%>

  <p class="center-align red-text"><font SIZE=5 >"El saldo disponible de tu membrecía es insuficiente" saldo a deber:&nbsp;Q.<%=grantotalpositivo%></font></p>
  <p class="center-align"><font SIZE=5 >¿Deseas pagar el resto con Paypal?</font></p>
                                       
  
  <%}%>
  
      <center>
                           
                                  	<a>
                                          <%double cambio=totalpagar/7; %>          
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="luislocoxcristo-facilitator@gmail.com">
            <input type="hidden" name="item_name" value="Premium Subscription">
            <input type="hidden" name="currency_code" value="USD">
            <input type="hidden" name="amount" value="<%=cambio%>">
            <input type="hidden" name="no_shipping" value="1">
            <input type="hidden" name="return" value="http://localhost:8080/Laudry-hibernate_2/cesta.jsp?numero=<%=session.getAttribute("sesionAlea")%>">
            <input type="hidden" name="cancel_return" value="http://localhost:8080/Laudry-hibernate_2/laundryweb_com.jsp?errorpago=errorpago">
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
            <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">

       

                                       </a>     
      </center>         
		           </div>
                            
                            
                            
                            
			</div>
		</div>
		<div class="modal-footer">
			<button   type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Enviar"><i class="zmdi zmdi-mail-send"></i> </button>
			<a href="#!" class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
</form>
   <%}%> 
    <%-- fin logica para el pago de cliente miembro con exceso--%>
    
    <%-- logica para el pago de cliente miembro sin exceso--%>
   <%if(grantotal>=0&&session.getAttribute("idusuariomiembro")!=null&&total>0){%>  
  
   
   
   
   
    <form id="sucursal" class="modal modal-fixed-footer"  action="xyzinsertfactura" method="post"   >
		<div class="modal-content">
			<h5 class="center-align">Pagos y solicitud de pedido</h5>
			<div class="row">
                               <div class="col s12">
                                   <div class="center-align"><font SIZE=4>"Actualmente cuentas con Disponibilidad, te invitamos a rellenar y luego enviar"</font> </div>
                                   
                                   
                                   
                               
                                   
                        
 
  
                                   <p><font SIZE=4>¿A donde quieres que te enviemos el pedido?</font></p>
                                        <p>
				      	     <input name="recoger" type="radio"  value="CASA"   id="recoger1" />
                                             <label for="recoger1"><font SIZE=4 color="blue">A su dirección</font></label>
				        
                                             &nbsp;&nbsp;&nbsp;&nbsp;
                                        
				      	     <input name="recoger" type="radio"  value="SUCURSAL"   id="recoger2"  />
                                             <label for="recoger2"><font SIZE=4 color="blue">Recoger en sucursal</font></label>
                                        </p> </br>
                                      
                                        <input name="idusuario" type="hidden" value="<%=idusuariooo%>"/>
                                        <input name="total" type="hidden" value="<%=total%>"/>
                                        <input name="totalpagar" type="hidden" value="<%=totalpagar%>"/>
                                        <input name="descuento" type="hidden" value="<%=descuentos%>"/>
                                        <input name="grantotal" type="hidden" value="<%=grantotal%>"/>
                                        

  
  
                                        <p class="center-align"><font SIZE=4>Selecciona la sucursal que desees enviar tu pedido</font></p>
                                   
                                        <p><font SIZE=4>Sucursales por donde vives</font></p>
	
<% 
                            
SucursalCRUD su =new SucursalCRUD();
MunicipiosCRUD mu =new MunicipiosCRUD();
DepartamentosCRUD dep =new DepartamentosCRUD();
UsuarioCRUD user=new UsuarioCRUD();

int idusuario =(Integer)session.getAttribute("idusuario");

ArrayList<Usuario> datos3=user.getUsuarioporid(idusuario);
                            
                            
request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta
                            
                          

ArrayList<Usuario> list3 = (ArrayList<Usuario>) request.getAttribute("datos3");

// print the information about every category of the list
for(Usuario us : list3) {
         
   
   
    int idmunicipious=us.getMunicipio().getIdmunicipio();
    String nombreus="";
    String direccionus ="";
    String nommunicipious="";
    int iddepartamentous=0;
    String nomdepartamentous="";
        
    
    ArrayList<Municipio> datos44= mu.getMunicipioporid(idmunicipious);
    request.setAttribute("datos44", datos44);// pasamos los parametros de la consulta
                                                     
  ArrayList<Municipio> list44 = (ArrayList<Municipio>) request.getAttribute("datos44");
// print the information about every category of the list
for(Municipio mun : list44) {
    nommunicipious=mun.getNombre();
    iddepartamentous=mun.getDepartamentos().getIddepartamentos();
    }
    
    //consulta para traer a los municipios
    
    ArrayList<Sucursal> datos4=su.getSucursalpormuni(idmunicipious);
    request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta
                                                     
  ArrayList<Sucursal> list4 = (ArrayList<Sucursal>) request.getAttribute("datos4");
// print the information about every category of the list
for(Sucursal suc: list4) {
 idus=suc.getIdsucursal();
 nombreus=suc.getNombreSucursal();
 direccionus=suc.getDireccion();
     
    }  
//consulta para traer a los departamentos
    ArrayList<Departamentos> datos5= dep.getDepartamendoporid(iddepartamentous);
    request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta
                                                     
  ArrayList<Departamentos> list5 = (ArrayList<Departamentos>) request.getAttribute("datos5");
// print the information about every category of the list
for(Departamentos deptos : list5) {
    
    nomdepartamentous=deptos.getNombre();
     
    }
               
                         %>
                            
                            
  
					<p>
				      	     <input name="idsucursal" type="radio"  value="<%=idus%>"   id="<%=idus%>" />
                                             <label for="<%=idus%>"><font SIZE=4 color="blue"><%=nombreus%>,&nbsp;<%=nommunicipious%>,&nbsp;<%=nomdepartamentous%>,&nbsp;<%=direccionus%></font></label>
				        </p>
				    
                              <% }%>     
                              
                              <p><font SIZE=4> Sucursales Disponibles en toda la Republica</font></p>                      
                                                      
        <div class="input-field col s12">
    <select  name="idsucursal">                       
              
                              
<%
    
ArrayList<Sucursal> datos6=su.getSucursal();/// consulta bd 
                            
                            
request.setAttribute("datos6", datos6);// pasamos los parametros de la consulta
                            
                          

ArrayList<Sucursal> list6 = (ArrayList<Sucursal>) request.getAttribute("datos6");

// print the information about every category of the list
for(Sucursal suc : list6) {
                
    idus2=suc.getIdsucursal();
    
    nombre2=suc.getNombreSucursal();
    direccion2 =suc.getDireccion();
    
    int idmunicipio=suc.getMunicipio().getIdmunicipio();
    String nommunicipio="";
    int iddepartamento=0;
    String nomdepartamento="";
    
    
    //consulta para traer a los municipios
    
    ArrayList<Municipio> datos7= mu.getMunicipioporid(idmunicipio);
    request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta
                                                     
  ArrayList<Municipio> list7 = (ArrayList<Municipio>) request.getAttribute("datos7");
// print the information about every category of the list
for(Municipio muni : list7) {
    
    nommunicipio=muni.getNombre();
    iddepartamento=muni.getDepartamentos().getIddepartamentos();
     
    }
    

//consulta para traer a los departamentos
   
    ArrayList<Departamentos> datos8= dep.getDepartamendoporid(iddepartamento);
    request.setAttribute("datos8", datos8);// pasamos los parametros de la consulta
                                                     
  ArrayList<Departamentos> list9 = (ArrayList<Departamentos>) request.getAttribute("datos8");
// print the information about every category of the list
for(Departamentos deptos : list9) {
    
    nomdepartamento=deptos.getNombre();
     
    }
    

                           
                            
                         %>
                            
                            
  
                     
        <optgroup label="<%=nomdepartamento%>">
            <option value="<%=idus2%>"><%=nombre2%>,&nbsp;<%=nommunicipio%>&nbsp;<%=direccion2%></option>
        </optgroup>
                         
         			     
                        
	
        
         
                              <% }%>     
  
    </select>
                              <label><font SIZE=4 color="blue">Otros municipios</font></label>
  </div>
                                                    
		           </div>
                                
                            
			</div>
		</div>
		<div class="modal-footer">
			<button   type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Enviar"><i class="zmdi zmdi-mail-send"></i> </button>
			<a href="#!" class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
</form>
   
   <%}%>
   <%--  fin logica para el pago de cliente miembro sin exceso--%>
   
    <%-- logica para el pago de cliente ocacional--%>
   <%  if(session.getAttribute("idusuariomiembro")==null&&total>0)   { descuentos=0;%>
    <form id="sucursal" class="modal modal-fixed-footer"  action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"   >
		<div class="modal-content">
			<h5 class="center-align">Pagos y solicitud de pedido</h5>
                       
			<div class="row">
                               <div class="col s12">
                                   <p class="center-align"><font SIZE=4>"Pulse el boton Paypal para realizar su pago"</font></p>
                                   <%-- sesionando = null aleatorio --%>
                                   
                    <% 
                      if(session.getAttribute("sesionAlea")==null){  
                          
                                             session.setAttribute("sesionAlea", aleatorios); 
                                                                  }
                     %>                                  
                                   
                     <center>
                                  	<a>
                                                    <%double cambio=totalpagar/7; %>
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="luislocoxcristo-facilitator@gmail.com">
            <input type="hidden" name="item_name" value="Premium Subscription">
            <input type="hidden" name="currency_code" value="USD">
            <input type="hidden" name="amount" value="<%=cambio%>">
            <input type="hidden" name="no_shipping" value="1">
            <input type="hidden" name="return" value="http://localhost:8080/Laudry-hibernate_2/cesta.jsp?numero=<%=session.getAttribute("sesionAlea")%>">                                                                        
            <input type="hidden" name="cancel_return" value="http://localhost:8080/Laudry-hibernate_2/laundryweb_com.jsp?errorpago=errorpago">
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
            <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">

       

                                       </a>     
                      </center>        
                          
		           </div>
                            
                            
                            
                            
			</div>
		</div>
		<div class="modal-footer">
			
			<a href="#!" class="modal-action modal-close waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Cerrar"><i class="zmdi zmdi-close"></i></a>
		</div>
</form>
   
   
   <%}%>
<%-- fin logica para el pago de cliente ocacional--%>
   
   
   
   
   
   
   
   
   
   
        <%-- fin modal para verificar sucursales --%>         
   
        <%-- comprobando si recibe algo --%>  
       
         <%  if(numero==0) { /// caundo esta null
              
              
         }
         
         
         if (numero2==1){
              
         
               int sesionAlea=(Integer)session.getAttribute("sesionAlea");
               
              
              
               
               
             
               if(numero==sesionAlea) { %>
                
               
                 <%-- confirmacion de pago  --%>    
      
        <a href="#confirmacion"  id="enlace" class="modal-trigger"></a>
      
        <form id="confirmacion" class="modal modal-fixed-footer"  action="xyzinsertfactura" method="post"  >
           <div class="modal-content">
			<h5 class="center-align">Confirma tu pago</h5>
			<div class="row">
                               <div class="col s12">

                                       <div class="center-align">
                                   <i class="large material-icons">assignment_turned_in</i>
                                       </div>
                                   
                                   
                                   
                                   <p><font SIZE=4>¿A donde quieres que te enviemos el pedido?</font></p>
                                        <p>
				      	     <input name="recoger" type="radio"  value="CASA"   id="recoger1" />
                                             <label for="recoger1"><font SIZE=4 color="blue">A su dirección</font></label>
				        
                                             &nbsp;&nbsp;&nbsp;&nbsp;
                                        
				      	     <input name="recoger" type="radio"  value="SUCURSAL"   id="recoger2"  />
                                             <label for="recoger2"> <font SIZE=4 color="blue">Recoger en sucursal</font></label>
                                        </p> </br>
     
                                        <input name="idusuario" type="hidden" value="<%=idusuariooo%>"/>
                                        <input name="total" type="hidden" value="<%=total%>"/>
                                        <input name="totalpagar" type="hidden" value="<%=totalpagar%>"/>
                                        <input name="descuento" type="hidden" value="<%=descuentos%>"/>
                                        <input name="grantotal" type="hidden" value="<%=grantotal%>"/>
  
  
                                        <p class="center-align"><font SIZE=4 >Selecciona la sucursal que desees enviar tu pedido</font></p>
                                   
                                        <p><font SIZE=4>Sucursales por donde vives</font></p>
	
<% 
                            
SucursalCRUD su =new SucursalCRUD();
MunicipiosCRUD mu =new MunicipiosCRUD();
DepartamentosCRUD dep =new DepartamentosCRUD();
UsuarioCRUD user=new UsuarioCRUD();

int idusuario =(Integer)session.getAttribute("idusuario");

ArrayList<Usuario> datos3=user.getUsuarioporid(idusuario);
                            
                            
request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta
                            
                          

ArrayList<Usuario> list3 = (ArrayList<Usuario>) request.getAttribute("datos3");

// print the information about every category of the list
for(Usuario us : list3) {
         
   
   
    int idmunicipious=us.getMunicipio().getIdmunicipio();
    String nombreus="";
    String direccionus ="";
    String nommunicipious="";
    int iddepartamentous=0;
    String nomdepartamentous="";
        
    
    ArrayList<Municipio> datos44= mu.getMunicipioporid(idmunicipious);
    request.setAttribute("datos44", datos44);// pasamos los parametros de la consulta
                                                     
  ArrayList<Municipio> list44 = (ArrayList<Municipio>) request.getAttribute("datos44");
// print the information about every category of the list
for(Municipio mun : list44) {
    nommunicipious=mun.getNombre();
    iddepartamentous=mun.getDepartamentos().getIddepartamentos();
    }
    
    //consulta para traer a los municipios
    
    ArrayList<Sucursal> datos4=su.getSucursalpormuni(idmunicipious);
    request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta
                                                     
  ArrayList<Sucursal> list4 = (ArrayList<Sucursal>) request.getAttribute("datos4");
// print the information about every category of the list
for(Sucursal suc: list4) {
 idus=suc.getIdsucursal();
 nombreus=suc.getNombreSucursal();
 direccionus=suc.getDireccion();
     
    }  
//consulta para traer a los departamentos
    ArrayList<Departamentos> datos5= dep.getDepartamendoporid(iddepartamentous);
    request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta
                                                     
  ArrayList<Departamentos> list5 = (ArrayList<Departamentos>) request.getAttribute("datos5");
// print the information about every category of the list
for(Departamentos deptos : list5) {
    
    nomdepartamentous=deptos.getNombre();
     
    }
               
                         %>
                            
                            
  
					<p>
				      	     <input name="idsucursal" type="radio"  value="<%=idus%>"   id="<%=idus%>" />
                                             <label for="<%=idus%>"><font SIZE=4 color="blue"><%=nombreus%>,&nbsp;<%=nommunicipious%>,&nbsp;<%=nomdepartamentous%>,&nbsp;<%=direccionus%></font></label>
				        </p>
				    
                              <% }%>     
                              
                              <p><font SIZE=4>Sucursales Disponibles en toda la Republica</font></p>                      
                                                      
                              
           <div class="input-field col s12">
               <select name="idsucursal">              
                              
<%
    
ArrayList<Sucursal> datos6=su.getSucursal();/// consulta bd 
                            
                            
request.setAttribute("datos6", datos6);// pasamos los parametros de la consulta
                            
                          

ArrayList<Sucursal> list6 = (ArrayList<Sucursal>) request.getAttribute("datos6");

// print the information about every category of the list
for(Sucursal suc : list6) {
                
    int id=suc.getIdsucursal();
    String nombre=suc.getNombreSucursal();
    String direccion =suc.getDireccion();
    
    int idmunicipio=suc.getMunicipio().getIdmunicipio();
    String nommunicipio="";
    int iddepartamento=0;
    String nomdepartamento="";
    
    
    //consulta para traer a los municipios
    
    ArrayList<Municipio> datos7= mu.getMunicipioporid(idmunicipio);
    request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta
                                                     
  ArrayList<Municipio> list7 = (ArrayList<Municipio>) request.getAttribute("datos7");
// print the information about every category of the list
for(Municipio muni : list7) {
    
    nommunicipio=muni.getNombre();
    iddepartamento=muni.getDepartamentos().getIddepartamentos();
     
    }
    

//consulta para traer a los departamentos
   
    ArrayList<Departamentos> datos8= dep.getDepartamendoporid(iddepartamento);
    request.setAttribute("datos8", datos8);// pasamos los parametros de la consulta
                                                     
  ArrayList<Departamentos> list9 = (ArrayList<Departamentos>) request.getAttribute("datos8");
// print the information about every category of the list
for(Departamentos deptos : list9) {
    
    nomdepartamento=deptos.getNombre();
     
    }
    

                            
                            
                         %>
                            
                            
        <optgroup label="<%=nomdepartamento%>">
        <option value="<%=id%>"><%=nombre%>,&nbsp;<%=nommunicipio%>&nbsp;<%=direccion%></option>
        </optgroup>
                        
					
				    
                              <% }%>     
   
                                                      
       </select>
                              <label><font SIZE=4 color="blue" >Otros Municipios</font></label>
  </div> 
                                   
                                   
                                   
                                   
                                   
                                   
                                   
      
			        </div>
                        </div>
		        </div>
		<div class="modal-footer">
			<button   type="submit"  class="waves-effect btn-flat tooltipped" data-position="top" data-tooltip="Confirmar"><i class="zmdi medium zmdi-check"></i> </button>
			
		</div>
         
	</form>
      
        
        
        <%-- fin confirmacion de pago  --%>  
               
           
           
             
             <%  session.setAttribute("sesionAlea", null); 
             
                        } else { %>
                                  <%-- <%=sesionAlea%>--%> 
                                <%}


}%>   
              
             
        
        <%--  fin comprobando si recibe algo --%>  
 
   
               
     
               
               
     
     <%}%>
     
    
    
       
     
   
     
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
        
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
        
               <script src="js/cesta.js" type="text/javascript"></script>
               
         <script type="text/javascript">
                $(function(){
    
                            $('tr #deleteitem').click(function(){
                                  alert("Desea eliminar de la cesta");
                                              location.reload();
        
                                                                });
                                                                
                                                                
                             $('#2').click(function(){
                                
                                              location.reload();
        
                                                                });                 
                                                                
                                                                
                                                                
                            });
                   
         </script>
                   
  
       
        
    

