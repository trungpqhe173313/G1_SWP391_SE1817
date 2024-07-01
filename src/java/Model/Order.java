/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author xdrag
 */
public class Order {

    private int id;
    private String codeOrder;
    private int customerId;
    private int employeeId;
    private int statusId;
    private Date orderDate;
    private int totalAmount;
    private String updateTime;
    private Shift shift;
    
    public Order() {
    }

    public Order(int id, String codeOrder, int customerId, int employeeId, int statusId, Date orderDate, int totalAmount, String updateTime, Shift shift) {
        this.id = id;
        this.codeOrder = codeOrder;
        this.customerId = customerId;
        this.employeeId = employeeId;
        this.statusId = statusId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.updateTime = updateTime;
        this.shift = shift;
    }

    

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }

    public Shift getShift() {
        return shift;
    }

    public void setShift(Shift shift) {
        this.shift = shift;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
    
    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }


    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", customerId=" + customerId + ", employeeId=" + employeeId + ", statusId=" + statusId + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", updateTime=" + updateTime + '}';
    }

    

}
