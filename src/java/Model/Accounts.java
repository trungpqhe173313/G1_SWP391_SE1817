/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phamt
 */
public class Accounts {

    private String phone;
    private String password;
    private int roleId;
    private String email;
    private Boolean gender;
    private Boolean isActive;
    public Accounts() {
    }

    public Accounts(String phone, String password, int roleId, String email, Boolean gender, Boolean isActive) {
        this.phone = phone;
        this.password = password;
        this.roleId = roleId;
        this.email = email;
        this.gender = gender;
        this.isActive = isActive;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Accounts{" + "phone=" + phone + ", password=" + password + ", roleId=" + roleId + ", email=" + email + ", gender=" + gender + ", isActive=" + isActive + '}';
    }
    
}    