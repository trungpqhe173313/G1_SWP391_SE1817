/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Customer;
import Model.Services;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class CustomerDAO extends DBContext {

    public Customer getCustomerByP(String phone) {

        try {

            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[customer]\n"
                    + "  where phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getInt(1),
                        rs.getString(2), rs.getString(3));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        List<Customer> c = new CustomerDAO().getAllCustomer();
        System.out.println(c.size());
    }

    public List<Customer> getAllCustomer() {
        List<Customer> customer = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[customer]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt(1),
                        rs.getString(2), rs.getString(3));
                customer.add(c);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }
}
