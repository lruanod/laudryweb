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
import modelos.HibernateUtil;
import modelos.Usuario;
import modelos.Usuariomiembro;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class UsuariomiembroCRUD {
    
    
    
   public ArrayList<Usuariomiembro> getUsuariomiembroporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuariomiembro> arreglo=new ArrayList<Usuariomiembro>();
                
              
                Query q=session.createQuery("from Usuariomiembro where Idusuario="+id+" and Estado='ACTIVO' and MONTH(current_date ())=MONTH(ultimoPago)");
                List<Usuariomiembro> lista=q.list();
                Iterator<Usuariomiembro> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuariomiembro noti = (Usuariomiembro) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
   
    
    public  void updateMembreciaSaldo(int id, BigDecimal saldodisponible)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuariomiembro us =(Usuariomiembro)session.get(Usuariomiembro.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setSaldodisponible(saldodisponible);
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
    
    public ArrayList<Usuariomiembro> getUsuariomiembroporidtodo(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuariomiembro> arreglo=new ArrayList<Usuariomiembro>();
                
              
                Query q=session.createQuery("from Usuariomiembro where Idusuario="+id+"  and Estado='ACTIVO' and Vencimiento >= CURDATE() and Mespago<Mesmax");
                List<Usuariomiembro> lista=q.list();
                Iterator<Usuariomiembro> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuariomiembro noti = (Usuariomiembro) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
    
    
    
     public  void updateMembreciaSaldomensual(int id, BigDecimal saldodisponible,int mespago, Date ultimopago)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuariomiembro us =(Usuariomiembro)session.get(Usuariomiembro.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setSaldodisponible(saldodisponible);
           us.setMespago(mespago);
           us.setUltimoPago(ultimopago);
           
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
     
     
      public  void addUsuariomiembro(Usuariomiembro user)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(user); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }

      
       public ArrayList<Usuariomiembro> getUsuariomiembroporidsolicitado(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuariomiembro> arreglo=new ArrayList<Usuariomiembro>();
                
              
                Query q=session.createQuery("from Usuariomiembro where Idusuario="+id+"  and Estado='PENDIENTE'");
                List<Usuariomiembro> lista=q.list();
                Iterator<Usuariomiembro> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuariomiembro noti = (Usuariomiembro) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
      
      
      
    public ArrayList<Usuariomiembro> getUsuariomiembroestadopendiente()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuariomiembro> arreglo=new ArrayList<Usuariomiembro>();
                
              
                Query q=session.createQuery("from Usuariomiembro where Estado='PENDIENTE'");
                List<Usuariomiembro> lista=q.list();
                Iterator<Usuariomiembro> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuariomiembro noti = (Usuariomiembro) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }    
      
      
    public ArrayList<Usuariomiembro> getUsuariomiembroestadopendienteidusuariomiembro(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuariomiembro> arreglo=new ArrayList<Usuariomiembro>();
                
              
                Query q=session.createQuery("from Usuariomiembro where Estado='PENDIENTE' and Idusuariomiembro="+id+"");
                List<Usuariomiembro> lista=q.list();
                Iterator<Usuariomiembro> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuariomiembro noti = (Usuariomiembro) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }    
    
     public  void updateMembreciaestadoactivo(int id, String estado, Date vencimiento)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuariomiembro us =(Usuariomiembro)session.get(Usuariomiembro.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setEstado(estado);
           us.setVencimiento(vencimiento);
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
    
    public  void updateMembresiadenegada(int id, String estado)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuariomiembro us =(Usuariomiembro)session.get(Usuariomiembro.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setEstado(estado);
      
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
     
     
     
}