package Dal;

import Model.Customer;
import Model.Employee;
import Model.Order;
import Model.Services;
import Model.Shift;
import Model.Status;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * ShopDAO class This class provides methods to interact with the database for
 * shop-related operations.
 */
public class ShopDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(ShopDAO.class.getName());

    public int getRevenueByMonth(int month) {
        int revenue = 0;
        String sql = "SELECT \n"
                + "    SUM(totalAmount) AS TotalRevenue\n"
                + "FROM [order]\n"
                + "WHERE YEAR(orderDate) = YEAR(GETDATE())\n"
                + "and MONTH(orderDate) = ?\n"
                + "GROUP BY MONTH(orderDate)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt("TotalRevenue");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return revenue;
    }

    public int getRevenueThisYear() {
        int revenue = 0;
        String sql = "SELECT SUM(totalAmount) AS Revenue\n"
                + "FROM [order]\n"
                + "WHERE YEAR(orderDate) = YEAR(GETDATE());";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt("Revenue");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return revenue;
    }

    public int getNumberOrderByMonth(int month) {
        int a = 0;
        String sql = "SELECT  \n"
                + "    COUNT(orderId) AS TotalOrders\n"
                + "FROM [order]\n"
                + "WHERE YEAR(orderDate) = YEAR(GETDATE())\n"
                + "and MONTH(orderDate) = ?\n"
                + "GROUP BY MONTH(orderDate);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = rs.getInt("TotalOrders");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return a;
    }

    public List<Order> getOrderByMonth(int month) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [orderId]\n"
                + "      ,[customerId]\n"
                + "      ,[employeeId]\n"
                + "      ,[statusID]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalAmount]\n"
                + "      ,[shiftId]\n"
                + "      ,[updateTime]\n"
                + "  FROM [dbo].[order]\n"
                + "  WHERE MONTH(orderDate) = ? \n"
                + "  AND YEAR(orderDate) = YEAR(GETDATE());";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("orderId"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
                o.setShiftsID(rs.getInt("shiftId"));
                o.setUpdateTime(rs.getString("updateTime"));
                list.add(o);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public Order getOrderById(int id) {
        Order o = new Order();
        String sql = "SELECT [orderId]\n"
                + "      ,[customerId]\n"
                + "      ,[employeeId]\n"
                + "      ,[statusID]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalAmount]\n"
                + "      ,[shiftId]\n"
                + "      ,[updateTime]\n"
                + "  FROM [dbo].[order]\n"
                + "  where orderId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                o.setId(rs.getInt("orderId"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
                o.setShiftsID(rs.getInt("shiftId"));
                o.setUpdateTime(rs.getString("updateTime"));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return o;
    }

    public Customer getCustomerById(int id) {
        Customer c = new Customer();
        String sql = "SELECT [customerId]\n"
                + "      ,[fullName]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[customer] \n"
                + "  where customerId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                c.setCustomerId(rs.getInt("customerId"));
                c.setFullName(rs.getString("fullName"));
                c.setPhone(rs.getString("phone"));
                return c;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return c;
    }

    public Employee getEmployeeById(int id) {
        Employee c = new Employee();
        String sql = "SELECT [employeeId]\n"
                + "      ,[fullName]\n"
                + "      ,[phone]\n"
                + "      ,[statusEmployee]\n"
                + "      ,[updateTime]\n"
                + "  FROM [dbo].[employee]\n"
                + "  where employeeId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                c.setEmployeesId(rs.getInt("employeeId"));
                c.setFullName(rs.getString("fullName"));
                c.setPhone(rs.getString("phone"));
                return c;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return c;
    }

    public List<Services> getServicesByOrderId(int id) {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT s.[servicesId]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Services] s join dbo.Order_services o\n"
                + "  on s.servicesId = o.servicesId\n"
                + "  where o.OrderId =? and isActive = 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Services s = new Services();
                s.setServicesId(rs.getInt("servicesId"));
                s.setName(rs.getString("name"));
                s.setImage(rs.getString("image"));
                s.setPrice(rs.getInt("price"));
                s.setDescription(rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public Shift getShiftById(int id) {
        Shift s = new Shift();
        String sql = "SELECT [id]\n"
                + "      ,[startTime]\n"
                + "  FROM [dbo].[shift]\n"
                + "  where id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setStartTime(rs.getString("startTime"));
                return s;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return s;
    }

    public Status getStatusById(int id) {
        Status s = new Status();
        String sql = "SELECT [id]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[status]\n"
                + "  where id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("status"));
                return s;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return s;
    }

    public List<Integer> getMonthRevenue() {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    MONTH(orderDate) AS month\n"
                + "FROM dbo.[order]\n"
                + "WHERE \n"
                + "    YEAR(orderDate) = YEAR(GETDATE())\n"
                + "GROUP BY \n"
                + "    MONTH(orderDate)\n"
                + "ORDER BY \n"
                + "    MONTH(orderDate);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("month"));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public static void main(String[] args) {
        ShopDAO d = new ShopDAO();
        System.out.println(d.getOrderByMonth(6));
//        List<Order> e = d.getOrderByMonth(2);
//        for (Order o : e) {
//            System.out.println(e.toString());
//        }
    }
}
