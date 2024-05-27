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

    private int id;
    private String phone;

    private String password;
    private String fullName;
    private String email;
    private String avatar;

    private Boolean isMale;
    private int roleId;
    private Boolean isActive;

    public Accounts() {
    }

    public Accounts(int id, String phone, String password, String fullName, String email, String avatar, Boolean isMale, int roleId, Boolean isActive) {
        this.id = id;
        this.phone = phone;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.avatar = avatar;
        this.isMale = isMale;
        this.roleId = roleId;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Boolean getIsMale() {
        return isMale;
    }

    public void setIsMale(Boolean isMale) {

        this.isMale = isMale;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Accounts{" + "id=" + id + ", phone=" + phone + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", avatar=" + avatar + ", isMale=" + isMale + ", roleId=" + roleId + ", isActive=" + isActive + '}';
    }
 
}
