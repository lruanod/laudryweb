/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.CRUD;

import modelos.HibernateUtil;
import modelos.Ordenrepartidor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class OrdenrepartidorCRUD {
    
    
    
    public  void addOrdenrepartidor(Ordenrepartidor  orre)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para agregar  un objeto
            
               session.save(orre); // metodo para guardar
               
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
}
