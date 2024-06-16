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
    private int customerId;
    private int shiftsID;
    private int statusId;
    private Date orderDate;
    private int totalAmount;

    public Order() {
    }

    public Order(int id, int customerId, int shiftsID, int statusId, Date orderDate, int totalAmount) {
        this.id = id;
        this.customerId = customerId;
        this.shiftsID = shiftsID;
        this.statusId = statusId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
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

    public int getShiftsID() {
        return shiftsID;
    }

    public void setShiftsID(int shiftsID) {
        this.shiftsID = shiftsID;
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
        return "Orders{" + "id=" + id + ", customerId=" + customerId + ", shiftsID=" + shiftsID + ", statusId=" + statusId + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + '}';
    }

    
}
