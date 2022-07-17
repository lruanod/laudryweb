/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelos.Departamentos;
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
public class DepartamentosCRUD {
    
    
    //// buscar servicio por id
     public ArrayList<Departamentos> getDepartamendoporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Departamentos> arreglo=new ArrayList<Departamentos>();
                
              
                Query q=session.createQuery("from Departamentos where Iddepartamentos="+id+"");
                List<Departamentos> lista=q.list();
                Iterator<Departamentos> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Departamentos noti = (Departamentos) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
    
}
