/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phamt
 */
public class Account {

    private String phone;
    private String pass;
    private int roleId;
    private String email;
    private Boolean gender;
    private Boolean isActive;
    private String avatar;

    public Account() {
    }

    public Account(String phone, String pass, int roleId, String email, Boolean gender, Boolean isActive, String avatar) {
        this.phone = phone;
        this.pass = pass;
        this.roleId = roleId;
        this.email = email;
        this.gender = gender;
        this.isActive = isActive;
        this.avatar = avatar;
    }

//    public String getAvatar(String vatar) {
//        return avatar;
//    }
//
//    public void setAvata(String avatar) {
//        this.avatar = avatar;
//    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
        return "Account{" + "phone=" + phone + ", pass=" + pass + ", roleId=" + roleId + ", email=" + email + ", gender=" + gender + ", isActive=" + isActive + ", avatar=" + avatar + '}';
    }
}
