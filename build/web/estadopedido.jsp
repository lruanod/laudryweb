

<%@page import="modelos.Ordenoperador"%>
<%@page import="modelos.CRUD.OrdenoperadorCRUD"%>
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
        $('.scrollspy').scrollSpy();
            
                                         });
        
        </script>
        
        
        
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
        
        <title>Estado</title>
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
				<li><a href="cesta.jsp" >Pedido</a></li>
                                <% if(session.getAttribute("idusuario")!=null) {%>
                                <li>${sessionScope.usuario}:<a href="#"  data-activates="slide-out" class="waves-effect" id="barra"><i class="material-icons">person</i></a></li>
                               	<%}%>
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	
		<div class="container valign">
			<div class="row">
                           
                            </br>
                            <div class="center-align">
                        <div class="card hoverable light-blue ">
                                <div style="border-style:ridge; border-width: 20px; border-color:grey darken-2;">
                                    
                                  </br>
                                  
                                  <h5 class="tittles center-align">Estados del pedido</h5></br>
                          
                                 <div style="display: flex; justify-content: space-around;">
                                    
                                    
                            <a class="btn btn-floating pulse red" style="height:110px; width:110px; border-style: dashed; border-width: 4px;"><p class="center-align">PAGADO</p></a>         
                            <a class="btn btn-floating pulse orange darken-1 "style="height:110px; width:110px; border-style: dashed; border-width: 4px;"><p class="center-align">ENVIADO A RECOGER</p></a>
                            <a class="btn btn-floating pulse light-blue darken-4" style="height:118px; width:118px; border-style: dashed; border-width: 4px;"><p class="center-align">PROCESANDO</p></a>
                            <a class="btn btn-floating pulse amber accent-3" style="height:110px; width:110px; border-style: dashed; border-width: 4px;"><p class="center-align">ENVIADO A ENTREGA</p></a>
                            <a class="btn btn-floating pulse green" style="height:110px; width:110px; border-style: dashed; border-width: 4px;"><p class="center-align">ENTREGADO</p></a>
                                   
                                 </div>
                        
                                  </br> </br></div>
                                    </div>
                              <%   
                                    int idusuario=(Integer)session.getAttribute("idusuario");
                                    BigDecimal total =null;
                                    BigDecimal descuento=null;
                                    int nofactura=0;
                                    String estado=null;
                                    String entrega=null;
                                    Date fecha=null;
                                    
                                    int idservicio=0;
                                    int cantidad=0;
                                    BigDecimal subtotal=null;
                                    int idtarifa=0;
                                    
                                    String serlavado=null;
                                    BigDecimal tarifaser=null;
                                    
                                    String nombreser=null;
                                    
                                    String tiempo=null;
                                    
                                    FacturaCRUD fac=new FacturaCRUD();
                                    DetalleCRUD deta=new DetalleCRUD();
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                                    OrdenoperadorCRUD oroper=new OrdenoperadorCRUD();
                    
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                     
                                    
                                    ArrayList<Factura> datos=fac.getFacturadiferenteentrega(idusuario);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                                    ArrayList<Factura> list = (ArrayList<Factura>) request.getAttribute("datos");

for(Factura fact : list) {
    
        nofactura=fact.getNofactura();
        descuento=fact.getDescuento();
        total=fact.getTotal();
        estado=fact.getEstado();
        entrega=fact.getEntrega();
        fecha=fact.getFecha(); 

                                               ArrayList<Ordenoperador> datos7=oroper.getOredenoperadornofact(nofactura);/// consulta bd 
                                               request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta                 
                                               ArrayList<Ordenoperador> list7 = (ArrayList<Ordenoperador>) request.getAttribute("datos7");
                          
                                                        for(Ordenoperador ordenoper : list7) {
                                      
                                                                    tiempo=ordenoper.getEstimaciontiempo(); }
                              
                              
                              
                              %>
                 </br>
                
                                     
                  <div class="card hoverable light-blue lighten-5">
        <div style="border-style:ridge; border-width: 10px; border-color: grey lighten-4">
                
                                     </br>
                                     
                                    
                                     
                                     
                                    
                                     <a class="waves-effect waves-light btn blue">Estado de la factura</a> 
                                     
                                     <% if(estado.equals("PAGADO")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn red"><%=estado%></a></div>
                                     <%}%>
                                     
                                     
                                     <% if(estado.equals("ENVIADO A RECOGER")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn orange darken-1"><%=estado%></a></div>
                                     <%}%>
                                        
                                     
                                     <% if(estado.equals("PROCESANDO")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn light-blue darken-4"><%=estado%>&nbsp;espera de:&nbsp;hrs:&nbsp;<%=tiempo%></a></div>
                                     <%}%>
                                     
                                     <% if(estado.equals("ENTREGADO")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn green"><%=estado%></a></div>
                                     <%}%>
                                     
                                     <% if(entrega.equals("CASA")){%> 
                                     
                                      <% if(estado.equals("ENVIADO A ENTREGAR")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn amber accent-3"><%=estado%></a></div>
                                     <%}%> <%}%>
                                     
                                      <% if(entrega.equals("SUCURSAL")){%> 
                                     
                                      <% if(estado.equals("ENVIADO A ENTREGAR")){%> 
                                     <div class="right-align">
                                         Estado: <a class="waves-effect waves-light btn amber accent-3">Ya puedes pasar a recoger</a></div>
                                     <%}%> <%}%>
                                     
                                     
                                   <table class="responsive-table">
                                
                                <thead>
                                    <tr>
                                   <th>No.</th>     
                                   <th>Fecha</th>
                                   <th>Descuento</th>
                                   <th>Lugar de entrega</th>
                                   
                                   <th>Total Facturado</th>
                                   
                                                                 
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                    <td><%=nofactura%></td>
                                    <td><%=fm.format(fecha)%></td>
                                    <td><%=descuento%></td>
                                    <td><%=entrega%></td>
                                   
                                    <td><%=total%></td>
                                    </tr>
                                </tbody>
                                
                                
                            </table>
                                        
                                    
                                     </br><center>
                                       <a class="waves-effect waves-light btn blue">Detalle de la factura</a>
                                        </center>
                                  
                             <table class="responsive-table">
                                
                                <thead>
                                    <tr>
                                        
                                   <th>Pedido</th>
                                   <th>Servicio</th>
                                   <th>Unidades</th>
                                   <th>Tarifa</th>
                                   <th>Sub-total</th>
                                  
                                   
                                                                 
                                    </tr>
                                </thead>
             
                                
                                <tbody>        
                                  
        <%
        
            ArrayList<Detalle> datos2=deta.getDetalleporidfact(nofactura);/// consulta bd 
            request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                 
            ArrayList<Detalle> list2 = (ArrayList<Detalle>) request.getAttribute("datos2");
        
              for(Detalle detall : list2) { 
                  cantidad=detall.getCantidad();
                  subtotal=detall.getSubtotal();
                  idtarifa=detall.getIdtarifa();
                       
                             //getTarifaporid
                             
                         ArrayList<Tarifa> datos4=tari.getTarifaporid(idtarifa);/// consulta bd 
                         request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta                 
                         ArrayList<Tarifa> list4 = (ArrayList<Tarifa>) request.getAttribute("datos4");
        
                                  for(Tarifa tarif : list4) {  
                                           idservicio=tarif.getServicio().getIdservicio();
                                           serlavado=tarif.getNombreser();
                                           tarifaser=tarif.getTarifaSer();
                                      
                                           
                                               ArrayList<Servicio> datos3=ser.getServicioporid(idservicio);/// consulta bd 
                                               request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
                                               ArrayList<Servicio> list3 = (ArrayList<Servicio>) request.getAttribute("datos3");
                          
                                                        for(Servicio servi : list3) {
                                      
                                                                    nombreser=servi.getNombreSer(); 
        
        
                                                                         
        
        
        
        
        
        
        
        %>
                                      
                                    
                               
                                    <tr>
                                    <td><%=nombreser%></td>
                                    <td><%=serlavado%></td>
                                    <td><%=cantidad%></td>
                                    <td><%=tarifaser%></td>
                                    <td><%=subtotal%></td>
                                    </tr>
                               
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                                   <%  }//servicio
                                           
                                           
                                                              }//tarifa
                             
                  
                         
                                    
                  
                                           
                                           }//detalle   %>
        
                                          
                                     </tbody>  </table> </div> </div> </br>    <% }///factura %>
                                
     </br>                          
                                   
                                      
              
                           
                           
                           
                          
                            
                                
                             
                                
                      

   
                       



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
        
     
       
        
        
    </body>
</html>
