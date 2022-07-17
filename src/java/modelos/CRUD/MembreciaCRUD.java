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
import modelos.Membrecia;
import modelos.Servicio;
import modelos.Usuariomiembro;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class MembreciaCRUD {
    
    public ArrayList<Membrecia> getMembrecia(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Membrecia> arreglo=new ArrayList<Membrecia>();
                
              
                Query q=session.createQuery("from Membrecia where Idmembrecia="+id+"");
                List<Membrecia> lista=q.list();
                Iterator<Membrecia> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Membrecia noti = (Membrecia) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
   
    
    public ArrayList<Membrecia> getMembreciatodo()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Membrecia> arreglo=new ArrayList<Membrecia>();
                Query q=session.createQuery("from Membrecia");
                List<Membrecia> lista=q.list();
                Iterator<Membrecia> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Membrecia noti = (Membrecia) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
     public Membrecia getMembresiaPorIdbus(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Membrecia membrecia=(Membrecia)session.get(Membrecia.class, id);
        tx.commit();
        session.close();
        return membrecia;
    }  
    
    public  void updaMembrecia(int id,String nombre,BigDecimal cuota,BigDecimal saldo)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
             
            
            
           Membrecia mem =(Membrecia)session.get(Membrecia.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           mem.setNombreMem(nombre);
           mem.setCuota(cuota);
           mem.setSaldo(saldo);
         
           
         
                
          session.update(mem); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
   
    
    
    public  void addMembrecia(Membrecia mem)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(mem); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }   
    
}
