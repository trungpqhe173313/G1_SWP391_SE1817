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
import java.util.ArrayList;
import java.util.List;
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
                    + "  where [order].customerId = ? and [order].statusID = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getInt(4),
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
        List<Order> o = new OrderDAO().getAllOrder();
        System.out.println(o.size());
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

    public void upDateOrder(String date, String shift, String oId, int total) {
        try {
            String sql = "UPDATE [dbo].[order]\n"
                    + "   SET [orderDate] = ?\n"
                    + "      ,[totalAmount] = ?\n"
                    + "      ,[shiftId] = ?\n"
                    + "      \n"
                    + " WHERE [order].orderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            stm.setInt(2, total);
            stm.setString(3, shift);
            stm.setString(4, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Order> getAllOrder() {
        List<Order> ListOrder = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[order]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getInt(4),
                        rs.getDate(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8));
                ListOrder.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListOrder;
    }

    public void upDateStatusOrder(int i, String Oid) {
        try {
            String sql = "UPDATE [dbo].[order]\n"
                    + "   SET [statusID] = ?\n"
                    + " WHERE [orderId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, i);
            stm.setString(2, Oid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void upDateOrderAdmin(String Eid, String status, String oId, int total) {
        try {
            String sql = "UPDATE [dbo].[order]\n"
                    + "   SET [employeeId] = ?\n"
                    + "      ,[statusID] = ?\n"
                    + "      ,[totalAmount] = ?\n"
                    + " WHERE [orderId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Eid);
            stm.setString(2, status);
            stm.setInt(3, total);
            stm.setString(4, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
