package modelos;
// Generated 26/09/2017 02:15:24 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tipousuario generated by hbm2java
 */
public class Tipousuario  implements java.io.Serializable {


     private Integer idtipousuario;
     private String nombretipo;
     private Set usuarios = new HashSet(0);

    public Tipousuario() {
    }

	
    public Tipousuario(String nombretipo) {
        this.nombretipo = nombretipo;
    }
    public Tipousuario(String nombretipo, Set usuarios) {
       this.nombretipo = nombretipo;
       this.usuarios = usuarios;
    }
   
    public Integer getIdtipousuario() {
        return this.idtipousuario;
    }
    
    public void setIdtipousuario(Integer idtipousuario) {
        this.idtipousuario = idtipousuario;
    }
    public String getNombretipo() {
        return this.nombretipo;
    }
    
    public void setNombretipo(String nombretipo) {
        this.nombretipo = nombretipo;
    }
    public Set getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Set usuarios) {
        this.usuarios = usuarios;
    }




}

