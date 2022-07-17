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
import modelos.Municipio;
import modelos.Servicio;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class MunicipiosCRUD {
    
     public ArrayList<Municipio> getMunicipio()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Municipio> arreglo=new ArrayList<Municipio>();
                Query q=session.createQuery("from Municipio");
                List<Municipio> lista=q.list();
                Iterator<Municipio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Municipio noti = (Municipio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    

    
    
   public Municipio getMunicipioPorIdclas(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Municipio muni=(Municipio)session.get(Municipio.class, id);
        tx.commit();
        session.close();
        return muni;
    }  
    
    
   public ArrayList<Municipio> getMunicipioporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Municipio> arreglo=new ArrayList<Municipio>();
                
              
                Query q=session.createQuery("from Municipio where Idmunicipio="+id+"");
                List<Municipio> lista=q.list();
                Iterator<Municipio> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Municipio noti = (Municipio) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
    
    
    
    
}
