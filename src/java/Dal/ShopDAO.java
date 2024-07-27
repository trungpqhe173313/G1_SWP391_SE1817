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
                + "FROM Orders\n"
                + "WHERE \n"
                + "    YEAR(orderDate) = YEAR(GETDATE())\n"
                + "    AND MONTH(orderDate) = ?\n"
                + "    AND statusID = 4\n"
                + "GROUP BY MONTH(orderDate);";
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

    public int getRevenueByBarber(int month, int employeeId) {
        int revenue = 0;
        String sql = "SELECT COALESCE(SUM(totalAmount), 0) AS TotalRevenue\n"
                + "FROM Orders\n"
                + "WHERE \n"
                + "    employeeId = ?\n"
                + "    AND MONTH(orderDate) = ?\n"
                + "    AND YEAR(orderDate) = YEAR(GETDATE())\n"
                + "    AND statusID IN (4);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, employeeId);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                revenue = rs.getInt("TotalRevenue");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return revenue;
    }

    public String getAvatarByEmployeeId(int employeeId) {
        String avatar = "";
        String sql = "SELECT a.avatar\n"
                + "FROM employee e\n"
                + "JOIN account a ON e.phone = a.phone\n"
                + "WHERE e.employeeId = ?;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, employeeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avatar = rs.getString("avatar");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return avatar;
    }

    public int getRevenueThisYear() {
        int revenue = 0;
        String sql = "SELECT SUM(totalAmount) AS Revenue\n"
                + "FROM [orders]\n"
                + "WHERE YEAR(orderDate) = YEAR(GETDATE()) and statusID=4;";
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
        String sql = "SELECT \n"
                + "    COUNT(orderId) AS TotalOrders\n"
                + "FROM Orders\n"
                + "WHERE \n"
                + "    YEAR(orderDate) = YEAR(GETDATE())\n"
                + "    AND MONTH(orderDate) = ?\n"
                + "    AND statusID = 4\n"
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

    public int getNumberOrderByBarber(int month, int employeeId) {
        int a = 0;
        String sql = "SELECT COUNT(*) AS TotalOrders\n"
                + "FROM Orders\n"
                + "WHERE \n"
                + "    employeeId = ?\n"
                + "    AND MONTH(orderDate) = ?\n"
                + "    AND YEAR(orderDate) = YEAR(GETDATE())\n"
                + "    AND statusID = 4;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, employeeId);
            st.setInt(2, month);
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
        String sql = "SELECT \n"
                + "    o.orderId,\n"
                + "     o.orderCode,\n"
                + "    o.customerId,\n"
                + "    o.employeeId,\n"
                + "    o.statusID,\n"
                + "    o.orderDate,\n"
                + "    o.totalAmount\n"
                + "FROM Orders o\n"
                + "WHERE \n"
                + "    MONTH(o.orderDate) = ?\n"
                + "    AND o.statusID = 4\n"
                + "    AND YEAR(o.orderDate) = YEAR(GETDATE());";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("orderId"));
                o.setCodeOrder(rs.getString("orderCode"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
                list.add(o);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public List<Order> getOrderFromTo(String startDate, String endDate) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    orderId,\n"
                + "    orderCode,\n"
                + "    customerId,\n"
                + "    employeeId,\n"
                + "    statusID,\n"
                + "    orderDate,\n"
                + "    totalAmount\n"
                + "FROM Orders\n"
                + "WHERE orderDate BETWEEN ? AND ?\n"
                + "  AND statusID = 4;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, startDate);
            st.setString(2, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("orderId"));
                o.setCodeOrder(rs.getString("orderCode"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
                list.add(o);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public List<Order> getOrderByBarber(int month, int employeeId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [orderId]\n"
                + "      ,[customerId]\n"
                + "      ,[employeeId]\n"
                + "      ,[statusID]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalAmount]\n"
                + "  FROM [dbo].[orders]\n"
                + "  WHERE MONTH(orderDate) = ? and employeeId = ?\n"
                + "  AND YEAR(orderDate) = YEAR(GETDATE()) and statusID=4;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            st.setInt(2, employeeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("orderId"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
                list.add(o);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public List<Order> getOrderByCustomerId(int id) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [orderId]\n"
                + "      ,[customerId]\n"
                + "      ,[employeeId]\n"
                + "      ,[statusID]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalAmount]\n"
                + "  FROM [dbo].[orders]\n"
                + "  WHERE customerId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("orderId"));
                o.setCustomerId(rs.getInt("customerId"));
                o.setEmployeeId(rs.getInt("employeeId"));
                o.setStatusId(rs.getInt("statusID"));
                o.setOrderDate(rs.getDate("orderDate"));
                o.setTotalAmount(rs.getInt("totalAmount"));
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
                + "  FROM [dbo].[orders]\n"
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
                c.setEmployeeId(rs.getInt("employeeId"));
                c.setFullName(rs.getString("fullName"));
                c.setPhone(rs.getString("phone"));
                return c;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return c;
    }

    public List<Employee> getAllEmployee() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT [employeeId]\n"
                + "      ,[fullName]\n"
                + "      ,[phone]\n"
                + "      ,[statusEmployee]\n"
                + "      ,[updateTime]\n"
                + "  FROM [dbo].[employee]";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee c = new Employee();
                c.setEmployeeId(rs.getInt("employeeId"));
                c.setFullName(rs.getString("fullName"));
                c.setPhone(rs.getString("phone"));
                list.add(c);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

    public List<Employee> getAllTop3Barber(int month) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT TOP 3\n"
                + "    e.[employeeId],\n"
                + "    e.[fullName],\n"
                + "	e.phone,\n"
                + "    SUM(o.[totalAmount]) AS TotalRevenue\n"
                + "FROM [orders] o\n"
                + "JOIN [employee] e ON o.[employeeId] = e.[employeeId]\n"
                + "WHERE MONTH(o.[orderDate]) = ?\n"
                + "  AND YEAR(o.[orderDate]) = YEAR(GETDATE())\n"
                + "  AND o.[statusID] IN (4)\n"
                + "GROUP BY e.[employeeId], e.[fullName], e.phone\n"
                + "ORDER BY TotalRevenue DESC;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee c = new Employee();
                c.setEmployeeId(rs.getInt("employeeId"));
                c.setFullName(rs.getString("fullName"));
                c.setPhone(rs.getString("phone"));
                list.add(c);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
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

    public List<Shift> getListShiftByOrderId(int id) {
        List<Shift> list = new ArrayList<>();
        String sql = "SELECT s.id AS ShiftID, s.startTime\n"
                + "FROM Order_shift os\n"
                + "JOIN shift s ON os.ShiftID = s.id\n"
                + "WHERE os.OrderID = ?;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shift shift = new Shift();
                shift.setId(rs.getInt("ShiftID"));
                shift.setStartTime(rs.getString("startTime"));
                list.add(shift);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
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
                + "FROM dbo.[orders]\n"
                + "WHERE \n"
                + "    YEAR(orderDate) = YEAR(GETDATE())\n"
                + "GROUP BY \n"
                + "    MONTH(orderDate)\n"
                + "ORDER BY \n"
                + "    MONTH(orderDate) DESC;";
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
        List<Order> e = d.getOrderByMonth(6);
        for (Order o : e) {
            System.out.println(o.toString());
        }
        System.out.println("revenue month this year: " + d.getStatusById(4).getName());
    }
}
