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
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
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
                + "gender, isActive) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPhone());
            stm.setString(2, account.getPass());
            stm.setInt(3, account.getRoleId());
            stm.setString(4, account.getEmail());
            stm.setBoolean(5, account.getGender());
            stm.setBoolean(6, account.getIsActive());
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
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return account;
}


    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        String phone = "0912345666"; // Thay thế bằng tên người dùng thử nghiệm
        String pass = "password13"; // Thay thế bằng mật khẩu thử nghiệm
        Account account = a.checkAuthentic(phone, pass);

        // In thông tin tài khoản nếu đăng nhập thành công
        if (account != null) {
            System.out.println("Login successful!");
            System.out.println("Phone: " + account.getPhone());
            System.out.println("Pass: " + account.getPass());
            System.out.println("Role ID: " + account.getRoleId());
            System.out.println("Email: " + account.getEmail());
            System.out.println("Gender: " + account.getGender());
            System.out.println("Is Active: " + account.getIsActive());
            System.out.println("Avatar: " + account.getAvatar());
        } else {
            System.out.println("Login failed: Invalid phone or pass");

        }
    }
//    public static void main(String[] args) {
//    String email = "quypdhe173508@fpt.edu.vn";
//    AccountDAO dao = new AccountDAO();
//    
//    try {
//        boolean emailExists = dao.checkEmailExist(email);
//        System.out.println("Email exists: " + emailExists);
//    } catch (SQLException e) {
//        System.out.println("Error while checking email existence: " + e.getMessage());
//        e.printStackTrace();
//    }
//}

}
