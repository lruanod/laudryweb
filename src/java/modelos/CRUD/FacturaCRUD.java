/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import modelos.Factura;
import modelos.HibernateUtil;
import modelos.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class FacturaCRUD {
    
    
    public  void addFactura(Factura fac)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(fac); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
    ///getFacturaporidcli
    
      public ArrayList<Factura> getFacturaporidcli(int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where Idusuario="+id+" and Estado='PENDIENTE'");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
    
      public Factura getFacturaPorIdbuscarn(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Factura factura=(Factura)session.get(Factura.class, id);
        tx.commit();
        session.close();
        return factura;
    }  
    
     
       public  void updatefacturaestado(int id, String estado)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Factura fa =(Factura)session.get(Factura.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           fa.setEstado(estado);
         
                
          session.update(fa); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
     
    public ArrayList<Factura> getFacturadiferenteentrega(int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where Idusuario="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
    
         
    public ArrayList<Factura> getFacturaestadopagado( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where  Estado='PAGADO'  and Idsucursal="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
    public ArrayList<Factura> getFacturaestadoenviadoarecojer( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where  Estado='ENVIADO A RECOGER'  and Idsucursal="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
    public ArrayList<Factura> getFacturaesnofact( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where nofactura="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
  
    
    
     public  void updatefacturarecargototal(int id, BigDecimal rec,BigDecimal total)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Factura fa =(Factura)session.get(Factura.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           fa.setRecargo(rec);
           fa.setTotal(total);
         
                
          session.update(fa); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
     public ArrayList<Factura> getFacturaesnofactestadopagado( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where nofactura="+id+" and Estado='PAGADO'");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
     
     public ArrayList<Factura> getFacturaesnofactestadoprocesado( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where  Estado='PROCESANDO'  and Idsucursal="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
     
     
      public ArrayList<Factura> getFacturaestadoenviadoaentrega( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where  Estado='ENVIADO A ENTREGAR' and Idsucursal="+id+"");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
     
     
      
      public ArrayList<Factura> getFacturapornumeroestadoprocesado( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
                Query q=session.createQuery("from Factura where nofactura="+id+" and Estado='PROCESANDO'");
                List<Factura> lista=q.list();
                Iterator<Factura> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
     
      
      
      public ArrayList<Factura> getFacturaparareporte( int id, String inicio,String fin,String estado) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Factura> arreglo=new ArrayList<Factura>();
  if(estado.equals("GENERAL")){
                Query q=session.createQuery("from Factura where Idsucursal="+id+" and Fecha>='"+inicio+"' and Fecha<='"+fin+"'");
               
                List<Factura> lista=q.list();
               
                Iterator<Factura> iter=lista.iterator();
               
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
               }else{
      
      Query q=session.createQuery("from Factura where Estado='"+estado+"' and Idsucursal="+id+" and Fecha>='"+inicio+"' and Fecha<='"+fin+"'");
               
                List<Factura> lista=q.list();
               
                Iterator<Factura> iter=lista.iterator();
               
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Factura noti = (Factura) iter.next();
            arreglo.add(noti);
        }
      
      
                   }
  
  
        return arreglo;
        
    }  
      
      
      
      
     
}
