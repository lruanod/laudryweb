<%@page import="modelos.Operadorsucursal"%>
<%@page import="modelos.CRUD.OperadorSucursalCRUD"%>
<%@page import="modelos.Tipousuario"%>
<%@page import="modelos.CRUD.TipousuarioCRUD"%>
<%@page import="modelos.Municipio"%>
<%@page import="modelos.CRUD.MunicipiosCRUD"%>
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
        
         <script type="text/javascript">
             $(document).ready(function(){
        $("select").material_select();
            
                                         });
        
        </script>
            
         <!-- aviso de asociacion exitoso-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('Actualización exitosa &nbsp;&nbsp;<a href="usuariosOperador.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        <!-- aviso de usuario no valido-->  
          <%  String  novalido = request.getParameter("novalido");  if(novalido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('Ocurrio un error al crear usuario  asegurese de contar con internet &nbsp;&nbsp;<a href="usuariosOperador.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        <!-- aviso de usuario exitoso-->  
          <%  String  exito2 = request.getParameter("exito2");  if(exito2 !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('El registro fue exito esperando confirmación del usuario &nbsp;&nbsp;<a href="usuariosOperador.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        <!-- aviso de usuario no valido-->  
          <%  String  repetido = request.getParameter("repetido");  if(repetido !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
               Materialize.toast('Error al registrar usuario, el usuario o correo ya se encuentran ocupados &nbsp;&nbsp;<a href="usuariosOperador.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        <title>Usuarios</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
						
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
        
        <h5 class="tittles center-align">Administración de usuarios</h5>
	        
		<div class="container valign">
			<div class="row">
                            <div class="col s12">
                     
                            <a href="addoperadores.jsp"  class="waves-effect waves-light btn orange tooltipped" data-position="" data-tooltip="Agregar usuario">Agregar usuario</a></br>
                                 <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4;"> 
                              <table class="responsive-table highlight">
                                
                                <thead>
                                    <tr>
                                   <th>Acciones</th>
                                   <th>Perfil</th>
                                   <th>Nombres</th>
                                   <th>Nit</th>
                                   <th>Dirección</th>
                                   <th>Correo</th>
                                   <th>Usuario</th>
                                   <th>Estado</th>
                                   <th>DPI</th>                                                         
                                    </tr>
                                </thead>
                                
                                <tbody>
                                     
                            <% 
                            int idsucursal=(Integer)session.getAttribute("idsucursal");
                            OperadorSucursalCRUD opers =new OperadorSucursalCRUD();
                            UsuarioCRUD us=new UsuarioCRUD();
                            TipousuarioCRUD tipo=new TipousuarioCRUD();
                            int idusuario=0;
                          
                            String nombre=null;
                            String apellido=null;
                            String nit=null;
                            String direccion=null;
                            String correo=null;
                            String usuario=null;
                            String estado=null;
                            String dpi=null;
                            String nombretipo=null;
                            int idtipousuario=0;        
                            
                            
                           
                            
                                    ArrayList<Operadorsucursal> datos=opers.getoOperadorsucursalidSucursal(idsucursal);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                                    ArrayList<Operadorsucursal> list = (ArrayList<Operadorsucursal>) request.getAttribute("datos");

for(Operadorsucursal operasu : list) {  
    idusuario=operasu.getUsuario().getIdusuario();
    
                                    ArrayList<Usuario> datos2=us.getUsuarioporid(idusuario);/// consulta bd 
                                    request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                 
                                    ArrayList<Usuario> list2 = (ArrayList<Usuario>) request.getAttribute("datos2");
                                          
                                        for(Usuario usu : list2) {  
                                           
                                            nombre=usu.getNombre();
                                            apellido=usu.getApellido();
                                            nit=usu.getNit();
                                            direccion=usu.getDireccion();
                                            correo=usu.getCorreo();
                                            usuario=usu.getUsuario();
                                            estado=usu.getEstado();
                                            dpi=usu.getDpi();
                                            idtipousuario=usu.getTipousuario().getIdtipousuario();
                                            
                                                      ArrayList<Tipousuario> datos3=tipo.getTipousuarioidtipo(idtipousuario);/// consulta bd 
                                                      request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
                                                      ArrayList<Tipousuario> list3 = (ArrayList<Tipousuario>) request.getAttribute("datos3");
                                          
                                                            for(Tipousuario tipou : list3) {  
                                                           nombretipo=tipou.getNombretipo();
                                             %>
                            
                                <tr>     
                                        <td>
                                            
                                            <form action="modificarUsuario.jsp" method="post">
                                                <input type="hidden" name="idusuario" value="<%=idusuario%>" />
                                                <button  type="submit" class="tooltipped" data-position="left" data-tooltip="Editar"><i class="small material-icons">create</button> 
                                            </form>
                                        </td> 
                                    <td><%=nombretipo%></td>    
                                    <td><%=nombre%>&nbsp;<%=apellido%></td>
                                    <td><%=nit%></td>
                                    <td><%=direccion%></td>
                                    <td><%=correo%></td>
                                    <td><%=usuario%></td>
                                    <td><%=estado%></td>
                                    <td><%=dpi%></td>
                                   
                                   
                                    
                           
                                                
                                 </tr>               
                                <%}//tipousuario%> 
                            
                               <%}//usuario%> 
                            
                               <%}//operadorsucursal%> 
                             
                    
              
                                </tbody>
                                
                                
                            </table>
                            </div>
                            </div>
        </div>
	
                </div>
                   
                  
        
        
        
        
        
     
        
    </body>
</html>
