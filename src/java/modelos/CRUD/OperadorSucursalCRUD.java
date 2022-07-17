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
import modelos.Operadorsucursal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class OperadorSucursalCRUD {
    
    
    
    public ArrayList<Operadorsucursal> getoOperadorsucursal(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Operadorsucursal> arreglo=new ArrayList<Operadorsucursal>();
                
              
                Query q=session.createQuery("from Operadorsucursal where Idusuario="+id+"");
                List<Operadorsucursal> lista=q.list();
                Iterator<Operadorsucursal> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Operadorsucursal noti = (Operadorsucursal) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
    
    
     public ArrayList<Operadorsucursal> getoOperadorsucursalidSucursal(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Operadorsucursal> arreglo=new ArrayList<Operadorsucursal>();
                
              
                Query q=session.createQuery("from Operadorsucursal where Idsucursal="+id+"");
                List<Operadorsucursal> lista=q.list();
                Iterator<Operadorsucursal> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Operadorsucursal noti = (Operadorsucursal) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
    
     
      public  void addOperadorsucursal(Operadorsucursal user)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
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
    
}
