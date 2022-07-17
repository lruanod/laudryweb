package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelos.CRUD.UsuariomiembroCRUD;
import java.math.BigDecimal;
import modelos.CRUD.UsuarioCRUD;
import modelos.CRUD.DepartamentosCRUD;
import modelos.CRUD.MunicipiosCRUD;
import java.util.Iterator;
import modelos.*;
import modelos.CRUD.SucursalCRUD;
import modelos.Tarifa;
import modelos.CRUD.TarifaCRUD;
import modelos.Servicio;
import java.util.Map;
import modelos.CRUD.ServiciosCRUD;
import classes.Articulo;
import java.util.ArrayList;

public final class laundryweb_005fcom_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
  HttpSession sesion = request.getSession(true);//// recuperando la sesion 

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
       // si la varible sesion  ya tiene una variable llamada cesta en caso de que no  se crea un nuevo array list si ya exite se recupera   
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\r\n");
      out.write("        <script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js\"></script>\r\n");
      out.write("\t<script>window.jQuery || document.write('<script src=\"js/jquery-1.11.2.min.js\"><\\/script>');</script>\r\n");
      out.write("\t<script src=\"js/materialize.min.js\" ></script>\r\n");
      out.write("\t<script src=\"js/main.js\" ></script>\r\n");
      out.write("        <script src=\"js/validar.js\" ></script>\r\n");
      out.write("        <script src=\"js/validarcambiopass.js\" ></script>\r\n");
      out.write("         ");
 if(session.getAttribute("idsucursal")!=null) {
      out.write("\r\n");
      out.write("         <script type=\"text/javascript\">\r\n");
      out.write("         location.href =\"home?errorsesion=errorsesion\";\r\n");
      out.write("         </script> \r\n");
      out.write("         ");
}
      out.write("\r\n");
      out.write("           \r\n");
      out.write("        <!-- para validar sesion--> \r\n");
      out.write("         ");
 if(session.getAttribute("idusuario")==null) {
      out.write("\r\n");
      out.write("         <script type=\"text/javascript\">\r\n");
      out.write("         location.href =\"home?errorsesion=errorsesion\";\r\n");
      out.write("         </script> \r\n");
      out.write("         ");
}
      out.write("\r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("        <!-- para activar sidenav derecho--> \r\n");
      out.write("         <script type=\"text/javascript\">\r\n");
      out.write("            $(document).ready(function(){\r\n");
      out.write("        \r\n");
      out.write("                  $(\"#barra\").sideNav();\r\n");
      out.write("              });       \r\n");
      out.write("         </script>    \r\n");
      out.write("         \r\n");
      out.write("         <script type=\"text/javascript\">\r\n");
      out.write("             $(document).ready(function(){\r\n");
      out.write("        $(\"#enlace\").trigger('click');\r\n");
      out.write("            \r\n");
      out.write("                                         });\r\n");
      out.write("        \r\n");
      out.write("        </script>\r\n");
      out.write("       \r\n");
      out.write("       \r\n");
      out.write("       <script type=\"text/javascript\">\r\n");
      out.write("             $(document).ready(function(){\r\n");
      out.write("        $(\"select\").material_select();\r\n");
      out.write("            \r\n");
      out.write("                                         });\r\n");
      out.write("        \r\n");
      out.write("        </script>\r\n");
      out.write("        \r\n");
      out.write("         <!-- aviso de cerrda la sesion-->  \r\n");
      out.write("          ");
  String  exito = request.getParameter("exito");  if(exito !=null){ 
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            $(document).ready(function(){\r\n");
      out.write("             \r\n");
      out.write("             Materialize.toast('Su pedido fue Realizado con Exito',4000, 'rounded');\r\n");
      out.write("             \r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        \r\n");
      out.write("        ");
  } 
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("         \r\n");
      out.write(".errores{\r\n");
      out.write("    -webkit-boxshadow: 0 0 10px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    -o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    border-radius:10px;\r\n");
      out.write("    -webkit-border-radius: 10px;\r\n");
      out.write("    background: red;\r\n");
      out.write("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);\r\n");
      out.write("    color: #fff;\r\n");
      out.write("    display: none;\r\n");
      out.write("    font-size: 12px;\r\n");
      out.write("    margin-top: -40px;\r\n");
      out.write("    margin-left: 250px;\r\n");
      out.write("    padding: 10px;\r\n");
      out.write("    position: absolute;\r\n");
      out.write("}\r\n");
      out.write(".errores:before{ /* Este es un truco para crear una flechita */\r\n");
      out.write("    content: '';\r\n");
      out.write("    border-top: 8px solid transparent;\r\n");
      out.write("    border-bottom: 8px solid transparent;\r\n");
      out.write("    border-right: 8px solid #BC1010;\r\n");
      out.write("    border-left: 8px solid transparent;\r\n");
      out.write("    left: -16px;\r\n");
      out.write("    position: absolute;\r\n");
      out.write("    top: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("     </style>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <title>Pedido</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("     \r\n");
      out.write("                               ");
      out.write("\r\n");
      out.write("                                                        \r\n");
      out.write("                               <form id=\"cambiodepassModal\" class=\"modal modal-fixed-footer\" method=\"post\" action=\"xyzcambiopasscli\">\r\n");
      out.write("\t\t<div class=\"modal-content\">\r\n");
      out.write("\t\t\t<h5 class=\"center-align\">Login</h5>\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("                          \r\n");
      out.write("                            \r\n");
      out.write("                                <input  id=\"idusuario\" name=\"idusuario\" type=\"hidden\" value=\"");
      out.print(session.getAttribute("usuario"));
      out.write("\">\r\n");
      out.write("                            \r\n");
      out.write("                                <div class=\"input-field col s12\">\r\n");
      out.write("\t\t\t\t\t<i class=\"zmdi zmdi-lock prefix\"></i>\r\n");
      out.write("\t\t\t\t\t<input id=\"pass2\" type=\"password\" class=\"validate\"  name=\"pass2\" onkeyup=\"muestra_seguridad_pass(this.value, this.form)\" minlength=\"5\" required/>\r\n");
      out.write("                                        &nbsp;<i>seguridad:</i> <input name=\"seguridad\" type=\"text\" style=\"border: 0px; background-color:ffffff; text-decoration:italic;\" onfocus=\"blur()\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("                                        <label for=\"pass2\">Contraseña</label>\r\n");
      out.write("                                        \r\n");
      out.write("                                        \r\n");
      out.write("                                        \r\n");
      out.write("                                        </div>\r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                            <div class=\"input-field col s12\">\r\n");
      out.write("\t\t\t\t\t<i class=\"zmdi zmdi-lock prefix\"></i>\r\n");
      out.write("\t\t\t\t\t<input id=\"repass2\" type=\"password\" class=\"validate\"  name=\"repass2\">\r\n");
      out.write("\t\t\t\t\t<label for=\"repass2\"> Escribe nuevamente la Contraseña</label>\r\n");
      out.write("                                        \r\n");
      out.write("                                         <div id=\"mensaje4\" class=\"errores\"> La Contraseña no concide</div>\r\n");
      out.write("                                        \r\n");
      out.write("                            </div>\r\n");
      out.write("                            \r\n");
      out.write("                        \r\n");
      out.write("                        \r\n");
      out.write("                        </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"modal-footer\">\r\n");
      out.write("                    \r\n");
      out.write("                    \r\n");
      out.write("                    <button  id=\"boton2\" type=\"submit\"  class=\"waves-effect btn-flat tooltipped\" data-position=\"top\" data-tooltip=\"Enviar\"><i class=\"zmdi zmdi-mail-send\"></i> </button>\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("                        <a href=\"#!\"class=\"modal-action modal-close waves-effect btn-flat tooltipped\" data-position=\"top\" data-tooltip=\"Cerrar\"><i class=\"zmdi zmdi-close\"></i></a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("                           \r\n");
      out.write("    </form>                            \r\n");
      out.write("                               \r\n");
      out.write("                                \r\n");
      out.write("        ");
  if(session.getAttribute("usuario")!=null)   {
      out.write(" \r\n");
      out.write("                   ");
      out.write("    \r\n");
      out.write("  <ul id=\"slide-out\" class=\"side-nav\">\r\n");
      out.write("    <li style=\"background-color:#03a9f4;\"><div class=\"user-view\">\r\n");
      out.write("            \r\n");
      out.write("        <div class=\"center-align\">\r\n");
      out.write("            \r\n");
      out.write("            <a href=\"#!user\"><img class=\"circle\" src=\"assets/img/sale4.jpg\"></a>\r\n");
      out.write("           \r\n");
      out.write("      \r\n");
      out.write("            </br>\r\n");
      out.write("            </br>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("           <p style=\"line-height:10px;\"> <i class=\"small material-icons\">child_care</i></p>\r\n");
      out.write("              \r\n");
      out.write("           <p style=\"line-height:10px;\"><span class=\"white-text name\" >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.nombre}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></p>\r\n");
      out.write("           <p style=\"line-height:10px;\"><span class=\"white-text name\" >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.apellido}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></p>\r\n");
      out.write("          \r\n");
      out.write("           \r\n");
      out.write("           <p style=\"line-height:10px;\">   <i class=\"small material-icons\">mail</i> </p>\r\n");
      out.write("           <p style=\"line-height:5px;\"><span class=\"white-text email\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.correo}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></p>\r\n");
      out.write("            \r\n");
      out.write("           <P style=\"line-height:5px;\"></br></p>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("            \r\n");
      out.write("    </div></li>\r\n");
      out.write("    \r\n");
      out.write("  \r\n");
      out.write("    <li><a href=\"membrecia.jsp\">Membresías</a></li>\r\n");
      out.write("    <li><div class=\"divider\"></div></li>\r\n");
      out.write("    <li><a class=\"waves-effect\" href=\"estadopedido.jsp\">Mis pedidos</a></li>\r\n");
      out.write("   \r\n");
      out.write("    <li><div class=\"divider\"></div></li>\r\n");
      out.write("    <li><a href=\"#cambiodepassModal\" class=\"waves-effect modal-trigger\" >Cambiar contraseña</a></li>\r\n");
      out.write("    <li><div class=\"divider\"></div></li>\r\n");
      out.write("    <li><a class=\"waves-effect\" href=\"actualizarinfo.jsp\">Actualizar dirección</a></li>\r\n");
      out.write("    <li><div class=\"divider\"></div></li>\r\n");
      out.write("    \r\n");
      out.write("    <li><a class=\"waves-effect\" id=\"cerraruser\" href=\"xyzCerrarSesion\">Cerrar sesión</a></li>\r\n");
      out.write("    <li><div class=\"divider\"></div></li>\r\n");
      out.write("    \r\n");
      out.write("    </ul>\r\n");
      out.write("\r\n");
      out.write("                   ");
      out.write("    \r\n");
      out.write("                          \r\n");
      out.write("                   ");
}
      out.write("\r\n");
      out.write("     \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write(" \r\n");
      out.write("   \r\n");
      out.write("   \r\n");
      out.write("\t<nav class=\"NavBar full\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"tittles NavBar-logo col s12 m3\">LAUNDRYweb.com</div>\r\n");
      out.write("\t\t\t<ul class=\"NavBar-links col m9\">\r\n");
      out.write("\t\t\t\t<li><a href=\"home\" class=\"waves-effect\">Home</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"productos\" class=\"waves-effect\">Servicios</a></li>\r\n");
      out.write("\t\t\t\t ");
 if(session.getAttribute("idusuario")!=null) {
      out.write("\r\n");
      out.write("                                <li>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.usuario}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(":<a href=\"#\"  data-activates=\"slide-out\" class=\"waves-effect\" id=\"barra\"><i class=\"material-icons\">person</i></a></li>\r\n");
      out.write("                               \t");
}
      out.write("\r\n");
      out.write("                               \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<i class=\"zmdi zmdi-more-vert full btn-menu hide-on-med-and-up waves-effect\"></i>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t\r\n");
      out.write("                   <h5 class=\"tittles center-align\">error al procesar el pago</h5>\r\n");
      out.write("                    \r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col s12  m40\">\r\n");
      out.write("                                    <div class=\"card hoverable\">\r\n");
      out.write("\t\t\t\t\t<figure>\r\n");
      out.write("                                            \r\n");
      out.write("                                            \r\n");
      out.write("                                            \r\n");
      out.write("                                            \r\n");
      out.write("\t\t\t\t\t\t<img src=\"assets/img/mascotamejorada2.jpg\"  alt=\"Header\" class=\"responsive-img center-box\">\r\n");
      out.write("                                                \r\n");
      out.write("                                                \r\n");
      out.write("                                                \r\n");
      out.write("                                                \r\n");
      out.write("                                                \r\n");
      out.write("\t\t\t\t\t</figure>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("                                            \r\n");
      out.write("                                            \r\n");
      out.write("\t                        \r\n");
      out.write("                        </div>\r\n");
      out.write("               \r\n");
      out.write("                </div>\r\n");
      out.write("               \r\n");
      out.write("               \r\n");
      out.write("               \r\n");
      out.write("               \r\n");
      out.write("               \r\n");
      out.write("        \r\n");
      out.write("        <footer class=\"footer\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col s12 m6\">\r\n");
      out.write("\t\t\t\t\t<h5>Profesionalismo</h5>\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\tNos esforzamos con los más altos estándares en nuestro trabajo y conducta, y continuamente aprendemos a mejorar nuestro conocimiento.\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col s12 m6\">\r\n");
      out.write("\t\t\t\t\t<h5 class=\"center-align\">Buscanos en:</h5>\r\n");
      out.write("\t\t\t\t\t<ul class=\"center-align\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#!\"><i class=\"zmdi zmdi-facebook\"></i> &nbsp; Facebook</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#!\"><i class=\"zmdi zmdi-twitter\"></i> &nbsp; Twitter</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#!\"><i class=\"zmdi zmdi-google-plus\"></i> &nbsp; Google+</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#!\"><i class=\"zmdi zmdi-instagram\"></i> &nbsp; Instagram</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col s12 tittles footer-copyright\">LAUNDRYWEB.COM &copy; 2017</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</footer>\r\n");
      out.write("        \r\n");
      out.write("               <script src=\"js/cesta.js\" type=\"text/javascript\"></script>\r\n");
      out.write("               \r\n");
      out.write("         <script type=\"text/javascript\">\r\n");
      out.write("                $(function(){\r\n");
      out.write("    \r\n");
      out.write("                            $('tr #deleteitem').click(function(){\r\n");
      out.write("                                  alert(\"Desea eliminar de la cesta\");\r\n");
      out.write("                                              location.reload();\r\n");
      out.write("        \r\n");
      out.write("                                                                });\r\n");
      out.write("                                                                \r\n");
      out.write("                                                                \r\n");
      out.write("                             $('#2').click(function(){\r\n");
      out.write("                                \r\n");
      out.write("                                              location.reload();\r\n");
      out.write("        \r\n");
      out.write("                                                                });                 \r\n");
      out.write("                                                                \r\n");
      out.write("                                                                \r\n");
      out.write("                                                                \r\n");
      out.write("                            });\r\n");
      out.write("                   \r\n");
      out.write("         </script>\r\n");
      out.write("                   \r\n");
      out.write("  \r\n");
      out.write("       \r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
