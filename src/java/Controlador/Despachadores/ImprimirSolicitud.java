/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Despachadores;

import com.itextpdf.text.BadElementException;
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
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.*;
import modelos.CRUD.*;


/**
 *
 * @author user
 */
public class ImprimirSolicitud extends HttpServlet {
//xyzImprimirSolicitud
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
            throws ServletException, IOException{
    
         
                                   
     
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
        
         response.setContentType("application/pdf");
        OutputStream out =response.getOutputStream();
        try {
        int nofactura2=Integer.parseInt(request.getParameter("nofactura"));                          
                                  
                                    BigDecimal total =null;
                                   
                                    int nofactura=0;
                                    
                                    Date fecha=null;
                                    int idcliente=0;
                                    
                                    int idservicio=0;
                                    int cantidad=0;
                                    BigDecimal subtotal=null;
                                    int idtarifa=0;
                                    
                                    String serlavado=null;
                                    BigDecimal tarifaser=null;
                                    
                                    String nombreser=null;
                                    
                                    String nombre=null;
                                    String apellido=null;
                                    String direccion=null;
                                    String nit=null;
                                    String referencia=null;
                                    String tel=null;
                                    String cel=null;
                                    
                                    
                                    
                                    FacturaCRUD fac=new FacturaCRUD();
                                    DetalleCRUD deta=new DetalleCRUD();
                                    ServiciosCRUD ser=new ServiciosCRUD();
                                    TarifaCRUD tari=new TarifaCRUD();
                                    UsuarioCRUD user=new UsuarioCRUD();
                    
                                    SimpleDateFormat fm=new SimpleDateFormat("dd-LL-yyyy");
                                  
                                    
 ////////////////  caveza imprimir en pdf////////////////////                                   
                    Document documento = new Document();
                        PdfWriter.getInstance(documento, out);
                           documento.open();// abrir
                      
                          Paragraph par3 = new  Paragraph();
                             Font  linea1 = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLACK);// estilo de letra y tamano
                     
                    
                                        
par3.add(new Phrase("--------------------------------------------------------------------------------------------------",linea1));// titulo
                     
                             documento.add(par3);
                    
                           
                    
                    
                 URL resUrl = this.getClass().getResource("mascota.jpg");
                        Image imagenes = Image.getInstance(resUrl);
                                  imagenes.setAbsolutePosition(50f, 720f);
                                    imagenes.scaleToFit(70,70);
                                       documento.add(imagenes);
                     
                                

                         
                        Paragraph nosolicitud = new  Paragraph();
                        Font  fonno = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.RED);
                     
                nosolicitud.add(new Phrase("No."+nofactura2+"",fonno));
                
                nosolicitud.setAlignment(Element.ALIGN_RIGHT);
                
                documento.add(nosolicitud);
                     
                     
                     
                     Paragraph par1 = new  Paragraph();
                     Font  fonttitulo = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE);// estilo de letra y tamano
                     
                           
                     par1.add(new Phrase (Chunk.NEWLINE));// espacio 
                             
                     par1.add(new Phrase (Chunk.NEWLINE));// espacio 
                     
                     par1.add(new Phrase("Orden de Pedido",fonttitulo));// titulo
                     
                     par1.setAlignment(Element.ALIGN_CENTER);
                     
                     par1.add(new Phrase (Chunk.NEWLINE));// espacio 
                   
                     
                        documento.add(par1);// AGREGA AL DOCUMENTO
                     
                     Paragraph par2 = new  Paragraph();
                    
                     Font  fontdescrip = new  Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK);// estilo de letra y tamano
                     
                     par2.add(new Phrase("LAUNDRYweb.com.",fontdescrip));// titulo
                     
                     par2.setAlignment(Element.ALIGN_JUSTIFIED);
                     
                     par2.add(new Phrase (Chunk.NEWLINE));// espacio 
                     par2.add(new Phrase (Chunk.NEWLINE));
                     
                     documento.add(par2);
                     
                    
                  PdfPTable tabla = new PdfPTable (7);
                 
                  
                  tabla.setWidthPercentage(110f);
                 
                
                     
                 
                      PdfPCell  celda1 = new PdfPCell(new Paragraph("FECHA",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                  
                      PdfPCell  celda2 = new PdfPCell(new Paragraph("CLIENTE",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                      
                      
                      PdfPCell  celda3 = new PdfPCell(new Paragraph("NIT",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                      PdfPCell  celda4 = new PdfPCell(new Paragraph("Tel",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                      PdfPCell  celda5 = new PdfPCell(new Paragraph("Cel",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK))); 
                       
                      PdfPCell  celda6 = new PdfPCell(new Paragraph("DIRECCION",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                       
                      PdfPCell  celda7 = new PdfPCell(new Paragraph("REFERENCIA",FontFactory.getFont("Arial",10,Font.BOLD,BaseColor.BLACK)));
                       
                       
                       
         
                 
                     
                     
                     
                      tabla.addCell(celda1);
                       tabla.addCell(celda2);
                        tabla.addCell(celda3);
                         tabla.addCell(celda4);
                          tabla.addCell(celda5);
                          tabla.addCell(celda6);
                          tabla.addCell(celda7);
                          
                         
                          
                        
                     
                                       
                                    
                                    
                                    
 ////////////////   fin caveza     imprimir en pdf////                              
                                    
                                    
                                    
                                    
                                    
                                    ArrayList<Factura> datos=fac.getFacturaesnofact(nofactura2);/// consulta bd 
                                    request.setAttribute("datos", datos);// pasamos los parametros de la consulta                 
                                    ArrayList<Factura> list = (ArrayList<Factura>) request.getAttribute("datos");

for(Factura fact : list) {
    
        nofactura=fact.getNofactura();
        fecha=fact.getFecha();
        idcliente=fact.getUsuario().getIdusuario();
       
                                    PdfPTable tabla2 = new PdfPTable (5);                                              
                                    tabla2.setWidthPercentage(110f);     

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
                                                 
                                                         tabla.addCell(""+fm.format(fecha)+""); //fecha 
                                                         tabla.addCell(""+nombre+" "+apellido+"");
                                                         tabla.addCell(""+nit+"");
                                                         tabla.addCell(""+tel+"");
                                                         tabla.addCell(""+cel+"");
                                                         tabla.addCell(""+direccion+"");
                                                         tabla.addCell(""+referencia+"");
                                                         
                                                         documento.add(tabla);       
                                                  
                                     
                                                                                               
       
            
                                                         
                     Paragraph detalle = new  Paragraph();
                     Font  fondetalle = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE);// estilo de letra y tamano
                     
                           
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
                             
                     
                     detalle.add(new Phrase("Detalle",fondetalle));// titulo
                     
                     detalle.setAlignment(Element.ALIGN_CENTER);
                     
                     detalle.add(new Phrase (Chunk.NEWLINE));// espacio 
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
                                  tabla2.addCell("Q"+tarifaser+""); 
                                  tabla2.addCell("Q"+subtotal+""); 
                                 
                          
                                                          
                  
                                           
                                            }//detalle  
        
                                                 } ///usuario  

                          documento.add(tabla2);      }///factura  
                                 
                          Paragraph par4 = new  Paragraph();
                          Font  linea2 = new  Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLACK);// estilo de letra y tamano
                     
                    
                     
                       par4.add(new Phrase (Chunk.NEWLINE));// espacio
                       par4.add(new Phrase (Chunk.NEWLINE));// espacio 
                          
                       
par4.add(new Phrase("--------------------------------------------------------------------------------------------------",linea2));// titulo
                    
                        documento.add(par4);
                   
                     
                     
                      
                     
                     
                       
                       
                     
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
