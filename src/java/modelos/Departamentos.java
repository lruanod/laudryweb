package modelos;
// Generated 26/09/2017 02:15:24 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Departamentos generated by hbm2java
 */
public class Departamentos  implements java.io.Serializable {


     private Integer iddepartamentos;
     private String nombre;
     private Set municipios = new HashSet(0);

    public Departamentos() {
    }

    public Departamentos(String nombre, Set municipios) {
       this.nombre = nombre;
       this.municipios = municipios;
    }
   
    public Integer getIddepartamentos() {
        return this.iddepartamentos;
    }
    
    public void setIddepartamentos(Integer iddepartamentos) {
        this.iddepartamentos = iddepartamentos;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getMunicipios() {
        return this.municipios;
    }
    
    public void setMunicipios(Set municipios) {
        this.municipios = municipios;
    }




}


