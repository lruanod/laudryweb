/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelos.HibernateUtil;
import modelos.Ordenoperador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class OrdenoperadorCRUD {
    
    
     public  void addOrdenoperador(Ordenoperador  oper)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(oper); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
    
     public ArrayList<Ordenoperador> getOredenoperadornofact( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Ordenoperador> arreglo=new ArrayList<Ordenoperador>();
                Query q=session.createQuery("from Ordenoperador where nofactura="+id+"");
                List<Ordenoperador> lista=q.list();
                Iterator<Ordenoperador> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Ordenoperador noti = (Ordenoperador) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
    
    
    
    
    
    
    
}
