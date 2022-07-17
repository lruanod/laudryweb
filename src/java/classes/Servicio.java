/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author user
 */
public class Servicio {
private int idservicio;
private String nombre_ser;
private String descripcion_ser;
private Double tarifa_ser;
private String url;

    public Servicio(int idservicio, String nombre_ser, String descripcion_ser, Double tarifa_ser, String url) {
        this.idservicio = idservicio;
        this.nombre_ser = nombre_ser;
        this.descripcion_ser = descripcion_ser;
        this.tarifa_ser = tarifa_ser;
        this.url = url;
    }

    public Servicio() {
        
        
        
    }


  
    /**
     * @return the idservicio
     */
    public int getIdservicio() {
        return idservicio;
    }

    /**
     * @param idservicio the idservicio to set
     */
    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

    /**
     * @return the nombre_ser
     */
    public String getNombre_ser() {
        return nombre_ser;
    }

    /**
     * @param nombre_ser the nombre_ser to set
     */
    public void setNombre_ser(String nombre_ser) {
        this.nombre_ser = nombre_ser;
    }

    /**
     * @return the descripcion_ser
     */
    public String getDescripcion_ser() {
        return descripcion_ser;
    }

    /**
     * @param descripcion_ser the descripcion_ser to set
     */
    public void setDescripcion_ser(String descripcion_ser) {
        this.descripcion_ser = descripcion_ser;
    }

    /**
     * @return the tarifa_ser
     */
    public Double getTarifa_ser() {
        return tarifa_ser;
    }

    /**
     * @param tarifa_ser the tarifa_ser to set
     */
    public void setTarifa_ser(Double tarifa_ser) {
        this.tarifa_ser = tarifa_ser;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }
    
    
    
    
    
}
