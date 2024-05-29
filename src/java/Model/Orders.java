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
public class Orders {
    private int id;
    private int accountID;
    private int employeeId;
    private int shiftsID;
    private int statusId;
    private Date orderDate;
    private int totalAmount;

    public Orders() {
    }

    public Orders(int id, int accountID, int employeeId, int shiftsID, int statusId, Date orderDate, int totalAmount) {
        this.id = id;
        this.accountID = accountID;
        this.employeeId = employeeId;
        this.shiftsID = shiftsID;
        this.statusId = statusId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }
    public Orders(int accountID, int employeeId, int shiftsID, int statusId, Date orderDate, int totalAmount) {
        this.id = id;
        this.accountID = accountID;
        this.employeeId = employeeId;
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

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
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
        return "Orders{" + "id=" + id + ", accountID=" + accountID + ", employeeId=" + employeeId + ", shiftsID=" + shiftsID + ", statusId=" + statusId + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + '}';
    }
    
    
}
