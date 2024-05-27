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
public class Employees {
    private int id;
    private int accountId;
    private boolean isActive;
    private Date dateOfBirth;
    private String address;

    public Employees() {
    }

    public Employees(int id, int accountId, boolean isActive, Date dateOfBirth, String address) {
        this.id = id;
        this.accountId = accountId;
        this.isActive = isActive;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Employees{" + "id=" + id + ", accountId=" + accountId + ", isActive=" + isActive + ", dateOfBirth=" + dateOfBirth + ", address=" + address + '}';
    }
   
    
}
