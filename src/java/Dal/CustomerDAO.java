/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Accounts;
import Model.Roles;
/**
 *
 * @author admin
 */
public class CustomerDAO extends DBContext{
//    public Accounts getProfileByUsername(String user) {
//        String sql = "Select*from Accounts where (phone = ?)";
//        try {
//
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, user);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new Accounts(
//                    rs.getInt("id"),
//                    rs.getString("phone"),
//                    rs.getString("password"),
//                    rs.getString("fullName"),
//                    rs.getString("email"),
//                    rs.getString("avatar"),
//                    rs.getBoolean("isMale"),
//                    rs.getInt("roleId"),
//                    rs.getBoolean("isActive"),
//                    rs.getTimestamp("createdAt"),
//                    rs.getTimestamp("updatedAt")
//                );
//            }
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//        return null;
//    }
    public Accounts getCusProfile(String user){
        String sql = "SELECT dbo.accounts.phone, dbo.accounts.password, "
                + "dbo.accounts.fullName, dbo.accounts.email, dbo.accounts.avatar, "
                + "dbo.accounts.isMale, dbo.roles.name, dbo.accounts.isActive, "
                + "dbo.accounts.createdAt, dbo.accounts.updatedAt\n" 
                + "FROM     dbo.accounts INNER JOIN\n" 
                + "         dbo.roles ON dbo.accounts.roleId = dbo.roles.id"
                + " where  dbo.accounts.phone = ?";
        try{
         PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Accounts(
                    rs.getInt("id"),
                    rs.getString("phone"),
                    rs.getString("password"),
                    rs.getString("fullName"),
                    rs.getString("email"),
                    rs.getString("avatar"),
                    rs.getBoolean("isMale"),
                    new Roles(rs.getString("name")),
                    rs.getBoolean("isActive"),
                    rs.getTimestamp("createdAt"),
                    rs.getTimestamp("updatedAt")
                );
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
        
    }
    
    public void updateProfile(Accounts account) {
       String sql = "UPDATE Accounts SET fullName = ?, password = ?, email = ?, avatar = ?," 
               + "isMale = ?, updatedAt = ? WHERE (phone = ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getFullName());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getEmail());
            stm.setString(4, account.getAvatar());
            stm.setBoolean(5, account.getIsMale());
            stm.setTimestamp(6, account.getUpdatedAt());
            stm.setString(7, account.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        String phone = "0123456789"; // Thay thế bằng tên người dùng thử nghiệm
        //Accounts account = c.getProfileByUsername(phone);
       

            // In thông tin tài khoản nếu đăng nhập thành công
            if (account != null) {
                System.out.println("Profile Information");
                System.out.println("Account ID: " + account.getId());
                System.out.println("Username: " + account.getUsername());
                System.out.println("Password: " + account.getPassword());
                System.out.println("Full Name: " + account.getFullName());
                System.out.println("Email: " + account.getEmail());
                System.out.println("Avatar: " + account.getAvatar());
                System.out.println("Is Male: " + account.getIsMale());
                System.out.println("Role ID: " + account.getRoleId());
                System.out.println("Is Active: " + account.getIsActive());
                System.out.println("Created At: " + account.getCreatedAt());
                System.out.println("Updated At: " + account.getUpdatedAt());
            } else {
                System.out.println("Login failed: Invalid phone or password");
            
            }
    }
}
