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
import modelos.Departamentos;
import modelos.Factura;
import modelos.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class CategoriasCRUD {
    
     public  void addCategorias(Categorias cat)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(cat); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
     
     public ArrayList<Categorias> getCategorias()
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Categorias> arreglo=new ArrayList<Categorias>();
                
              
                Query q=session.createQuery("from Categorias");
                List<Categorias> lista=q.list();
                Iterator<Categorias> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Categorias noti = (Categorias) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
    
     public ArrayList<Categorias> getCategoriasporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Categorias> arreglo=new ArrayList<Categorias>();
                
              
                Query q=session.createQuery("from Categorias where Idcategorias="+id+"");
                List<Categorias> lista=q.list();
                Iterator<Categorias> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Categorias noti = (Categorias) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
     
     
   public  void updateCategorias(int id, String categoria)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Categorias ca =(Categorias)session.get(Categorias.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           ca.setCategoria(categoria);
          
         
                
          session.update(ca); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
      
     
     public Categorias getCategoriasPorIdbus(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Categorias categoria=(Categorias)session.get(Categorias.class, id);
        tx.commit();
        session.close();
        return categoria;
    }   
     
     
     
     
     
}
