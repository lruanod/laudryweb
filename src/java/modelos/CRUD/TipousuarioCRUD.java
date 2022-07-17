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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class TipousuarioCRUD {
    
    
     public Tipousuario getTipousuarioPorId(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Tipousuario tipo=(Tipousuario)session.get(Tipousuario.class, id);
        tx.commit();
        session.close();
        return tipo;
    }  
    
     
 public ArrayList<Tipousuario> getTipousuario() 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Tipousuario> arreglo=new ArrayList<Tipousuario>();
                Query q=session.createQuery("from Tipousuario");
                List<Tipousuario> lista=q.list();
                Iterator<Tipousuario> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Tipousuario noti = (Tipousuario) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }    
     
    public ArrayList<Tipousuario> getTipousuarioidtipo( int id) 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Tipousuario> arreglo=new ArrayList<Tipousuario>();
                Query q=session.createQuery("from Tipousuario  where Idtipousuario="+id+"");
                List<Tipousuario> lista=q.list();
                Iterator<Tipousuario> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Tipousuario noti = (Tipousuario) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }    
    
    
}
