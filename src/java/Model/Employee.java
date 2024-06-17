/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author ducth
 */
public class Employee {
    private int employeesId;
    private String fullName;
    private String phone;
    private String updateTime;

    public Employee() {
    }

    public Employee(int employeeId, String fullName, String phone) {
        this.employeesId = employeeId;
        this.fullName = fullName;
        this.phone = phone;
    }

    public Employee(int employeesId, String fullName, String phone, String updateTime) {
        this.employeesId = employeesId;
        this.fullName = fullName;
        this.phone = phone;
        this.updateTime = updateTime;
    }

    public int getEmployeesId() {
        return employeesId;
    }

    public void setEmployeesId(int employeesId) {
        this.employeesId = employeesId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
    

  

    
}
