/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelos.Categorias;
import modelos.HibernateUtil;
import modelos.Servicio;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class ServiciosCRUD {
    // para los servicios combos
      
    public ArrayList<Servicio> getServicio()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Servicio> arreglo=new ArrayList<Servicio>();
                Query q=session.createQuery("from Servicio where categorias=2 ");
                List<Servicio> lista=q.list();
                Iterator<Servicio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Servicio noti = (Servicio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
     public ArrayList<Servicio> getServicioidcategoria( int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Servicio> arreglo=new ArrayList<Servicio>();
                Query q=session.createQuery("from Servicio where categorias="+id+" ");
                List<Servicio> lista=q.list();
                Iterator<Servicio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Servicio noti = (Servicio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    //// para todos los servicios
    
    public ArrayList<Servicio> getServiciotodo()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Servicio> arreglo=new ArrayList<Servicio>();
                Query q=session.createQuery("from Servicio");
                List<Servicio> lista=q.list();
                Iterator<Servicio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Servicio noti = (Servicio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    //// buscar servicio por id
     public ArrayList<Servicio> getServicioporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Servicio> arreglo=new ArrayList<Servicio>();
                
              
                Query q=session.createQuery("from Servicio where Idservicio="+id+"");
                List<Servicio> lista=q.list();
                Iterator<Servicio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Servicio noti = (Servicio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
     
     public Servicio getServicioPorIdbus(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Servicio servicio=(Servicio)session.get(Servicio.class, id);
        tx.commit();
        session.close();
        return servicio;
    }  
    
    
      
   public  void updateservicio(int id,String descripcion,String url,String estado, int idcategoria)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
             CategoriasCRUD cat=new CategoriasCRUD();
             Categorias categorias=cat.getCategoriasPorIdbus(idcategoria);
            
            
           Servicio ser =(Servicio)session.get(Servicio.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           ser.setDescripcionSer(descripcion);
           ser.setUrl(url);
           ser.setEstado(estado);
           ser.setCategorias(categorias);
           
         
                
          session.update(ser); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
     
     
   public  void addServicio(Servicio ser)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(ser); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }   
     
     
     
     
     
    
}
