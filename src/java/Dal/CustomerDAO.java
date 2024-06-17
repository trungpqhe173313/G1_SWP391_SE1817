/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class CustomerDAO extends DBContext{

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
        Customer c = new CustomerDAO().getCustomerByPhone("0912345669");
        System.out.println(c.getFullName());
    }
}
