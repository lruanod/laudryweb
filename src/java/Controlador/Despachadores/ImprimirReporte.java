/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.CRUD.DetalleCRUD;
import modelos.CRUD.FacturaCRUD;
import modelos.CRUD.ServiciosCRUD;
import modelos.CRUD.TarifaCRUD;
import modelos.CRUD.UsuarioCRUD;
import modelos.CRUD.UsuariomiembroCRUD;
import modelos.Detalle;
import modelos.Factura;
import modelos.Servicio;
import modelos.Tarifa;
import modelos.Usuario;

/**
 *
 * @author user
 */
public class ImprimirReporte extends HttpServlet {
//xyzImprimirReporte
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
         
       String inicio2=request.getParameter("inicio");
       String fin2=request.getParameter("fin"); 
       String estado=request.getParameter("estado");
       
       Date inicio=null;
       Date fin=null;
       
      try{
     
        SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd");
        inicio=sm.parse(inicio2);
        fin=sm.parse(fin2);
        
        
            
        } catch(ParseException e){
            System.out.println("Error: "+e.getMessage());
        } 
       
        
        
        
         HttpSession session = request.getSession(true);//// recuperando la sesion 
            
        
         response.setContentType("application/pdf");
        OutputStream out =response.getOutputStream();
        try {
       
       // int idsucursal=Integer.parseInt(request.getParameter("idsucursal"));
          int idsucursal=(Integer)session.getAttribute("idsucursal");
        String nitsucursal=(String)session.getAttribute("nit");
        
        String nombresucursal=(String)session.getAttribute("nombresucursal");
                                  
                                    BigDecimal total =null;
                                   
                                    int nofactura=0;
                                    
                                    Date fecha=null;
                                    int idcliente=0;
                                    
                                    int idservicio=0;
                                    int cantidad=0;
                                    BigDecimal subtotal=null;
                                    int idtarifa=0;
                                   
                                    double sumaglobal=0;
                                    double sumadescuento=0;
                                    
                                    String serlavado=null;
                                    BigDecimal tarifaser=null;
                                    BigDecimal recargo=null;
                                    BigDecimal descuento=null;
                                    String nombreser=null;
                                    
                                    String nombre=null;
                                    String apellido=null;
                                    String direccion=null;
                                    String nit=null;
                                    String referencia=null;
                                    String tel=null;
                                    String cel=null;
                                    
                                    DecimalFormat decimales =new DecimalFormat("######.00");
                                    
                                    FacturaCRUD fac=new FacturaCRUD();
                                    DetalleCRUD deta=new DetalleCRUD();
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                                    UsuarioCRUD user=new UsuarioCRUD();
                    
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                  
                                    
 ////////////////  caveza imprimir en pdf////////////////////                                   
                    Document documento = new Document(PageSize.A4.rotate());
                        PdfWriter.getInstance(documento, out);
                           documento.open();// abrir
                      
                         
                    
                           
                    
                    
                 URL resUrl = this.getClass().getResource("mascota.jpg");
                        Image imagenes = Image.getInstance(resUrl);
                                  imagenes.setAbsolutePosition(30f, 470f);
                                    imagenes.scaleToFit(150,150);
                                       documento.add(imagenes);
                     
                                

                         
                        Paragraph nosolicitud = new  Paragraph();
                        Font  fonno = new  Font(Font.FontFamily.HELVETICA,14,Font.BOLD,BaseColor.RED);
                     
                nosolicitud.add(new Phrase("REPORTE"
                        +"\n De FECHA: "+inicio2+"  "
                                + "A  FECHA: "+fin2+"",fonno));
                
                
                nosolicitud.setAlignment(Element.ALIGN_CENTER);
           
                documento.add(nosolicitud);
                     
                     
                     
                     
                     
                     Paragraph par2 = new  Paragraph();
                    
                     Font  fontdescrip = new  Font(Font.FontFamily.TIMES_ROMAN,10,Font.NORMAL,BaseColor.BLACK);// estilo de letra y tamano
                          par2.add(new Phrase (Chunk.NEWLINE));// espacio 
                          par2.add(new Phrase (Chunk.NEWLINE));// espacio 
                          par2.add(new Phrase (Chunk.NEWLINE));// espacio 
                     par2.add(new Phrase("LAUNDRYweb.com.\n"
                             + "Sucursal:"+nombresucursal+"\n"+
                             "NIT:"+nitsucursal+"",fontdescrip));// titulo
                     
                     par2.setAlignment(Element.ALIGN_JUSTIFIED);
                     par2.add(new Phrase (Chunk.NEWLINE));// espacio 
                     documento.add(par2);
                     
                    
                  
                  
                  
                 
                  
                  
                
                                                                                                      
                                    ////////////////   fin caveza     imprimir en pdf////                                                                                              
                                    ArrayList<Factura> datos=fac.getFacturaparareporte(idsucursal,inicio2,fin2,estado);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                                    ArrayList<Factura> list = (ArrayList<Factura>) request.getAttribute("datos");

for(Factura fact : list) {
     double sumatotal=0;
        nofactura=fact.getNofactura();
        recargo=fact.getRecargo();
        total=fact.getTotal();
        fecha=fact.getFecha();
        idcliente=fact.getUsuario().getIdusuario();
        descuento=fact.getDescuento();
        sumadescuento+=descuento.doubleValue();
                                          PdfPTable tabla3 = new PdfPTable (1);
                                          tabla3.setWidthPercentage(20f);              
                                          PdfPCell  celdafecha = new PdfPCell(new Paragraph("FECHA",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                                          tabla3.addCell(celdafecha);
                                          tabla3.setHorizontalAlignment(Element.ALIGN_LEFT);    
       
                                    PdfPTable tabla2 = new PdfPTable (5);                                              
                                    tabla2.setWidthPercentage(100f);     

                                    ArrayList<Usuario> datos5=user.getUsuarioporid(idcliente);/// consulta bd 
                                    request.setAttribute("datos5", datos5);// pasamos los parametros de la consulta                 
                                    ArrayList<Usuario> list5 = (ArrayList<Usuario>) request.getAttribute("datos5");

                                              for(Usuario usua : list5) {
                                                   
                                                  nombre=usua.getNombre();
                                                  apellido=usua.getApellido();
                                                  referencia=usua.getDescripcionCasa();
                                                  nit=usua.getNit();
                                                  direccion=usua.getDireccion();
                                                  tel=usua.getTel();
                                                  cel=usua.getCel();
 Paragraph par3 = new  Paragraph();
                             Font  linea1 = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLACK);// estilo de letra y tamano
                     
                    
                                        
par3.add(new Phrase("------------------------------------------------------------------------------------------------------------------------------------------------",linea1));// titulo
                     
                             documento.add(par3);   
                             
                             
             Paragraph nofactu = new  Paragraph();
                        Font  fonno2 = new  Font(Font.FontFamily.HELVETICA,14,Font.BOLD,BaseColor.RED);
                     
                nofactu.add(new Phrase("Factura No."+nofactura+"",fonno2));
                
                nofactu.add(new Phrase (Chunk.NEWLINE));// espacio
                 nofactu.add(new Phrase (Chunk.NEWLINE));// espacio
                nofactu.setAlignment(Element.ALIGN_CENTER);
           
                documento.add(nofactu);               
                
                
                             
                                           tabla3.addCell(""+fm.format(fecha)+"");
                                           documento.add(tabla3);        
                                                                          
                       Paragraph par5 = new  Paragraph();
                       par5.add(new Phrase (Chunk.NEWLINE));// espacio
                      
                       
                       documento.add(par5);                                  
                                            
           PdfPTable tabla = new PdfPTable (3);
                     tabla.setWidthPercentage(70f);
                  
                      
                      PdfPCell  celda2 = new PdfPCell(new Paragraph("CLIENTE",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                      PdfPCell  celda3 = new PdfPCell(new Paragraph("NIT",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK))); 
                      PdfPCell  celda6 = new PdfPCell(new Paragraph("DIRECCION",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                   
                      
                        tabla.addCell(celda2);
                        tabla.addCell(celda3);
                        tabla.addCell(celda6);
                     
                                            
                                              tabla.addCell(""+nombre+" "+apellido+"");
                                              tabla.addCell(""+nit+"");
                                              tabla.addCell(""+direccion+"");
                                              
                                               tabla.setHorizontalAlignment(Element.ALIGN_LEFT);
                                             
                                                                              documento.add(tabla);       
                                                  
                                     
                                                                                               
       
            
                                                         
                     Paragraph detalle = new  Paragraph();      
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
                     documento.add(detalle);// AGREGA AL DOCUMENTO                                          
                                                                        
                                                                    
                             
                                                                 
                                                                    
                                                        
                                                                    
                      PdfPCell  celda21 = new PdfPCell(new Paragraph("CANTIDAD",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                  
                      PdfPCell  celda22 = new PdfPCell(new Paragraph("SERVICIO",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                      
                      
                      PdfPCell  celda23 = new PdfPCell(new Paragraph("TIPO DE SERVICIO",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                       
                       
                      PdfPCell  celda24 = new PdfPCell(new Paragraph("TARIFA",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                       
                      PdfPCell  celda25 = new PdfPCell(new Paragraph("TOTAL",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
             
                     
                     
                     
                      tabla2.addCell(celda21);
                       tabla2.addCell(celda22);
                        tabla2.addCell(celda23);
                         tabla2.addCell(celda24);
                          tabla2.addCell(celda25);
                          
            ArrayList<Detalle> datos2=deta.getDetalleporidfact(nofactura);/// consulta bd 
            request.setAttribute("datos2", datos2);// pasamos los parametros de la consulta                 
            ArrayList<Detalle> list2 = (ArrayList<Detalle>) request.getAttribute("datos2");
        
                    
                     
            
            
            
            
              for(Detalle detall : list2) { 
                  cantidad=detall.getCantidad();
                  idtarifa=detall.getIdtarifa();
                  subtotal=detall.getSubtotal();
                  sumatotal+=subtotal.doubleValue();
                  sumaglobal+=subtotal.doubleValue();
                            
                             
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
                                      
                                                                    
 
                                                                                    } //servicio
                                           
                                           
                                                              }//tarifa
                             
                  
                         
                                  tabla2.addCell(""+cantidad+""); 
                                  tabla2.addCell(""+nombreser+""); 
                                  tabla2.addCell(""+serlavado+""); 
                                  tabla2.addCell(""+tarifaser+""); 
                                  tabla2.addCell(""+subtotal+""); 
                                    
                                  
                                  
                                  
                                                          
                  
                                           
                                            }//detalle  
        
                                                 } ///usuario  

                          documento.add(tabla2);      



///////////////
                  PdfPTable tabla5 = new PdfPTable (2);
                  tabla5.setWidthPercentage(40f);
              
                       tabla5.addCell("Sub Total"); 
                       tabla5.addCell(""+decimales.format(sumatotal)+""); 
                       tabla5.addCell("(+) Recargo"); 
                       tabla5.addCell(""+recargo+""); 
                       tabla5.addCell("(-) Descuento"); 
                       tabla5.addCell(""+descuento+""); 
                       tabla5.addCell("Total"); 
                       tabla5.addCell(""+total+""); 
                       
                      tabla5.setHorizontalAlignment(Element.ALIGN_RIGHT);                                                                                     
                      documento.add(tabla5); 

////////////


                       
                   
                        
                     





}///factura  
                                 
           Paragraph detalle = new  Paragraph();
                     Font  fondetalle = new  Font(Font.FontFamily.HELVETICA,12,Font.BOLD,BaseColor.BLACK);// estilo de letra y tamano
                     
                           
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
                             
                     
                     detalle.add(new Phrase("-------------------------------------------------------------------------------------------Balance------------------------------------------------------------------------------------------",fondetalle));// titulo
                     
                     detalle.setAlignment(Element.ALIGN_CENTER);
                     
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
                   
                     
                     documento.add(detalle);// AGREGA AL DOCUMENTO                                          
                                                                        
                      
                
                  PdfPTable tabla6 = new PdfPTable (2);
                  tabla6.setWidthPercentage(70f);
                                                                   
                      PdfPCell  celda211 = new PdfPCell(new Paragraph("Descuentos de membresía",FontFactory.getFont("Arial",14,Font.BOLD,BaseColor.BLACK)));
                  
                      PdfPCell  celda222 = new PdfPCell(new Paragraph("Pagos netos",FontFactory.getFont("Arial",14,Font.BOLD,BaseColor.BLACK)));
              
                       tabla6.addCell(celda211);
                       tabla6.addCell(celda222);
                       
                        tabla6.addCell(""+decimales.format(sumadescuento)+""); 
                        tabla6.addCell(""+decimales.format(sumaglobal)+""); 
                     
                       
                      tabla6.setHorizontalAlignment(Element.ALIGN_CENTER);                                                                                     
                      documento.add(tabla6);      
                     
                       
                       
                     
                     documento.close();  /// cerrar
                     
                                    } catch (DocumentException ex) {
                                                    Logger.getLogger(ImprimirSolicitud.class.getName()).log(Level.SEVERE, null, ex);
                                                                    }
                
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
