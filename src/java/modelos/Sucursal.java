package modelos;
// Generated 26/09/2017 02:15:24 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Sucursal generated by hbm2java
 */
public class Sucursal  implements java.io.Serializable {


     private Integer idsucursal;
     private Municipio municipio;
     private String nombreSucursal;
     private String nit;
     private String direccion;
     private Set operadorsucursals = new HashSet(0);
     private Set facturas = new HashSet(0);

    public Sucursal() {
    }

	
    public Sucursal(Municipio municipio, String nombreSucursal, String direccion) {
        this.municipio = municipio;
        this.nombreSucursal = nombreSucursal;
        this.direccion = direccion;
    }
    public Sucursal(Municipio municipio, String nombreSucursal, String nit, String direccion, Set operadorsucursals, Set facturas) {
       this.municipio = municipio;
       this.nombreSucursal = nombreSucursal;
       this.nit = nit;
       this.direccion = direccion;
       this.operadorsucursals = operadorsucursals;
       this.facturas = facturas;
    }
   
    public Integer getIdsucursal() {
        return this.idsucursal;
    }
    
    public void setIdsucursal(Integer idsucursal) {
        this.idsucursal = idsucursal;
    }
    public Municipio getMunicipio() {
        return this.municipio;
    }
    
    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }
    public String getNombreSucursal() {
        return this.nombreSucursal;
    }
    
    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }
    public String getNit() {
        return this.nit;
    }
    
    public void setNit(String nit) {
        this.nit = nit;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public Set getOperadorsucursals() {
        return this.operadorsucursals;
    }
    
    public void setOperadorsucursals(Set operadorsucursals) {
        this.operadorsucursals = operadorsucursals;
    }
    public Set getFacturas() {
        return this.facturas;
    }
    
    public void setFacturas(Set facturas) {
        this.facturas = facturas;
    }




}

