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
    private int employeeId;
    private String fullName;
    private String phone;
    private int statusId;
    private String updateTime;

    public Employee() {
    }

    public Employee(int employeeId, String fullName, String phone) {
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.phone = phone;
    }

    public Employee(int employeeId, String fullName, String phone, String updateTime) {
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.phone = phone;
        this.updateTime = updateTime;
    }

    public Employee(int employeeId, String fullName, String phone, int statusId, String updateTime) {
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.phone = phone;
        this.statusId = statusId;
        this.updateTime = updateTime;
    }
    
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
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

    @Override
    public String toString() {
        return "Employee{" + "employeeId=" + employeeId + ", fullName=" + fullName + ", phone=" + phone + ", updateTime=" + updateTime + '}';
    }
    
}
