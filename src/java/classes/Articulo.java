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
public class Articulo {
    
    private int idtarifa;
    private int cantidad;

    public Articulo(int idtarifa, int cantidad) {
        this.idtarifa = idtarifa;
        this.cantidad = cantidad;
    }

    /**
     * @return the idtarifa
     */
    public int getIdtarifa() {
        return idtarifa;
    }

    /**
     * @param idtarifa the idtarifa to set
     */
    public void setIdtarifa(int idtarifa) {
        this.idtarifa = idtarifa;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
    
    
}
