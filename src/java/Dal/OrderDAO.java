/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamt
 */
public class OrderDAO extends DBContext {

    public Order getOrderByAId(int customerId) {
        try {

            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[order]\n"
                    + "  where [order].customerId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2)
                        , rs.getInt(3), rs.getInt(4), 
                        rs.getDate(5), rs.getInt(6), 
                        rs.getInt(7), rs.getString(8));
                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        Order o = new OrderDAO().getOrderByAId(1);
        System.out.println(o.getUpdateTime());
    }

    public void cancelBooking(String orderId) {
         try {
            String sql = "UPDATE [dbo].[order]\n"
                    + "   SET [statusID] = 5\n"
                    + "    \n"
                    + " WHERE [order].orderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
