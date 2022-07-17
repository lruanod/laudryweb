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
public class UsuarioCRUD {
    
    
    
     public  void addUsuario(Usuario user)  // para agregar registros a la bd   nota: el user solo es un variable para acortar
             
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
     
     
      //// buscar servicio por correo y usuario
     public ArrayList<Usuario> getUsuarioporcorreo(String correo, String usuario)
    {   
        
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuario> arreglo=new ArrayList<Usuario>();
                
              
                Query q=session.createQuery("from Usuario as usuario where usuario.correo='"+correo+"' or usuario.usuario='"+usuario+"'");
                List<Usuario> lista=q.list();
                Iterator<Usuario> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuario noti = (Usuario) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }
     
     
     
       public  void updateUsuariocorreo(int id, String estado)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuario us =(Usuario)session.get(Usuario.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setEstado(estado);
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
     
     
    public ArrayList<Usuario> getSesioncliente(String usuarioOcorreo, String clave)
    {   
        
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuario> arreglo=new ArrayList<Usuario>();
                
              
                Query q=session.createQuery("from Usuario as usuario where usuario.correo='"+usuarioOcorreo+"' or usuario.usuario='"+usuarioOcorreo+"' and usuario.clave='"+clave+"' and usuario.estado='ACTIVO'");
                List<Usuario> lista=q.list();
                Iterator<Usuario> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuario noti = (Usuario) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    }  
     
     
     
     public ArrayList<Usuario> getUsuarioporid(int id)
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia
                ArrayList<Usuario> arreglo=new ArrayList<Usuario>();
                
              
                Query q=session.createQuery("from Usuario where Idusuario="+id+"");
                List<Usuario> lista=q.list();
                Iterator<Usuario> iter=lista.iterator();
            //acá termina la magia
        tx.commit();
        session.close();
        //acá ya terminados todo y solo tomamos la lista y la pasamos a una arraylist
        while(iter.hasNext())
        {
            Usuario noti = (Usuario) iter.next();
            arreglo.add(noti);
        }
        
        return arreglo;
        
    } 
     
     
     public Usuario getUsuarioPorIdunion(int id)
    {
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session=factory.openSession();
        Transaction tx=session.beginTransaction();
        Usuario usuario=(Usuario)session.get(Usuario.class, id);
        tx.commit();
        session.close();
        return usuario;
    }  
    
     
     
      public  void updateUsuariocambiarpass(int id, String pass)  // para actualizar pass
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
            
             
           Usuario us =(Usuario)session.get(Usuario.class, id);  /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setClave(pass);
         
                
          session.update(us); /// realizamos el guardado de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
     
     
     
     public  void updateUsuario(int id, String nombre, String apellido, String nit, String direccion, String descripcioncasa, String correo, String usuario, String tel, String cel, String dpi, int idmunicipio, int idtipousuario, String estado)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
              TipousuarioCRUD tipo=new TipousuarioCRUD();
              Tipousuario tipousuario=tipo.getTipousuarioPorId(idtipousuario);
              MunicipiosCRUD muni=new MunicipiosCRUD();
              Municipio municipio=muni.getMunicipioPorIdclas(idmunicipio);
              
           Usuario us =(Usuario)session.get(Usuario.class, id); /// aqui le pasamos el parametro para realizar la bsuqueda
           us.setNombre(nombre);
           us.setApellido(apellido);
           us.setNit(nit);
           us.setDireccion(direccion);
           us.setDescripcionCasa(descripcioncasa);
           us.setCorreo(correo);
           us.setUsuario(usuario);
           us.setTel(tel);
           us.setCel(cel);
           us.setDpi(dpi);
           us.setMunicipio(municipio);
           us.setTipousuario(tipousuario);
           us.setEstado(estado);
           
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
     
     
     public  void updateUsuarioinfo(int id, String direccion, String descripcioncasa,String tel, String cel, int idmunicipio)  // para eliminar registros a la bd   nota: el id es el campo que recibe 
    {
        SessionFactory sesion=HibernateUtil.getSessionFactory();
        Session session =sesion.openSession();
        Transaction tx=session.beginTransaction();
            //acá hacemos la magia para eliminar  un objeto
             
              MunicipiosCRUD muni=new MunicipiosCRUD();
              Municipio municipio=muni.getMunicipioPorIdclas(idmunicipio);
              
           Usuario us =(Usuario)session.get(Usuario.class, id); /// aqui le pasamos el parametro para realizar la bsuqueda
         
           us.setDireccion(direccion);
           us.setDescripcionCasa(descripcioncasa);
           us.setTel(tel);
           us.setCel(cel);
           us.setMunicipio(municipio);
         
         
                
          session.update(us); /// realizamos la eliminacion de un objeto de la bd        
      
            //acá termina la magia
        tx.commit();
        session.close();
        
    }
    
}
