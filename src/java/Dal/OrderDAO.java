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
import java.util.Date;
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

    public int getNewOrderId() {
        int id = 0;
        try {

            String sql = "SELECT TOP 1 orderId\n"
                    + "FROM [order]\n"
                    + "ORDER BY orderId DESC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        System.out.println(o.getNewOrderId());
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

    public void AddOrder(Order o) {
        String sql = "INSERT INTO [dbo].[order]\n"
                + "           ([customerId]\n"
                + "           ,[statusID]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[shiftId]\n"
                + "           ,[updateTime])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql);) {

            st.setInt(1, o.getCustomerId());
            st.setInt(2, o.getStatusId());
            st.setDate(3, o.getOrderDate());
            st.setInt(4, o.getTotalAmount());
            st.setInt(5, o.getShiftsID());

            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void AddOrder_services(int servicesId, int orderId) {
        String sql = "INSERT INTO [dbo].[Order_services]\n"
                + "           ([servicesId]\n"
                + "           ,[OrderId])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql);) {

            st.setInt(1, servicesId);
            st.setInt(2, orderId);

            st.executeUpdate();

        } catch (SQLException e) {

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
