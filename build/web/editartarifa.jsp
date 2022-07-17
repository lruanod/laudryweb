

<%@page import="modelos.Categorias"%>
<%@page import="modelos.CRUD.CategoriasCRUD"%>
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
        
         <!-- para validar sesion--> 
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
        
        
        <!-- aviso de cerrda la sesion-->  
          <%  String  exito = request.getParameter("exito");  if(exito !=null){ %>
        
        <script type="text/javascript">
            $(document).ready(function(){
             
             Materialize.toast('La operación fue realizada con exito &nbsp;&nbsp;<a href="validarmembrecias.jsp">OK</a>',9000, 'rounded');
             
            });
        </script>
        
        <%  } %>
        
        
        
        
        <title>Editar tarifa</title>
    </head>
    <body>
       
	<nav class="NavBar full">
		<div class="row">
			<div class="tittles NavBar-logo col s12 m3">LAUNDRYweb.com/Administrador</div>
			<ul class="NavBar-links col m9">
				<li><a href="interfazadmin.jsp" class="waves-effect">Home</a></li>
                                <li><a href="AdministrarTarifario.jsp" class="waves-effect">Administrar productos</a></li>
				
				
				
			</ul>
			<i class="zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect"></i>
		</div>
	</nav>
	   <h5 class="tittles center-align">editando tarifa</h5>
		<div class="container valign">
			<div class="row">
              
                       <%     
                                  
                                    int idservicio=0;
                                    int idcategoria=0;
                                    int idtarifa=0;
                                    String serlavado=null;
                                    BigDecimal tarifaser=null;
                                    String nombreser=null;
                                    String descripcion=null;
                                    String url=null;
                                    String estado=null;
                                    String nombrecate=null;
                                    
                                    
                                    
                                    
                                   
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                                    CategoriasCRUD ca=new CategoriasCRUD();

                               %>
                
               
                
               
                     </br> <div class="z-depth-3" style="border-style:ridge; border-width: 20px; border-color: grey lighten-4">
                                
                                  </br>
                                 
                                                  
                           
                                                                 
        <%
               
            int idtarifa2=Integer.parseInt(request.getParameter("idtarifa"));   
                              
                         ArrayList<Tarifa> datos4=tari.getTarifaporid(idtarifa2);/// consulta bd 
                         request.setAttribute("datos4", datos4);// pasamos los parametros de la consulta                 
                         ArrayList<Tarifa> list4 = (ArrayList<Tarifa>) request.getAttribute("datos4");
        
                                  for(Tarifa tarif : list4) {  
                                           idservicio=tarif.getServicio().getIdservicio();
                                           serlavado=tarif.getNombreser();
                                           tarifaser=tarif.getTarifaSer();
                                           idtarifa=tarif.getIdtarifa();
                                      
                                           
                                               ArrayList<Servicio> datos3=ser.getServicioporid(idservicio);/// consulta bd 
                                               request.setAttribute("datos3", datos3);// pasamos los parametros de la consulta                 
                                               ArrayList<Servicio> list3 = (ArrayList<Servicio>) request.getAttribute("datos3");
                          
                                                        for(Servicio servi : list3) {
                                                                      
                                                                    nombreser=servi.getNombreSer(); 
                                                                    descripcion=servi.getDescripcionSer();
                                                                    url=servi.getUrl();
                                                                    estado=servi.getEstado();
                                                                    idcategoria=servi.getCategorias().getIdcategorias();
        


                                                               ArrayList<Categorias> datos5=ca.getCategoriasporid(idcategoria);/// consulta bd 
                                                               request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta                 
                                                               ArrayList<Categorias> list5 = (ArrayList<Categorias>) request.getAttribute("datos5");
                          
                                                                           for(Categorias cate : list5) {
                                                                               
                                                                                    nombrecate=cate.getCategoria();



        
        %>
                                                                    
                                      
                                    
                                    <form method="post" action="xyzEditarTarifa">
                                       
                                        
                                        <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-movie prefix"></i>
					<input id="Servicio" type="text" class="validate" name="Servicio" disabled value="<%=nombreser%>" >
                                        <label for="Servicio"><font size=3 color="blue">Servicio</font></label>
                                        
				        </div>
                                        
                                        <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-library prefix"></i>
					<input id="descripcion" type="text" class="validate" name="descripcion" value="<%=descripcion%>"  pattern="[A-Z,a-z,áéíóú,ÁÉÍÓÚ, ,Ññ,0-9,(),.]{4,100}"  title="Ingresar letras y numeros solo adminte símbolos especiales () y ." required="">
					<label for="descripcion"><font size=3 color="blue">Descripción del servicio</font></label>
                                        
				        </div>
                                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=3 color="blue">Cargar imagen</font></label>
                                        <div class="file-field input-field col s12">
                                            
					
                                            <div class="btn btn-floating btn-small pulse" style='width: 47px; height: 40px'>
                                                <span><i class="zmdi zmdi-image prefix"></i></span>
                                                <input   type="file">
                                                 
                                                </div>
                                        
                                        <div class="file-path-wrapper">
                                            <input  class="file-path validate" type="text" name="url" value="<%=url%>">
                                           
                                        </div>
				        </div>
                                            
                                    <div class="input-field  col s12">
                                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=3 color="blue">Estado   (anterior:  <%=estado%>)</font></label>
                                        </br>
                                        <p>
                                            <input name="estado" type="radio"  value="ACTIVO" checked=""  id="ACTIVO" />
                                             <label for="ACTIVO"><font size=3 color="black">ACTIVO</font></label>
				        </p>
                                        
                                        <p>
				      	     <input name="estado" type="radio"  value="INACTIVO"   id="INACTIVO" />
                                             <label for="INACTIVO"><font size=3 color="black">INACTIVO</font></label>
				        </p>
                                    </div>     
                                        
                                        
                                        
                                        
                           <%       
                             
                              ArrayList<Categorias> datos7=ca.getCategorias();
                             
                           
                              request.setAttribute("datos7", datos7);// pasamos los parametros de la consulta
                            
                            %>
                                           
                            <div class="input-field col s12">
                                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=3 color="blue">Categorias   (anterior:  <%=nombrecate%>)</font></label>
                                        </br>
                                        <c:forEach items="${datos7}" var="dato7">   
                                        <p>
                                            <input name="idcategoria" type="radio" checked="" value="<c:out value="${dato7.getIdcategorias()}" />"   id="<c:out value="${dato7.getIdcategorias()}" />" />
                                             <label for="<c:out value="${dato7.getIdcategorias()}" />"><font size=3 color="black"><c:out value="${dato7.getCategoria()}" /></font></label>
				        </p>
                                         </c:forEach> 
                                    
                                        </br>      
                            </div>
                           
                            
                            
                            
                                        <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-local-laundry-service prefix"></i>
                                        <input id="Serviciolavado" type="text" class="validate" name="Serviciolavado"  value="<%=serlavado%>">
                                        <label for="Serviciolavado"><font size=3 color="blue"> Tipo de servicio (anterior: <%=serlavado%>)</font></label>
                                        
				        </div>
                                        
                                        
                                         <div class="input-field col s12">
                                            
					<i class="zmdi zmdi-money prefix"></i>
                                        <input id="Tarifa" type="number" class="validate" name="tarifa" value="<%=tarifaser%>" checked="">
                                        <label for="Tarifa"><font size=3 color="blue">Tarifa (anterior :Q<%=tarifaser%>)</font> </label>
                                        
				        </div>
                                        
                                        <input  type="hidden" name="idtarifa" value="<%=idtarifa%>">
                                        <input  type="hidden" name="idservicio" value="<%=idservicio%>">
                                                                        
                            <center>
                                  <button  type="submit"  class="tooltipped" data-position="right" data-tooltip="Guardar"><i class="small material-icons">save</i> </button>
                            </center>                                  
                                    </form>
                                 
                                                                    <%    }//categoria
                                                                        }//servicio
                                                                   
                                                              }//tarifa %>
                             
                  
                         
                                  
                  
                                           
                                           
                                
     </br>                          
        
   
                                      
              
                           
                         
                              
                            
                                
                             
                    
                      
                         
               
	
                       </div>
                        </div>
                </div>
                 
        
        
        
        
        
     
        
    </body>
</html>

