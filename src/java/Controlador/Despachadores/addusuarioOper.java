/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.CRUD.MunicipiosCRUD;
import modelos.CRUD.OperadorSucursalCRUD;
import modelos.CRUD.SucursalCRUD;
import modelos.CRUD.TipousuarioCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.Municipio;
import modelos.Operadorsucursal;
import modelos.Sucursal;
import modelos.Tipousuario;
import modelos.Usuario;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author user
 */
public class addusuarioOper extends HttpServlet {
    //xyzaddusuarioOper
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
       
        HttpSession session = request.getSession(true);
        int idsucursal=(Integer)session.getAttribute("idsucursal");
        String nombre= request.getParameter("nombre"); 
        String apellido=request.getParameter("apellido");
        String direccion=request.getParameter("direccion");
        String usuario =  request.getParameter("usuario");
        String descripcioncasa=request.getParameter("descripcion_casa");
        String clavesha1 =request.getParameter("pass");
        String clave=DigestUtils.sha1Hex(clavesha1);
        String estado="PENDIENTE";
        String correo=request.getParameter("correo");
        String tel= request.getParameter("tel");
        String cel= request.getParameter("cel");
        String dpi=request.getParameter("dpi");
        String nit=request.getParameter("nit");
        
        int idmunicipio=Integer.parseInt(request.getParameter("idmunicipio"));
      
      
        int idtipousuario=Integer.parseInt(request.getParameter("idtipousuario"));
        
           
           OperadorSucursalCRUD opersu=new OperadorSucursalCRUD();
           SucursalCRUD su=new SucursalCRUD();
           Sucursal sucursal=su.getSucursalPorId(idsucursal);
           MunicipiosCRUD municru=new MunicipiosCRUD();
           TipousuarioCRUD tipo=new TipousuarioCRUD();
           Municipio municipio =municru.getMunicipioPorIdclas(idmunicipio);
           Tipousuario tipousuario=tipo.getTipousuarioPorId(idtipousuario);
           UsuarioCRUD op=new UsuarioCRUD();
           
           ArrayList<Usuario> datos=op.getUsuarioporcorreo(correo,usuario);/// consulta bd 
                   request.setAttribute("datos", datos);// pasamos los parametros de la consulta
                                                     
         int idusuario=0;  
                         
                                                 // retrieve your list from the request, with casting 
ArrayList<Usuario> list = (ArrayList<Usuario>) request.getAttribute("datos");

// print the information about every category of the list
  
        if (list.isEmpty()){
        
           boolean status = true;
           String cuentaexito="exito";

            // enter here the smtp mail server address
            // ask your ISP to get the proper name
            String mailServer ="smtp.gmail.com";
            String username="luisempornac@gmail.com";
            String password="enrique92";

            
     
        
         
        
        
           String fromEmail = username;
                                                                                                                                                                                         //id               
          
        
           
            try {

                Properties props = new Properties();
                props.put("mail.smtps.host", mailServer);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtps.port", "465");
                props.put("mail.smtps.STARTTLS.enable", true);

                Session s = Session.getInstance(props, null);

                MimeMessage message = new MimeMessage(s);

                InternetAddress from = new InternetAddress(fromEmail);
                message.setFrom(from);

                InternetAddress to = new InternetAddress(correo);

                message.addRecipient(Message.RecipientType.TO, to);

                message.setSubject("[Bienvenido Usuario]");
                //message.setText(messageEnter);
                
               
                // agregamos usuario
                op.addUsuario(new Usuario(municipio, tipousuario, nombre, apellido, nit, direccion, descripcioncasa, correo, usuario, clave, estado, tel, cel, dpi));
               
                ArrayList<Usuario> datos2=op.getUsuarioporcorreo(correo,usuario);/// consulta bd 
                request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta
                                                     
                                      
                                                 // retrieve your list from the request, with casting 
        ArrayList<Usuario> list2 = (ArrayList<Usuario>) request.getAttribute("datos2");
        
        for(Usuario usu : list2) { 
        
            idusuario=usu.getIdusuario();
           
            Usuario usuario2=op.getUsuarioPorIdunion(idusuario);
            opersu.addOperadorsucursal(new Operadorsucursal(sucursal,usuario2)); 
          
        }
        
                
                 String messageEnter = "Bienvenido Nuevo usuario =). Para validar su correo, haga click aquí en validar: </br> "
                         + "<form  action=\"http://localhost:8080/Laudry-hibernate_2/xyzvalidarUserOper\"  method=\"POST\">\n" +
"            \n" +
"            <input type=\"hidden\" name=\"id\" value=\""+idusuario+"\">\n" +
"            \n" +
"            <input type=\"submit\" value=\"validar\">\n" +
"                   \n" +
"        </form>\n" +
"        ";
                
                
                
                message.setContent(messageEnter, "text/html");

                Transport tr = s.getTransport("smtps");
                tr.connect(mailServer, username, password);

                message.saveChanges(); // don't forget this
                tr.sendMessage(message, message.getAllRecipients());
                tr.close();

            } catch (MessagingException e) {
                System.out.println(e.getMessage());
                String novalido ="novalido";
             
                response.sendRedirect(request.getContextPath()+"/usuariosOperador.jsp?novalido="+novalido+"");  
                status = false;
            }
            
            
            
         if (status == true) {
            
            
            response.sendRedirect(request.getContextPath()+"/usuariosOperador.jsp?exito2="+cuentaexito+"");  
            
            
            }
                 
           
              
               
        }
             
    
        else {
            
            String repetido ="repedito";
            response.sendRedirect(request.getContextPath()+"/usuariosOperador.jsp?repetido="+repetido+"");
        
             }
      
      
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
