/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author xdrag
 */
public class ViewSale {
    private Employee employee;
    private int totalOrder;
    private int revenue;
    private String avatar;

    public ViewSale() {
    }

    public ViewSale(Employee employee, int totalOrder, int revenue, String avatar) {
        this.employee = employee;
        this.totalOrder = totalOrder;
        this.revenue = revenue;
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    @Override
    public String toString() {
        return "ViewSale{" + "employee=" + employee + ", totalOrder=" + totalOrder + ", revenue=" + revenue + ", avatar=" + avatar + '}';
    }

    
    
    
}
