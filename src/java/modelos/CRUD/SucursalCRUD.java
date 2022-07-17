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
import modelos.*;
import modelos.Sucursal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class SucursalCRUD {
    
    public ArrayList<Sucursal> getSucursal() 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Sucursal> arreglo=new ArrayList<Sucursal>();
                Query q=session.createQuery("from Sucursal");
                List<Sucursal> lista=q.list();
                Iterator<Sucursal> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Sucursal noti = (Sucursal) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
     public ArrayList<Sucursal> getSucursalpormuni(int muni) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Sucursal> arreglo=new ArrayList<Sucursal>();
                Query q=session.createQuery("from Sucursal where Idmunicipio="+muni+"");
                List<Sucursal> lista=q.list();
                Iterator<Sucursal> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Sucursal noti = (Sucursal) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
   
     public Sucursal getSucursalPorId(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Sucursal sucursal=(Sucursal)session.get(Sucursal.class, id);
        tx.commit();
        session.close();
        return sucursal;
    }  
    
    
    
   
    public ArrayList<Sucursal> getSucursalIdsucursal(int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Sucursal> arreglo=new ArrayList<Sucursal>();
                Query q=session.createQuery("from Sucursal where Idsucursal="+id+"");
                List<Sucursal> lista=q.list();
                Iterator<Sucursal> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Sucursal noti = (Sucursal) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
    
    
    
    
    
    
}
