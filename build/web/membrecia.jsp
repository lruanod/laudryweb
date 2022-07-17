

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
        
        <!-- aviso de pago exitoso-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('Su pago fue realizado con éxito &nbsp;&nbsp;<a href="membrecia.jsp">OK</a>',9000, 'rounded');
             
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
        
        <title>Membrasia</title>
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
	        <h5 class="tittles center-align">Membresía</h5>
		<div class="container valign">
			<div class="row">
                            
                            
                              <% 
                                    int idusuario=(Integer)session.getAttribute("idusuario");
                                    int idusuariomiembro=0;
                                    Date vencimiento=null;
                                    Date inicio=null;
                                    Date ultimopago=null;
                                    String estado=null;
                                    String nombremem=null;
                                    double saldodisponible=0;
                                    double cuota=0;
                                    double saldo=0;
                                    int idmembrecia=0;
                                    int aleatorios=(int)(Math.random()*500)+1;
                                    int numero=0;
                                    int numero2=0;
                                    int mespago=0;
                                    UsuariomiembroCRUD usm=new UsuariomiembroCRUD();
                                    MembreciaCRUD mem= new MembreciaCRUD();
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                    SimpleDateFormat fm2=new SimpleDateFormat("MM");
                                    
                                    ArrayList<Usuariomiembro> datos=usm.getUsuariomiembroporidtodo(idusuario);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
                                    ArrayList<Usuariomiembro> list = (ArrayList<Usuariomiembro>) request.getAttribute("datos");


for(Usuariomiembro usmi : list) {
          idusuariomiembro=usmi.getIdusuariomiembro();
          vencimiento=usmi.getVencimiento();
          
          inicio=usmi.getInicio();
          
          ultimopago=usmi.getUltimoPago();
          mespago=usmi.getMespago();
          estado=usmi.getEstado();
          saldodisponible=usmi.getSaldodisponible().doubleValue();
          idmembrecia=usmi.getMembrecia().getIdmembrecia();
          
    }

ArrayList<Membrecia> datos2=mem.getMembrecia(idmembrecia);/// consulta bd 
request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
ArrayList<Membrecia> list2 = (ArrayList<Membrecia>) request.getAttribute("datos2");


for(Membrecia memb : list2) {
         nombremem=memb.getNombreMem();
         cuota=memb.getCuota().doubleValue();
         saldo=memb.getSaldo().doubleValue();
    }

                                    if(session.getAttribute("sesionAlea")==null){  
                          
                                             session.setAttribute("sesionAlea", aleatorios); 
                                                                  }  
                                
                                   if(session.getAttribute("idusuario")!=null&&idusuariomiembro>0) {
                                   
                                   %>
                                   </br><center>
                                       <a class="waves-effect waves-light btn blue">Membresía que posee actualmente</a>
                                        </center>
                                   
                                   <table class="responsive-table striped bordered">
                                
                                <thead>
                                    <tr>
                                        
                                   <th>Plan Actual</th>
                                   <th>Pago Mensual</th>
                                   <th>Saldo Acreditado Mensual</th>
                                   <th>Inicio de Contratación</th>
                                   <th>Vencimiento</th>
                                   <th>Ultimo Pago Realizado</th>
                                   <th>Saldo Disponible</th>
                                   <th>Estado</th>
                                                                 
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                    <td><%=nombremem%></td>
                                    <td>Q<%=cuota%></td>
                                    <td>Q<%=saldo%></td>
                                    <td><%=fm.format(inicio)%></td>
                                    <td><%=fm.format(vencimiento)%></td>
                                    <td><%=fm.format(ultimopago)%></td>
                                    <td>Q<%=saldodisponible%></td>
                                    <td><%=estado%></td>
                                    </tr>
                                </tbody>
                                
                                
                            </table>
                                    
                                    
                                    <%  
                                         Calendar fecha = Calendar.getInstance();
                                         int mes = fecha.get(Calendar.MONTH) + 1;
                                         int mesultimo=Integer.parseInt(fm2.format(ultimopago));
                                         if(mes>mesultimo){
                                    %>
                                       </br><center>
                                       <a class="waves-effect waves-light btn blue"> Paga tu Membresía</a>
                                       </center></br>
      <center>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"   >
            <a title="Pagar en paypal">
             <% double cambio=cuota/7;%>    
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="luislocoxcristo-facilitator@gmail.com">
            <input type="hidden" name="item_name" value="Premium Subscription">
            <input type="hidden" name="currency_code" value="USD">
            <input type="hidden" name="amount" value="<%=cambio%>">
            <input type="hidden" name="no_shipping" value="1">
            <input type="hidden" name="return" value="http://localhost:8080/Laudry-hibernate_2/membrecia.jsp?numero=<%=session.getAttribute("sesionAlea")%>">
            <input type="hidden" name="cancel_return" value="http://www.sitio.com/cancelado.php">
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
            <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
            </a>     
            
        </form>     
     </center> 
            
                           <%}%>      
                            
                           </br><center>
                                <div class="z-depth-3">
                                <div style="border: 2px solid blue;">  
                                <p>NOTA: Los pagos se realizan de forma mensual, cada principio de mes aparecerá un boton de enlace para que pueda realizar su pago mensual.</p>
                                </div>
                                </div>    
                                </center>
                           
                           
                            <%} else { //inicio
                         ///   inicio

                                    ArrayList<Usuariomiembro> datos4=usm.getUsuariomiembroporidsolicitado(idusuario);/// consulta bd 
                                    request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta
                                                     
                                    ArrayList<Usuariomiembro> list4 = (ArrayList<Usuariomiembro>) request.getAttribute("datos4");
      if (list4.isEmpty()){ 
                            
ArrayList<Membrecia> datos3=mem.getMembreciatodo();/// consulta bd 
request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta
ArrayList<Membrecia> list3 = (ArrayList<Membrecia>) request.getAttribute("datos3");%>

                                        <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;">       
                                      </br><center>
                                       <a class="waves-effect waves-light btn blue">Planes de Membresía</a>
                                        </center>
                                   
                                   <table class="responsive-table striped bordered">
                                       
                                 <thead>
                                    <tr>
                                   <th>Selección</th>     
                                   <th>Plan</th>
                                   <th>Pago mensual</th>
                                   <th>Saldo acreditado mensual</th>
                                   <th>Asociar</th>
                                                                 
                                    </tr>
                                </thead>
                                 <tbody>
                                     
 <form action="xyzsolicitudmembrecia" method="post">

       <%for(Membrecia memb2 : list3) {
         int idmembrecia2=memb2.getIdmembrecia();
         String nombremem2=memb2.getNombreMem();
         double cuota2=memb2.getCuota().doubleValue();
         double saldo2=memb2.getSaldo().doubleValue();  %>   
                            <tr>
                            
         <td> <input checked="" class="with-gap" name="idmembrecia" type="radio"  value="<%=idmembrecia2%>" id="<%=idmembrecia2%>"  />
              <label for="<%=idmembrecia2%>"></label> </td>
         
         <td><%=nombremem2%></td>
         <td>Q.<%=cuota2%></td>
         <td>Q.<%=saldo2%></td>
         <td> <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Asociar"><i class="small material-icons">queue</i> </button> </td>
         
         
                            
                            
                            
                            </tr>
                            
                            
                            <%  } %>
                            
                                
                                </tbody>
                                
                                
                                   </table> </div>
                            </form>
                                 
                                 </br><center>
                                      <div class="z-depth-3">
                                <div style="border: 2px solid blue;">  
                                <p>NOTA: Los planes de membresía funcionan con contratación anual con un una cuota mensual, en donde su principal beneficio es pagar menos por más pedidos de servicios.</p>
                                </div>
                                      </div>
                                 </center>
              

    <%} else{

for(Usuariomiembro usmi5 : list4) {
          idusuariomiembro=usmi5.getIdusuariomiembro();
          vencimiento=usmi5.getVencimiento();
          
          inicio=usmi5.getInicio();
          
          ultimopago=usmi5.getUltimoPago();
          mespago=usmi5.getMespago();
          estado=usmi5.getEstado();
          saldodisponible=usmi5.getSaldodisponible().doubleValue();
          idmembrecia=usmi5.getMembrecia().getIdmembrecia();
          
    }

ArrayList<Membrecia> datos5=mem.getMembrecia(idmembrecia);/// consulta bd 
request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta
ArrayList<Membrecia> list5 = (ArrayList<Membrecia>) request.getAttribute("datos5");


for(Membrecia memb5 : list5) {
         nombremem=memb5.getNombreMem();
         cuota=memb5.getCuota().doubleValue();
         saldo=memb5.getSaldo().doubleValue();
    }
  %>
                       





</br><center>
                                       <a class="waves-effect waves-light btn blue">Planes de Membrecía asociados sin Autorización</a>
                                        </center>
                                   
                                   <table class="responsive-table striped bordered">
                                       
                                 <thead>
                                    <tr>
                                      
                                   <th>Plan</th>
                                   <th>Pago Mensual</th>
                                   <th>Saldo Acreditado Mensual</th>   
                                   <th>Estado</th>
                                    </tr>
                                </thead>
                                 <tbody>

         <tr>
         <td><%=nombremem%></td>
         <td>Q.<%=cuota%></td>
         <td>Q.<%=saldo%></td>
         <td><%=estado%></td>
         </tr>
         </tbody>
                                
                                
                            </table>
                            
              </br><center>
                         <p>NOTA: En término de 24 horas procesaremos su contratación de Servicio.</p>
                   </center>               
                            
              

      <%} }%>                      
                                 
                                 
              
<% int sesionAlea=(Integer)session.getAttribute("sesionAlea");
               
              
 int idusuariooo=(Integer)session.getAttribute("idusuario");

 
 if(request.getParameter("numero")!=null){
 
   numero=Integer.parseInt(request.getParameter("numero"));
   numero2=1;
    }
               
               
             
               if(numero==sesionAlea) { %>
                
               
                 <%-- confirmacion de pago  --%>    
      
        <a href="#confirmacion"  id="enlace" class="modal-trigger"></a>
      
        <form id="confirmacion" class="modal modal-fixed-footer"  action="xyzpagomembrecia" method="post"  >
           <div class="modal-content">
			<h5 class="center-align">Confirma tu pago</h5>
			<div class="row">
                               <div class="col s12">

                                       <div class="center-align">
                                   <i class="large material-icons">assignment_turned_in</i>
                                       </div>
                                   
                                                            
              
                                        <input name="idusuario" type="hidden" value="<%=idusuariooo%>"/>
                                        <input name="idusuariomiembro" type="hidden" value="<%=idusuariomiembro%>"/>
                                        <input name="mespago" type="hidden" value="<%=mespago%>"/>
                                        <input name="saldo" type="hidden" value="<%=saldo%>"/>
                                        <input name="ultimopago" type="hidden" value="<%=ultimopago%>"/>
                                        
     
                                   
      
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
                                 <%--  <%=sesionAlea%> --%>  
                                <%}%>                      
                                                        
                           
                                                                                                          
                                                    
                                                        
                                        
                           
                      
			</div>
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
          <h3>Lavar nunca fue tan Fácil!</h3>
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
