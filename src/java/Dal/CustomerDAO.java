/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;

import Model.Account;
import Model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class CustomerDAO extends DBContext {

    
    public CustomerDAO() {
        super();
    }

    public Customer getCustomerProfile(String phone) {
        String sql = "SELECT "
                + "   c.customerId, "
                + "   c.fullName, "
                + "   a.phone, "
                + "   a.pass, "
                + "   a.roleId, "
                + "   a.email, "
                + "   a.gender, "
                + "   a.isActive, "
                + "   a.avatar "
                + "FROM "
                + "   account a "
                + "JOIN "
                + "   customer c ON a.phone = c.phone "
                + "WHERE "
                + "   c.phone = ?";

        Customer customer = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, phone);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve account information
                    Account account = new Account();
                    account.setPhone(rs.getString("phone"));
                    account.setPass(rs.getString("pass"));
                    account.setRoleId(rs.getInt("roleId"));
                    account.setEmail(rs.getString("email"));
                    account.setGender(rs.getBoolean("gender"));
                    account.setIsActive(rs.getBoolean("isActive"));
                    account.setAvatar(rs.getString("avatar"));

                    // Retrieve customer information
                    customer = new Customer();
                    customer.setCustomerId(rs.getInt("customerId"));
                    customer.setFullName(rs.getString("fullName"));
                    customer.setPhone(rs.getString("phone")); // Phone from accounts table

                    // Set the account object into customer
                    customer.setAccount(account);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customer;
    }

    public static void main(String[] args) {
        CustomerDAO customerdao = new CustomerDAO();
        String phone = "0912345669";
        Customer customer = customerdao.getCustomerProfile(phone);
        if (customer != null) {
            System.out.println("Successful!");
            System.out.println("Customer Information:");
            System.out.println("customerId: " + customer.getCustomerId());
            System.out.println("fullName: " + customer.getFullName());
            System.out.println("phone: " + customer.getPhone());
            System.out.println("Account Information:");
            System.out.println("phone: " + customer.getAccount().getPhone());
            System.out.println("pass: " + customer.getAccount().getPass());
            System.out.println("role Id: " + customer.getAccount().getRoleId());
            System.out.println("email: " + customer.getAccount().getEmail());
            System.out.println("gender: " + customer.getAccount().getGender());
            System.out.println("is Active: " + customer.getAccount().getIsActive());
            System.out.println("avatar: " + customer.getAccount().getAvatar());
        } else {
            System.out.println("Failed: Invalid customer id!");
        }
    }

}
