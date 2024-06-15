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

    private int id;
    private String phone;
<<<<<<< Updated upstream:src/java/Model/Accounts.java
    
    private String password;
    private String fullName;
=======
    private String pass;
    private int roleId;
>>>>>>> Stashed changes:src/java/Model/Account.java
    private String email;
    private String avatar;
    
    private Boolean isMale;
    private int roleId;
    private Boolean isActive;
<<<<<<< Updated upstream:src/java/Model/Accounts.java
    public Accounts() {
    }
    
    public Accounts(int id, String phone, String password, String fullName, String email, String avatar, Boolean isMale, int roleId, Boolean isActive) {
        this.id = id;
        this.phone = phone;
        this.password = password;
        this.fullName = fullName;
=======

    public Account(String phone, String pass, int roleId, String email, Boolean gender, Boolean isActive) {
        this.phone = phone;
        this.pass = pass;
        this.roleId = roleId;
>>>>>>> Stashed changes:src/java/Model/Account.java
        this.email = email;
        this.avatar = avatar;
        this.isMale = isMale;
        this.roleId = roleId;
        this.isActive = isActive;
    }

<<<<<<< Updated upstream:src/java/Model/Accounts.java
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
=======
    public Account() {
>>>>>>> Stashed changes:src/java/Model/Account.java
    }

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
<<<<<<< Updated upstream:src/java/Model/Accounts.java
        return "Accounts{" + "id=" + id + ", phone=" + phone + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", avatar=" + avatar + ", isMale=" + isMale + ", roleId=" + roleId + ", isActive=" + isActive + '}';
=======
        return "Accounts{" + "phone=" + phone + ", pass=" + pass + ", roleId=" + roleId + ", email=" + email + ", gender=" + gender + ", isActive=" + isActive + '}';
>>>>>>> Stashed changes:src/java/Model/Account.java
    }
 
}
