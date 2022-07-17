

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
        
        
        
        
        <!-- aviso de cerrda la sesion-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="validarpedidos.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Detalle membrecia</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
                                <li><a href="validarmembrecias.jsp" class="waves-effect">Validar membresías</a></li>
				
				
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	      <h5 class="tittles center-align">detalle para validar membresía</h5>
		<div class="container valign">
			<div class="row">
              
                         <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;"> </br>      
                                   
                                   <table class="responsive-table striped bordered centered">
                                
                                <thead>
                                    <tr>
                                   <th>Solicitado por</th>       
                                   <th>Plan</th>
                                   <th>Pago mensual</th>
                                   <th>Saldo acreditado mensual</th>
                                   <th>Inicio de contratación</th>
                                   <th>Vencimiento</th>
                                   <th>Estado</th>
                                   <th>Aciones</th>
                                                                 
                                    </tr>
                                </thead>
                                
                                <tbody>    
         
                            <% 
                                    
                                   
                                    int idusuariomiembro=Integer.parseInt(request.getParameter("idusuariomiembro"));
                                    String nombre=null;
                                    String apellido=null;
                                    String correo=null;
                                    String nit=null;
                                    int idusuario=0;
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
                                    UsuarioCRUD us=new UsuarioCRUD();
                                    UsuariomiembroCRUD usm=new UsuariomiembroCRUD();
                                    MembreciaCRUD mem= new MembreciaCRUD();
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                    SimpleDateFormat fm2=new SimpleDateFormat("MM");
                                    
                                    ArrayList<Usuariomiembro> datos=usm.getUsuariomiembroestadopendienteidusuariomiembro(idusuariomiembro);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
                                    ArrayList<Usuariomiembro> list = (ArrayList<Usuariomiembro>) request.getAttribute("datos");
if(list.isEmpty()){ %>
 </br>
 </br>
 </br>
 <div class="z-depth-3">
         <div style="border: 2px solid blue;">  
   </br>
             <div class="center-align">
                    <h5>"No hay solicitudes por el momento"</h5>
             </div>
    </br>
        </div>
 </div>    
     
 <%}  else {

for(Usuariomiembro usmi : list) {
          idusuariomiembro=usmi.getIdusuariomiembro();
          idusuario=usmi.getUsuario().getIdusuario();
          vencimiento=usmi.getVencimiento(); 
          inicio=usmi.getInicio();  
          ultimopago=usmi.getUltimoPago();
          mespago=usmi.getMespago();
          estado=usmi.getEstado();
          saldodisponible=usmi.getSaldodisponible().doubleValue();
          idmembrecia=usmi.getMembrecia().getIdmembrecia();

ArrayList<Usuario> datos4=us.getUsuarioporid(idusuario);/// consulta bd 
request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta
ArrayList<Usuario> list4 = (ArrayList<Usuario>) request.getAttribute("datos4");


for(Usuario usua : list4) {
        
          nombre=usua.getNombre();
          apellido=usua.getApellido();
          nit=usua.getNit();
          correo=usua.getCorreo();
          

ArrayList<Membrecia> datos2=mem.getMembrecia(idmembrecia);/// consulta bd 
request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
ArrayList<Membrecia> list2 = (ArrayList<Membrecia>) request.getAttribute("datos2");


for(Membrecia memb : list2) {
         nombremem=memb.getNombreMem();
         cuota=memb.getCuota().doubleValue();
         saldo=memb.getSaldo().doubleValue();
         
 %>
 <form action="xyzautorizarmembrecia" method="post">
     <input name="idusuariomiembro" type="hidden" value="<%=idusuariomiembro%>"/>
                                <tr>
                                    <td><%=nombre%>&nbsp;<%=apellido%></br>NIT:&nbsp;<%=nit%></br>Email:&nbsp;<%=correo%></td>  
                                    <td><%=nombremem%></td>
                                    <td><%=cuota%></td>
                                    <td><%=saldo%></td>
                                    <td><%=fm.format(inicio)%></td>
                                    <td> <input  id="fecha"  name="vencimiento" type="date" required=""/>  </td>
                                  
                                    <td><%=estado%></td>
                                    <td>              
                                        <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Guardar"><i class="small material-icons">save</i> </button>
                                    </td>
                                </tr>
                               
 </form>                          
                            <%}// usuario%>
                          <%}// menbrecia%>   
                           <%}//usuariomiembro%>  
                 
                  </tbody>
                                
                                
                  </table>
                            
     <%}%>               
                </div>
	
                       </div>
                </div>
                 
        
        
        
        
        
     
        
    </body>
</html>

