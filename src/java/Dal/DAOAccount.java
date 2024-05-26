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


public class DAOAccount extends DBContext{
   
    
    public Accounts login(String user, String pass) {
        String sql = "SELECT*FROM Account where username = ? and password = ?";
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setCreateAt(rs.getTimestamp("createAt"));
                account.setUpdatedAt(rs.getTimestamp("updatedAt"));

                return account;
            }
        } catch (SQLException e) {
           
        }
        return null;
    }

   public Accounts checkAuthentic(String user, String pass) {
        String sql="select*from Account where accountname=? and password=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
               return new Accounts(
                    rs.getInt("id"),
                    user,
                    pass,
                    rs.getString("fullName"),
                    rs.getString("email"),
                    rs.getString("avatar"),
                    rs.getBoolean("isMale"),
                    rs.getInt("roleId"),
                    rs.getBoolean("isActive"),
                    rs.getTimestamp("createAt"),
                    rs.getTimestamp("updatedAt")
);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
   }
    
    public Accounts checkAccountExist(String user) {
        try {
            String sql = "SELECT * FROM Account WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts();
                account.setId(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("fullName"));
                account.setEmail(rs.getString("email"));
                account.setAvatar(rs.getString("avatar"));
                account.setIsMale(rs.getBoolean("isMale"));
                account.setRoleId(rs.getInt("roleId"));
                account.setIsActive(rs.getBoolean("isActive"));
                account.setCreateAt(rs.getTimestamp("createAt"));
                account.setUpdatedAt(rs.getTimestamp("updatedAt"));
                return account;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
  
   public void insertAccount(Accounts account) {
        String sql = "INSERT INTO Account (username, password, fullName, email, "
                + "avatar, isMale, roleId, isActive, createAt, updatedAt) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getFullName());
            stm.setString(4, account.getEmail());
            stm.setString(5, account.getAvatar());
            stm.setBoolean(6, account.getIsMale());
            stm.setInt(7, account.getRoleId());
            stm.setBoolean(8, account.getIsActive());
            stm.setTimestamp(9, account.getCreateAt());
            stm.setTimestamp(10, account.getUpdatedAt());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    
}


    
    
    

