/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Account;
import Model.Employee;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class AccountDAO extends DBContext {

    public String getCustomerByPhone(String phone) {

        try {

            String sql = "SELECT fullName\n"
                    + "  FROM [Barber].[dbo].[customer]\n"
                    + "  where phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("fullName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByPhone(String phone) {

        try {

            String sql = "SELECT *\n"
                    + "  FROM account\n"
                    + "  where phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setAvatar(rs.getString("avatar"));
                account.setPoint(rs.getInt("points"));
                return account;

            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from account where role != 1";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setAvatar(rs.getString("avatar"));
                list.add(account);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Account checkAuthentic(String phone, String pass) {
        String sql = "SELECT * FROM account WHERE phone = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setAvatar(rs.getString("avatar"));
                return account;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account login(String phone, String pass) {
        String sql = "SELECT * FROM account WHERE phone = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String storedHashedPassword = rs.getString("pass");
                if (storedHashedPassword.equals(hashPassword(pass))) {
                    Account account = new Account();
                    account.setPhone(rs.getString("phone"));
                    account.setPass(storedHashedPassword);
                    account.setRoleId(rs.getInt("roleId"));
                    account.setEmail(rs.getString("email"));
                    account.setGender(rs.getBoolean("gender"));
                    account.setIsActive(rs.getBoolean("isActive"));
                    account.setAvatar(rs.getString("avatar"));
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String hashPassword(String password) {
        try {
            // Create a MessageDigest instance for SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            // Add password bytes to digest
            md.update(password.getBytes());
            // Get the hashed bytes
            byte[] bytes = md.digest();
            // Convert bytes to a hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Get complete hashed password in hex format
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public Account checkAccountExist(String phone) {
        try {
            String sql = "SELECT * FROM account WHERE phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setAvatar(rs.getString("avatar"));
                return account;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void insertAccount(Account account) {
        String sql = "INSERT INTO account (phone, pass, roleId, email, "
                + "gender, isActive, avatar) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPhone());
            stm.setString(2, account.getPass());
            stm.setInt(3, account.getRoleId());
            stm.setString(4, account.getEmail());
            stm.setBoolean(5, account.getGender());
            stm.setBoolean(6, account.getIsActive());
            stm.setString(7, account.getAvatar());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean checkEmailExist(String email) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {//1. Connect DB
            con = DBContext.connection;

            if (con != null) {
                String sql = " SELECT * FROM account WHERE email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                //4. Excute Query
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }

        } catch (Exception e) {
            System.out.println("loi checkAcountExist" + e.getMessage());
        }
        return false;
    }

    public boolean checkOldPass(String email, String oldPassword) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isValid = false;

        try {
            conn = DBContext.connection; // Get connection
            if (conn != null) {
                String sql = "SELECT * FROM account WHERE email = ? AND pass = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, oldPassword);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    isValid = true;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in checkOldPass: " + e.getMessage());
        }

        return isValid;
    }

    public void changePass(String email, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        //1. Connect DB
        con = DBContext.connection;
        if (con != null) {
            //2. Create SQL String
            String sql = "    Update [account] SET   pass =?\n"
                    + "   WHERE [email] =?";
            //3. Create Statement
            stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, email);

            //4. Excute Query
            stm.executeUpdate();

        }

    }

    public Account getAllAccounts(String phone) throws SQLException {
        Account account = null;
        try {
            String sql = "SELECT * FROM account WHERE phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setAvatar(rs.getString("avatar"));
                account.setPass(rs.getString("pass"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return account;
    }

    public void updateAccount(String phone, String email, String avatar) throws SQLException {
        String sql = "UPDATE account SET email = ?, avatar = ? WHERE phone = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, avatar);
            pstmt.setString(3, phone);
            pstmt.executeUpdate();
        }
    }

    public void updatePassAccountEmployees(String phone, String pass) throws SQLException {
        String sql = "UPDATE account SET pass = ? WHERE phone = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            pstmt.setString(2, pass);
            pstmt.executeUpdate();
        }
    }

//    public static void main(String[] args) {
//        AccountDAO a = new AccountDAO();
//        String phone = "0912345666"; // Thay thế bằng tên người dùng thử nghiệm
//        String pass = "password13"; // Thay thế bằng mật khẩu thử nghiệm
//        Account account = a.checkAuthentic(phone, pass);
//
//        // In thông tin tài khoản nếu đăng nhập thành công
//        if (account != null) {
//            System.out.println("Login successful!");
//            System.out.println("Phone: " + account.getPhone());
//            System.out.println("Pass: " + account.getPass());
//            System.out.println("Role ID: " + account.getRoleId());
//            System.out.println("Email: " + account.getEmail());
//            System.out.println("Gender: " + account.getGender());
//            System.out.println("Is Active: " + account.getIsActive());
//            System.out.println("Avatar: " + account.getAvatar());
//        } else {
//            System.out.println("Login failed: Invalid phone or pass");
//
//        }
//    }
    public static void main(String[] args) {

        String phone = "0912345269";
        AccountDAO d = new AccountDAO();
        System.out.println(d.getAccountByPhone(phone).getEmail());

    }

    public void updatePoints(int points, String phone) {
        try {
            String sql = "UPDATE [dbo].[account]\n"
                    + "   SET [points] = ?\n"
                    + " WHERE [phone] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, points);
            stm.setString(2, phone);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
