


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
        
        
        
        
        <title>Validar entregas</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/motorista</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazmotorista.jsp" class="waves-effect">Home</a></li>
				
				
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
        <h5 class="center-align tittles">ordenes entregadas</h5>
	
		<div class="container valign">
			<div class="row">
                           
                              <%   
                                    int idoperador=(Integer)session.getAttribute("idusuario");
                                    int idsucursal=(Integer)session.getAttribute("idsucursal");
                                    int idcliente=0;
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
                                    
                                    String nombre=null;
                                    String apellido=null;
                                    
                                    FacturaCRUD fac=new FacturaCRUD();
                                    DetalleCRUD deta=new DetalleCRUD();
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                                    UsuarioCRUD user=new UsuarioCRUD();
                    
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                  
                                    
                                    ArrayList<Factura> datos=fac.getFacturaestadoenviadoaentrega(idsucursal);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                                    ArrayList<Factura> list = (ArrayList<Factura>) request.getAttribute("datos");
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

for(Factura fact : list) {
    
        nofactura=fact.getNofactura();
        fecha=fact.getFecha();
        estado=fact.getEstado();
        idcliente=fact.getUsuario().getIdusuario();
       


                                    ArrayList<Usuario> datos5=user.getUsuarioporid(idcliente);/// consulta bd 
                                    request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta                 
                                    ArrayList<Usuario> list5 = (ArrayList<Usuario>) request.getAttribute("datos5");

                                              for(Usuario usua : list5) {
                                                   
                                                  nombre=usua.getNombre();
                                                  apellido=usua.getApellido();
                                                


               %>
                
                
               
                     </br> <div class="z-depth-3">
                                <div style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;">  
                                  </br>
                                 
                                  
                                  <div class="center-align"> <a class="waves-effect waves-light btn blue">Orden:&nbsp;<%=nofactura%></a> </div>
                                 
                                        
                                     
                           <table class="responsive-table light-blue lighten-5">
                                
                                <thead>
                                    <tr>
                                   <th>No.Orden</th>
                                   <th>Fecha</th>
                                   <th>Cliente</th>
                                   <th>Estado</th>  
                                   <th>Proceso</th> 
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                    <td><%=nofactura%></td>
                                    <td><%=fm.format(fecha)%></td>
                                    <td><%=nombre%>&nbsp;<%=apellido%></td>
                                    <td><%=estado%></td>
                                    <td>
                                       
                                        <form action="detallesvalidarpedidos.jsp" method="post">
                                            
                                            <input name="nofactura" type="hidden" value="<%=nofactura%>"/>
                                            <button  type="submit" class="tooltipped" data-position="right" data-tooltip="Detallar"><i class="small material-icons">motorcycle</button> 
                                        </form>
                                            
                                       
                                    </td>
                                  
                                    </tr>
                                </tbody>
                                    
                            </table>
                                        
                                    
                                     </br><center>
                                       <a class="waves-effect waves-light btn blue">Detalle de la orden</a>
                                        </center>
                                     
                         
                                     
                                     
                                     
                                     
                                     
                                                                 
        <%
        
            ArrayList<Detalle> datos2=deta.getDetalleporidfact(nofactura);/// consulta bd 
            request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                 
            ArrayList<Detalle> list2 = (ArrayList<Detalle>) request.getAttribute("datos2");
        
     
            %>   <table class="responsive-table">
                                
                                <thead>
                                  <tr>    
                                   <th>Codigo</th>
                                   <th>Pedido</th>
                                   <th>Servicio</th>
                                   <th>Cantidad</th>
                                   <th>Tarifa</th>
                                   <th>Total</th>
                                  </tr>
                                </thead> 
                                 <tbody>
          <%
              for(Detalle detall : list2) { 
                  cantidad=detall.getCantidad();
                  idtarifa=detall.getIdtarifa();
                  subtotal=detall.getSubtotal();
                 
                            
                             
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
                                      
                                                                    nombreser=servi.getNombreSer(); %>
                                      
                                    
                           
             
                               
                                  <tr>
                                    <td><%=idservicio%></td>
                                    <td><%=nombreser%></td>
                                    <td><%=serlavado%></td>
                                    <td><%=cantidad%></td>
                                    <td><%=tarifaser%></td>
                                    <td><%=subtotal%></td>
                                  </tr>
                                
                                                                    
                                                                    
                                  
                                  
                                    
                          
                                                                    
                                                                    
                                                                    
                                                                                   <%  }//servicio
                                           
                                           
                                                              }//tarifa
                             
                  
                         
                                    
                  
                                           
                                           }//detalle  %>
        
                                               <%    } ///usuario  %> 

          </tbody>
                                
                                
                            </table>                 </br>   </div>  </div>   </br>                     <%      }///factura %>
                                
     </br>                          
        
     <%}%>
                                      
              
                           
                         
                              
                            
                                
                             
                    
                    
        </div>
	
              </div>
                   
                  </div>
        
        
        
        
        
     
        
    </body>
</html>

