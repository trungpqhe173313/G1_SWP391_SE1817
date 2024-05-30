/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author xdrag
 */
public class Booking {
    private Orders order;
    private List<Services> listServices;
    private Shifts shift;
    private Accounts barber;
    private Statuses status;

    public Booking() {
    }

    public Booking(Orders order, List<Services> listServices, Shifts shift, Accounts barber, Statuses status) {
        this.order = order;
        this.listServices = listServices;
        this.shift = shift;
        this.barber = barber;
        this.status = status;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public List<Services> getListServices() {
        return listServices;
    }

    public void setListServices(List<Services> listServices) {
        this.listServices = listServices;
    }

    public Shifts getShift() {
        return shift;
    }

    public void setShift(Shifts shift) {
        this.shift = shift;
    }

    public Accounts getBarber() {
        return barber;
    }

    public void setBarber(Accounts barber) {
        this.barber = barber;
    }

    public Statuses getStatus() {
        return status;
    }

    public void setStatus(Statuses status) {
        this.status = status;
    }
    
    
}
