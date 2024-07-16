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
public class OrderRevenue {
    private Order order;
    private Customer customer;
    private Employee employee;
    private List<Services> services;
    private Shift shift;
    private Status status;

    public OrderRevenue() {
    }

    public OrderRevenue(Order order, Customer customer, Employee employee, List<Services> services, Shift shift, Status status) {
        this.order = order;
        this.customer = customer;
        this.employee = employee;
        this.services = services;
        this.shift = shift;
        this.status = status;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public List<Services> getServices() {
        return services;
    }

    public void setServices(List<Services> services) {
        this.services = services;
    }

    public Shift getShift() {
        return shift;
    }

    public void setShift(Shift shift) {
        this.shift = shift;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderRevenue{" + "order=" + order + ", customer=" + customer + ", employee=" + employee + ", services=" + services + ", shift=" + shift + ", status=" + status + '}';
    }
    
    
}
