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

    public Employee() {
    }

    public Employee(int employeeId, String fullName, String phone) {
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.phone = phone;
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

    @Override
    public String toString() {
        return "Employees{" + "employeeId=" + employeeId + ", fullName=" + fullName + ", phone=" + phone + '}';
    }

    
    
}
