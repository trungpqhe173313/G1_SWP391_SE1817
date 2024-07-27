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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("ddMMyyyy");
    private static int currentNumber = 1;
    private static String lastDate = DATE_FORMAT.format(new Date());

    public static synchronized String generateOrderCode() {
        String lastOrderCode = new OrderDAO().getLastOrderCodeFromDatabase();
        if (lastOrderCode == null || lastOrderCode.isEmpty()) {
            return generateNewOrderCode();
        }

        // Tách ngày và số thứ tự từ mã đơn hàng cuối cùng
        String datePart = lastOrderCode.substring(0, 8);
        String numberPart = lastOrderCode.substring(10); // "BK" chiếm 2 ký tự

        lastDate = datePart;
        currentNumber = Integer.parseInt(numberPart) + 1;

        // Kiểm tra nếu ngày hiện tại khác với ngày của mã đơn hàng cuối cùng
        String currentDate = DATE_FORMAT.format(new Date());
        if (!currentDate.equals(lastDate)) {
            currentNumber = 1; // Reset số thứ tự khi ngày thay đổi
            lastDate = currentDate;
        }

        // Tạo mã đơn hàng mới
        String orderCode = currentDate + "BK" + String.format("%03d", currentNumber);
        return orderCode;
    }

    
    public String getLastOrderCodeFromDatabase() {
        String lastOrderCode = null;
        String sql = "SELECT TOP 1 [orderId], [orderCode]\n"
                + "FROM [Barber].[dbo].[Orders]\n"
                + "ORDER BY [orderId] DESC";
        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet resultSet = stm.executeQuery()) {

            if (resultSet.next()) {
                lastOrderCode = resultSet.getString(2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastOrderCode;
    }
//    public static void main(String[] args) {
//        String i = OrderDAO.generateOrderCode();
//        System.out.println("day la generate code");
//        System.out.println(i);
//    }

    private static String generateNewOrderCode() {
        String currentDate = DATE_FORMAT.format(new Date());
        return currentDate + "BK001";
    }

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

    public int countOrderNotCompleteByCustomerId(int id, String date) {
        int count = 0;
        try {

            String sql = "SELECT COUNT(*)\n"
                    + "FROM Orders\n"
                    + "WHERE customerId = ?\n"
                    + "  AND orderDate = ?\n"
                    + "  AND statusID NOT IN (4, 5);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, date);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
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
                + "           ,[employeeId]\n"
                + "           ,[statusID]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[updateTime])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, o.getCodeOrder());
            st.setInt(2, o.getCustomerId());
            if (o.getEmployeeId() != 0) {
                st.setInt(3, o.getEmployeeId());
            } else {
                st.setNull(3, java.sql.Types.INTEGER);
            }
            st.setInt(4, o.getStatusId());
            st.setDate(5, o.getOrderDate());
            st.setInt(6, o.getTotalAmount());
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
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
                + "    BETWEEN DATEADD(MINUTE, 30, GETDATE()) AND DATEADD(MINUTE, 60, GETDATE())\n"
                + "    AND CAST(o.OrderDate AS DATE) = CAST(GETDATE() AS DATE);";

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

    public void upDateStatusOrderByCode(int i, String codeOrder) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [statusID] = ?\n"
                    + " WHERE [orderCode] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, i);
            stm.setString(2, codeOrder);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAmountOrder(int newAmount, String vnp_TxnRef) {
        try {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [totalAmount] = ?\n"
                    + " WHERE [orderCode] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, newAmount);
            stm.setString(2, vnp_TxnRef);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Order getOrderByCode(String codeOrder) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[Orders]\n"
                    + "  where orderCode = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, codeOrder);
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
                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//    public static void main(String[] args) {
//        OrderDAO o = new OrderDAO();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        //ep kieu string sang date truoc roi tao ra mot cai sql date
//        java.sql.Date date;
//        try {
//            date = new java.sql.Date(sdf.parse("2024-07-28").getTime());
//            o.AddOrder(new Order("asdf", 2, 1, date, 200));
//        } catch (ParseException ex) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        System.out.println(o.countOrderNotCompleteByCustomerId(5, "2024-07-05"));
//    }
}
