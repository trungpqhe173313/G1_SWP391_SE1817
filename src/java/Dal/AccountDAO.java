/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Accounts;


public class AccountDAO extends DBContext{
    public List<Accounts> getAllAccount() {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Account where role != 3";
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
                account.setIsActive(rs.getBoolean("isActive"));
                

                list.add(account);
            }
        } catch (SQLException e) {
            
        }
        return list;
    }
    
    public Accounts login(String phone, String pass) {
        String sql = "SELECT*FROM accounts where (phone = ?) and (password = ?)";
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
                account.setIsActive(rs.getBoolean("isActive"));
                

                return account;
            }
        } catch (SQLException e) {
           
        }
        return null;
    }

   public Accounts checkAuthentic(String phone, String password) {
        String sql="select*from accounts where (phone=?) and (password=?)";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new Accounts(
                    rs.getInt("id"),
                    phone,
                    password,
                    rs.getString("fullName"),
                    rs.getString("email"),
                    rs.getString("avatar"),
                    rs.getBoolean("isMale"),
                    rs.getInt("roleId"),
                    rs.getBoolean("isActive")
                );
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
   }
    
    public Accounts checkAccountExist(String phone) {
        try {
            String sql = "SELECT * FROM accounts WHERE phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
                account.setIsActive(rs.getBoolean("isActive"));
                return account;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
  
   public void insertAccount(Accounts account) {
        String sql = "INSERT INTO accounts (phone, password, fullName, email, "
                + "avatar, isMale, roleId, isActive) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPhone());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getFullName());
            stm.setString(4, account.getEmail());
            stm.setString(5, account.getAvatar());
            stm.setBoolean(6, account.getIsMale());
            stm.setInt(7, account.getRoleId());
            stm.setBoolean(8, account.getIsActive());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        String phone = "0123456789"; // Thay thế bằng tên người dùng thử nghiệm
        String password = "password1"; // Thay thế bằng mật khẩu thử nghiệm
         Accounts account = a.checkAuthentic(phone, password);
       

            // In thông tin tài khoản nếu đăng nhập thành công
            if (account != null) {
                System.out.println("Login successful!");
                System.out.println("Account ID: " + account.getId());
                System.out.println("Phone: " + account.getPhone());
                System.out.println("Password: " + account.getPassword());
                System.out.println("Full Name: " + account.getFullName());
                System.out.println("Email: " + account.getEmail());
                System.out.println("Avatar: " + account.getAvatar());
                System.out.println("Is Male: " + account.getIsMale());
                System.out.println("Role ID: " + account.getRoleId());
                System.out.println("Is Active: " + account.getIsActive());
            } else {
                System.out.println("Login failed: Invalid phone or password");
            
            }
    }

}


    
    
    

