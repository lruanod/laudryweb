/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelos.HibernateUtil;
import modelos.Tarifa;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class TarifaCRUD {
    
    
     public ArrayList<Tarifa> getTarifa()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Tarifa> arreglo=new ArrayList<Tarifa>();
                
              
                Query q=session.createQuery("from Tarifa");
                List<Tarifa> lista=q.list();
                Iterator<Tarifa> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Tarifa noti = (Tarifa)iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
       // buscar servicio por id con su tarifa
      //// buscar servicio por id
     public ArrayList<Tarifa> getServicioporidtarifa(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Tarifa> arreglo=new ArrayList<Tarifa>();
                
              
                Query q=session.createQuery("from Tarifa where Idservicio="+id+"");
                List<Tarifa> lista=q.list();
                Iterator<Tarifa> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Tarifa noti = (Tarifa)iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
     
       public ArrayList<Tarifa> getTarifaporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Tarifa> arreglo=new ArrayList<Tarifa>();
                
              
                Query q=session.createQuery("from Tarifa where Idtarifa="+id+"");
                List<Tarifa> lista=q.list();
                Iterator<Tarifa> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Tarifa noti = (Tarifa)iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
       
       
     public Tarifa getTarifaPorIdbus(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Tarifa tarifa=(Tarifa)session.get(Tarifa.class, id);
        tx.commit();
        session.close();
        return tarifa;
    }  
    
       
       
       
        public  void updateTarifa(int id, String nombre, BigDecimal tarifa )  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Tarifa ta =(Tarifa)session.get(Tarifa.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           ta.setNombreser(nombre);
           ta.setTarifaSer(tarifa);
         
                
          session.update(ta); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
       
       
     public  void addTarifa(Tarifa tar)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(tar); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
       
       
       
}
