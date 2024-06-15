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
<<<<<<< Updated upstream
import Model.Accounts;
=======
import Model.Account;
>>>>>>> Stashed changes
import java.sql.Connection;
/**
 *
 * @author LINHNTHE170290
 */
public class AccountDAO extends DBContext{
<<<<<<< Updated upstream
    public List<Accounts> getAllAccount() {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Account where role != 3";
=======
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account where role != 1";
>>>>>>> Stashed changes
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
<<<<<<< Updated upstream
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
=======
                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
>>>>>>> Stashed changes
                account.setIsActive(rs.getBoolean("isActive"));      
                list.add(account);
            }
        } catch (SQLException e) {
            
        }
        return list;
    }
    
<<<<<<< Updated upstream
    public Accounts login(String phone, String pass) {
        String sql = "SELECT*FROM accounts where (phone = ?) and (password = ?)";
=======
    public Account login(String phone, String pass) {
        String sql = "SELECT*FROM account where (phone = ?) and (pass = ?)";
>>>>>>> Stashed changes
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
<<<<<<< Updated upstream
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
                

=======
                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setIsActive(rs.getBoolean("isActive"));    
>>>>>>> Stashed changes
                return account;
            }
        } catch (SQLException e) {
           
        }
        return null;
    }

<<<<<<< Updated upstream
   public Accounts checkAuthentic(String phone, String password) {
        String sql="select*from accounts where (phone=?) and (password=?)";
=======
   public Account checkAuthentic(String phone, String password) {
        String sql="select*from account where (phone=?) and (pass=?)";
>>>>>>> Stashed changes
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
<<<<<<< Updated upstream
                return new Accounts(
                    rs.getInt("id"),
                    phone,
                    password,
                    rs.getString("fullName"),
                    rs.getString("email"),
                    rs.getString("avatar"),
                    rs.getBoolean("isMale"),
                    rs.getInt("roleId"),
=======
                return new Account(
                    phone,
                    password,
                    rs.getInt("roleId"),
                    rs.getString("email"),
                    rs.getBoolean("gender"),
>>>>>>> Stashed changes
                    rs.getBoolean("isActive")
                );
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
   }
    
<<<<<<< Updated upstream
    public Accounts checkAccountExist(String phone) {
        try {
            String sql = "SELECT * FROM accounts WHERE phone = ?";
=======
    public Account checkAccountExist(String phone) {
        try {
            String sql = "SELECT * FROM account WHERE phone = ?";
>>>>>>> Stashed changes
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
<<<<<<< Updated upstream
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setPhone(rs.getString("phone"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
=======
                Account account = new Account();
                account.setPhone(rs.getString("phone"));
                account.setPass(rs.getString("pass"));
                account.setRoleId(rs.getInt("roleId"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
>>>>>>> Stashed changes
                account.setIsActive(rs.getBoolean("isActive"));
                return account;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
   public boolean checkEmailExist(String email) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {//1. Connect DB
            con = DBContext.connection;

            if (con != null) {
<<<<<<< Updated upstream
                String sql = " SELECT * FROM accounts WHERE email = ?";
=======
                String sql = " SELECT * FROM account WHERE email = ?";
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                String sql = "SELECT * FROM accounts WHERE email = ? AND password = ?";
=======
                String sql = "SELECT * FROM account WHERE email = ? AND pass = ?";
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
            String sql = "    Update [accounts] SET   password =?\n"
=======
            String sql = "    Update [account] SET   pass =?\n"
>>>>>>> Stashed changes
                    + "   WHERE [email] =?";
            //3. Create Statement
            stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, email);

            //4. Excute Query
            stm.executeUpdate();

        }

    }
  
<<<<<<< Updated upstream
   public void insertAccount(Accounts account) {
        String sql = "INSERT INTO accounts (phone, password, fullName, email, "
                + "avatar, isMale, roleId, isActive, createdAt, updatedAt) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
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
=======
   public void insertAccount(Account account) {
        String sql = "INSERT INTO account (phone, pass, roleId, email, "
                + "gender, isActive) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPhone());
            stm.setString(2, account.getPass());
            stm.setString(3, account.getEmail());
            stm.setInt(4, account.getRoleId());
            stm.setBoolean(5, account.getGender());
            stm.setBoolean(6, account.getIsActive());
>>>>>>> Stashed changes
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
<<<<<<< Updated upstream
        String phone = "0123456789"; // Thay thế bằng tên người dùng thử nghiệm
        String password = "password1"; // Thay thế bằng mật khẩu thử nghiệm
        Accounts account = a.checkAuthentic(phone, password);
=======
        String phone = "0912345666"; // Thay thế bằng tên người dùng thử nghiệm
        String password = "password13"; // Thay thế bằng mật khẩu thử nghiệm
        Account account = a.login(phone, password);
>>>>>>> Stashed changes

        // In thông tin tài khoản nếu đăng nhập thành công
        if (account != null) {
            System.out.println("Login successful!");
<<<<<<< Updated upstream
            System.out.println("Account ID: " + account.getId());
            System.out.println("Phone: " + account.getPhone());
            System.out.println("Password: " + account.getPassword());
            System.out.println("Full Name: " + account.getFullName());
            System.out.println("Email: " + account.getEmail());
            System.out.println("Avatar: " + account.getAvatar());
            System.out.println("Is Male: " + account.getIsMale());
            System.out.println("Role ID: " + account.getRoleId());
=======
            System.out.println("Phone: " + account.getPhone());
            System.out.println("Password: " + account.getPass());
            System.out.println("Role ID: " + account.getRoleId());
            System.out.println("Email: " + account.getEmail());
            System.out.println("Gender: " + account.getGender());
>>>>>>> Stashed changes
            System.out.println("Is Active: " + account.getIsActive());
        } else {
            System.out.println("Login failed: Invalid phone or password");

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



    
    
    

