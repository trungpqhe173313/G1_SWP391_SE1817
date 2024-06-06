/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Accounts;
/**
 *
 * @author LINHNTHE170290
 */
public class CustomerDAO extends DBContext{
    public Accounts getProfileByPhone(String phone) {
        String sql = "Select*from Accounts where (phone = ?)";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
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
                    rs.getInt("roleId"),
                    rs.getBoolean("isActive")
                );
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
    public Accounts getProfileById(int id) {
        String sql = "Select*from Accounts where (id = ?)";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
                    rs.getInt("roleId"),
                    rs.getBoolean("isActive")
                );
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public void updateProfile(Accounts account) {
       String sql = "UPDATE Accounts SET phone = ?, password = ?, fullName = ?, email = ?, "
               + "avatar = ?, isMale = ?, roleId = 2, isActive = 1, "
               + "createdAt = GETDATE(), updatedAt =  GETDATE() WHERE (id = ?)";
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
            stm.setInt(9, account.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

//    
//    public void updateProfile(Accounts account) {
//       String sql = "UPDATE Accounts SET password = ?, fullName = ?, email = ?, "
//               + "avatar = ?, isMale = ?, roleId = 2, isActive = 1, "
//               + "createdAt = GETDATE(), updatedAt =  GETDATE() WHERE (phone = ?)";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, account.getPassword());
//            stm.setString(2, account.getFullName());
//            stm.setString(3, account.getEmail());
//            stm.setString(4, account.getAvatar());
//            stm.setBoolean(5, account.getIsMale());
//            stm.setString(6, account.getPhone());
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//    }
    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        String phone = "0987654321"; // Thay thế bằng tên người dùng thử nghiệm
        Accounts account = c.getProfileByPhone(phone);
       

            // In thông tin tài khoản nếu đăng nhập thành công
            if (account != null) {
                System.out.println("Profile Information");
                System.out.println("Account ID: " + account.getId());
                System.out.println("Phone: " + account.getPhone());
                System.out.println("Password: " + account.getPassword());
                System.out.println("Full Name: " + account.getFullName());
                System.out.println("Email: " + account.getEmail());
                System.out.println("Avatar: " + account.getAvatar());
                System.out.println("Is Male: " + account.getIsMale());
            } else {
                System.out.println("Login failed: Invalid phone or password");
            
            }
    }
}