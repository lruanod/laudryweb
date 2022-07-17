/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelos.*;
import modelos.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class DetalleCRUD {
    
     public  void addDetalle(Detalle dell)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(dell); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
    
    
      public ArrayList<Detalle> getDetalleporidfact(int nofact)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Detalle> arreglo=new ArrayList<Detalle>();
                
              
                Query q=session.createQuery("from Detalle where Idfactura="+nofact+"");
                List<Detalle> lista=q.list();
                Iterator<Detalle> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Detalle noti = (Detalle) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
    
     
     
     
     
     
     
     
     
}
