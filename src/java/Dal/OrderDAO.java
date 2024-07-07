/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Order;
import Dal.ShiftsDAO;
import Model.Shift;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
            String sql = "WITH OrderedShifts AS (\n"
                    + "    SELECT \n"
                    + "        o.orderId,\n"
                    + "        o.orderCode,\n"
                    + "        o.customerId,\n"
                    + "        o.employeeId,\n"
                    + "        o.statusID,\n"
                    + "        o.orderDate,\n"
                    + "        o.totalAmount,\n"
                    + "        o.updateTime,\n"
                    + "        s.id AS shiftId,\n"
                    + "        s.startTime,\n"
                    + "        ROW_NUMBER() OVER (PARTITION BY o.orderId ORDER BY s.startTime) AS rn\n"
                    + "    FROM \n"
                    + "        Orders o\n"
                    + "    JOIN \n"
                    + "        Order_shift os ON o.orderId = os.OrderID\n"
                    + "    JOIN \n"
                    + "        shift s ON os.ShiftID = s.id\n"
                    + "    JOIN\n"
                    + "        customer c ON o.customerId = c.customerId\n"
                    + "    WHERE\n"
                    + "        o.customerId = ? and  o.statusID = 1\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    orderId,\n"
                    + "    orderCode,\n"
                    + "    customerId,\n"
                    + "    employeeId,\n"
                    + "    statusID,\n"
                    + "    orderDate,\n"
                    + "    totalAmount,\n"
                    + "    updateTime,\n"
                    + "    shiftId,\n"
                    + "    startTime\n"
                    + "FROM \n"
                    + "    OrderedShifts\n"
                    + "WHERE \n"
                    + "    rn = 1\n"
                    + "ORDER BY \n"
                    + "    orderId;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setCodeOrder(rs.getString(2));
                order.setCustomerId(rs.getInt(3));
                order.setEmployeeId(rs.getInt(4));
                order.setStatusId(rs.getInt(5));
                order.setOrderDate(rs.getDate(6));
                order.setTotalAmount(rs.getInt(7));
                order.setUpdateTime(rs.getString(8));
                Shift shift = new Shift();
                shift.setId(rs.getInt(9));
                shift.setStartTime(rs.getString(10));
                order.setShift(shift);
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
                    + "FROM [Orders]\n"
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

    public void cancelBooking(String orderId) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [statusID] = 5\n"
                    + "    \n"
                    + " WHERE [Orders].orderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void AddOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([orderCode]\n"
                + "           ,[customerId]\n"
                + "           ,[statusID]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[updateTime])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, o.getCodeOrder());
            st.setInt(2, o.getCustomerId());
            st.setInt(3, o.getStatusId());
            st.setDate(4, o.getOrderDate());
            st.setInt(5, o.getTotalAmount());
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

    public void upDateOrder(String date, String oId, int total) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [orderDate] = ?\n"
                    + "      ,[totalAmount] = ?\n"
                    + " WHERE [customerId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            stm.setInt(2, total);
            stm.setString(3, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Order> getAllOrder() {
        List<Order> ListOrder = new ArrayList<>();
        try {
            String sql = "WITH OrderedShifts AS (\n"
                    + "    SELECT \n"
                    + "        o.orderId,\n"
                    + "        o.orderCode,\n"
                    + "        o.customerId,\n"
                    + "        o.employeeId,\n"
                    + "        o.statusID,\n"
                    + "        o.orderDate,\n"
                    + "        o.totalAmount,\n"
                    + "        o.updateTime,\n"
                    + "        s.id AS shiftId,\n"
                    + "        s.startTime,\n"
                    + "        ROW_NUMBER() OVER (PARTITION BY o.orderId ORDER BY s.startTime) AS rn\n"
                    + "    FROM \n"
                    + "        Orders o\n"
                    + "    JOIN \n"
                    + "        Order_shift os ON o.orderId = os.OrderID\n"
                    + "    JOIN \n"
                    + "        shift s ON os.ShiftID = s.id\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    orderId,\n"
                    + "    orderCode,\n"
                    + "    customerId,\n"
                    + "    employeeId,\n"
                    + "    statusID,\n"
                    + "    orderDate,\n"
                    + "    totalAmount,\n"
                    + "    updateTime,\n"
                    + "    shiftId,\n"
                    + "    startTime\n"
                    + "FROM \n"
                    + "    OrderedShifts\n"
                    + "WHERE \n"
                    + "    rn = 1\n"
                    + "ORDER BY \n"
                    + "    orderId;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setCodeOrder(rs.getString(2));
                order.setCustomerId(rs.getInt(3));
                order.setEmployeeId(rs.getInt(4));
                order.setStatusId(rs.getInt(5));
                order.setOrderDate(rs.getDate(6));
                order.setTotalAmount(rs.getInt(7));
                order.setUpdateTime(rs.getString(8));
                Shift shift = new Shift();
                shift.setId(rs.getInt(9));
                shift.setStartTime(rs.getString(10));
                order.setShift(shift);
                ListOrder.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListOrder;
    }

    public void upDateStatusOrder(int i, String Oid) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
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
        if (Eid.trim().isEmpty()) {
            Eid = null;
        }
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [employeeId] = ?\n"
                    + "      ,[statusID] = ?\n"
                    + "      ,[totalAmount] = ?\n"
                    + " WHERE [orderId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (Eid != null) {
                stm.setString(1, Eid);
            } else {
                stm.setNull(1, java.sql.Types.VARCHAR);
            }
            stm.setString(2, status);
            stm.setInt(3, total);
            stm.setString(4, oId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Order> findOrdersByDate() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.*, s.* \n"
                + "FROM Orders o \n"
                + "JOIN Order_shift os ON o.orderId = os.OrderID \n"
                + "JOIN Shift s ON os.ShiftID = s.id \n"
                + "WHERE \n"
                + "    CAST(CONCAT(CONVERT(date, GETDATE()), ' ', s.startTime) AS DATETIME) \n"
                + "    BETWEEN DATEADD(MINUTE, 30, GETDATE()) AND DATEADD(MINUTE, 60, GETDATE());";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setId(resultSet.getInt("orderId"));
                order.setCodeOrder(resultSet.getString("orderCode"));
                order.setCustomerId(resultSet.getInt("customerId"));
                order.setEmployeeId(resultSet.getInt("employeeId"));
                order.setStatusId(resultSet.getInt("statusID"));
                order.setOrderDate(resultSet.getDate("orderDate"));
                order.setTotalAmount(resultSet.getInt("totalAmount"));
                order.setUpdateTime(resultSet.getString("updateTime"));

                Shift shift = new Shift();
                shift.setId(resultSet.getInt("id"));
                shift.setStartTime(resultSet.getString("startTime"));

                order.setShift(shift);
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        List<Order> k = o.findOrdersByDate();
        System.out.println(k);
    }
}
