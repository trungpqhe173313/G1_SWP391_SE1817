/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Account;
import Model.Employee;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ducth
 */
public class EmployeesDAO extends DBContext {

    public List<Map<String, Object>> getEmployeeServicesInfo() throws SQLException {
        List<Map<String, Object>> resultList = new ArrayList<>();

        String sql = "SELECT "
                + "   a.avatar, "
                + "   a.phone, "
                + "   e.employeeId, "
                + "   e.fullName, "
                + "   CAST(e.updateTime AS DATE) AS updateTime, "
                + "   a.email, "
                + "   a.isActive,"
                + "   a.gender, "
                + "   se.status AS status "
                + "FROM "
                + "   [account] a "
                + "JOIN "
                + "   [employee] e ON a.phone = e.phone "
                + "LEFT JOIN "
                + "   [statusEmployee] se ON e.statusEmployee = se.id "
                + "WHERE "
                + "   a.isActive = 1";

        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("avatar", rs.getString("avatar"));
                row.put("phone", rs.getString("phone"));
                row.put("employeeId", rs.getInt("employeeId"));
                row.put("fullName", rs.getString("fullName"));
                row.put("updateTime", rs.getString("updateTime"));
                row.put("email", rs.getString("email"));
                row.put("gender", rs.getBoolean("gender"));
                row.put("status", rs.getString("status"));
                row.put("isActive", rs.getString("isActive"));

                resultList.add(row);
            }
        }

        return resultList;
    }

    public List<Map<String, Object>> getEmployeeResign() throws SQLException {
        List<Map<String, Object>> resultList = new ArrayList<>();

        String sql = "SELECT "
                + "   a.avatar, "
                + "   a.phone, "
                + "   e.employeeId, "
                + "   e.fullName, "
                + "   CAST(a.updateTime AS DATE) AS updateTime, "
                + "   a.email, "
                + "   a.isActive,"
                + "   a.gender, "
                + "   se.status AS status "
                + "FROM "
                + "   [account] a "
                + "JOIN "
                + "   [employee] e ON a.phone = e.phone "
                + "LEFT JOIN "
                + "   [statusEmployee] se ON e.statusEmployee = se.id "
                + "WHERE "
                + "   a.isActive = 0";

        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("avatar", rs.getString("avatar"));
                row.put("phone", rs.getString("phone"));
                row.put("employeeId", rs.getInt("employeeId"));
                row.put("fullName", rs.getString("fullName"));
                row.put("updateTime", rs.getString("updateTime"));
                row.put("email", rs.getString("email"));
                row.put("gender", rs.getBoolean("gender"));
                row.put("status", rs.getString("status"));
                row.put("isActive", rs.getString("isActive"));

                resultList.add(row);
            }
        }
        return resultList;
    }

    public boolean updateEmployeeActiveStatus(int employeeId, boolean isActive) throws SQLException {
        String sql = "UPDATE a "
                + "SET a.isActive = ?, "
                + "    a.updateTime = GETDATE() "
                + "FROM [account] a "
                + "JOIN [employee] e ON a.phone = e.phone "
                + "WHERE e.employeeId = ?";

        int bitValue = isActive ? 1 : 0;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, bitValue);
            pstmt.setInt(2, employeeId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public Employee getAllEmployees(String phone)  {
        Employee employee = null;
        try {
            String sql = "SELECT * FROM employee WHERE phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                employee = new Employee();
                employee.setEmployeeId(rs.getInt(1));
                employee.setFullName(rs.getString("fullName"));
                employee.setPhone(rs.getString("phone"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return employee;
    }

    public void updateEmployee(String phone, String fullName) throws SQLException {
        String sql = "UPDATE employee SET fullName = ? WHERE phone = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, fullName);
            pstmt.setString(2, phone);
            pstmt.executeUpdate();
        }
    }

public List<Map<String, Object>> getWorkingEmployees() throws SQLException {
    List<Map<String, Object>> resultList = new ArrayList<>();
    String sql = "SELECT "
            + "e.fullName AS employeeFullName, "
            + "e.phone AS employeePhone, "
            + "a.gender AS employeeGender, "
            + "a.email AS employeeEmail, "
            + "se.status AS workStatus, "
            + "c.fullName AS customerFullName, "
            + "o.orderId AS orderId, "
            + "STRING_AGG(s.name, ', ') AS serviceNames "
            + "FROM "
            + "employee e "
            + "JOIN account a ON e.phone = a.phone "
            + "JOIN statusEmployee se ON e.statusEmployee = se.id "
            + "LEFT JOIN Orders o ON e.employeeId = o.employeeId "
            + "LEFT JOIN Order_services os ON o.orderId = os.orderId "
            + "LEFT JOIN Services s ON os.servicesId = s.servicesId "
            + "LEFT JOIN customer c ON o.customerId = c.customerId "
            + "JOIN status st ON o.statusID = st.id "
            + "WHERE "
            + "se.status = N'Đang Bận' "
            + "AND st.status = N'Bắt Đầu' "
            + "GROUP BY "
            + "e.fullName, "
            + "e.phone, "
            + "a.gender, "
            + "a.email, "
            + "se.status, "
            + "c.fullName, "
            + "o.orderId";

    try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("employeeFullName", rs.getString("employeeFullName"));
            row.put("employeePhone", rs.getString("employeePhone"));
            row.put("employeeGender", rs.getString("employeeGender"));
            row.put("employeeEmail", rs.getString("employeeEmail"));
            row.put("workStatus", rs.getString("workStatus"));
            row.put("customerFullName", rs.getString("customerFullName"));
            row.put("orderId", rs.getString("orderId"));
            row.put("serviceNames", rs.getString("serviceNames"));

            resultList.add(row);
        }
    }

    return resultList;
}


    public List<Employee> getAllEmployee() {
        List<Employee> employee = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[employee]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3));
                employee.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }

    public void updateStatusBarber(int i, String Eid) {
        try {
            String sql = "UPDATE [dbo].[employee]\n"
                    + "   SET [statusEmployee] = ?\n"
                    + " WHERE [employeeId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, i);
            stm.setString(2, Eid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Employee getBarberFree() {
        try {
            String sql = "SELECT top (1) *\n"
                    + "FROM [Barber].[dbo].[employee]\n"
                    + "WHERE [statusEmployee] = 1\n"
                    + "ORDER BY [updateTime] ASC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Employee(rs.getInt(1), rs.getString(2), rs.getString(3));

            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Employee getBarberByID(String Eid) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[employee] \n"
                    + "  where employeeId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Eid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Employee(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countNumberActiveEmployee() {
        int count = 0;
        String sql = "SELECT COUNT(employeeId) AS ActiveEmployeeCount\n"
                + "FROM employee e\n"
                + "JOIN account a ON e.phone = a.phone\n"
                + "WHERE a.isActive = 1\n"
                + "and e.statusEmployee <> 3;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ActiveEmployeeCount");
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    public static void main(String[] args) {
        EmployeesDAO d = new EmployeesDAO();
        System.out.println(d.countNumberActiveEmployee());
    }

    public List<Employee> getAllBarberFree() {
        List<Employee> employee = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Barber].[dbo].[employee]\n"
                    + "  where statusEmployee = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3));
                employee.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }
public boolean addEmployee(String phone, String fullName, String pass, String email, boolean gender, int statusEmployee, String avatar) {
    String sqlCustomer = "INSERT INTO customer (phone, fullName) VALUES (?, ?);";
    String sqlAccount = "INSERT INTO account (phone, pass, roleId, email, gender, isActive, points, avatar, updateTime) VALUES (?, ?, 2, ?, ?, 1, NULL, ?, GETDATE());";
    String sqlEmployee = "INSERT INTO employee (fullName, phone, statusEmployee, createdAt, updateTime) VALUES (?, ?, 1, GETDATE(), GETDATE());";

    try (PreparedStatement pstmtCustomer = connection.prepareStatement(sqlCustomer);
         PreparedStatement pstmtAccount = connection.prepareStatement(sqlAccount);
         PreparedStatement pstmtEmployee = connection.prepareStatement(sqlEmployee)) {

        // Set parameters for the customer insert
        pstmtCustomer.setString(1, phone);
        pstmtCustomer.setString(2, fullName);
        int affectedRowsCustomer = pstmtCustomer.executeUpdate();

        // Set parameters for the account insert
        pstmtAccount.setString(1, phone);
        pstmtAccount.setString(2, pass);
        pstmtAccount.setString(3, email);
        pstmtAccount.setBoolean(4, gender);
        pstmtAccount.setString(5, avatar);
        int affectedRowsAccount = pstmtAccount.executeUpdate();

        // Set parameters for the employee insert
        pstmtEmployee.setString(1, fullName);
        pstmtEmployee.setString(2, phone);
        int affectedRowsEmployee = pstmtEmployee.executeUpdate();

        // Check if all inserts were successful
        return affectedRowsCustomer > 0 && affectedRowsAccount > 0 && affectedRowsEmployee > 0;

    } catch (SQLException e) {
        Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, e);
        return false;
    }
}
    public boolean phoneExists(String phone) {
        String sql = "SELECT COUNT(*) FROM [account] WHERE phone = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
public List<Map<String, Object>> getOrdersByStatus(int employeeId, String status, boolean checkEmployeeStatus) throws SQLException {
    List<Map<String, Object>> resultList = new ArrayList<>();

    String sql = "SELECT "
            + "   o.orderId, "
            + "   o.orderCode, "
            + "   o.orderDate, "
            + "   o.totalAmount, "
            + "   o.updateTime, "
            + "   c.fullName AS customerName, "
            + "   e.fullName AS employeeName, "
            + "   st.status AS status, "
            + "   STRING_AGG(srv.name, ', ') AS serviceNames "
            + "FROM "
            + "   Orders o "
            + "INNER JOIN "
            + "   customer c ON o.customerId = c.customerId "
            + "INNER JOIN "
            + "   employee e ON o.employeeId = e.employeeId "
            + "INNER JOIN "
            + "   status st ON o.statusID = st.id "
            + "INNER JOIN "
            + "   Order_services os ON o.orderId = os.orderId "
            + "INNER JOIN "
            + "   Services srv ON os.servicesId = srv.servicesId "
            + "WHERE "
            + "   e.employeeId = ? AND st.status = ?";

    if (checkEmployeeStatus) {
        sql += " AND e.statusEmployee = (SELECT id FROM statusEmployee WHERE [status] = N'Đang Bận')";
    }

    sql += " GROUP BY "
            + "   o.orderId, "
            + "   o.orderCode, "
            + "   o.orderDate, "
            + "   o.totalAmount, "
            + "   o.updateTime, "
            + "   c.fullName, "
            + "   e.fullName, "
            + "   st.status";

    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setInt(1, employeeId);
        pstmt.setString(2, status);
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("orderCode", rs.getString("orderCode"));
                row.put("orderDate", rs.getDate("orderDate"));
                row.put("totalAmount", rs.getInt("totalAmount"));
                row.put("updateTime", rs.getTimestamp("updateTime"));
                row.put("customerName", rs.getString("customerName"));
                row.put("employeeName", rs.getString("employeeName"));
                row.put("status", rs.getString("status"));
                row.put("serviceNames", rs.getString("serviceNames"));

                resultList.add(row);
            }
        }
    }

    return resultList;
}

public List<Map<String, Object>> getInProgressOrders(int employeeId) throws SQLException {
    return getOrdersByStatus(employeeId, "Bắt Đầu", true);
}

public List<Map<String, Object>> getCompletedOrders(int employeeId) throws SQLException {
    return getOrdersByStatus(employeeId, "Thanh Toán", false);
}



    public int getEmployeeId(String phone) {
        int employeeId = -1; // Default value if no employee is found
        String sql = "SELECT employeeId FROM employee WHERE phone = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    employeeId = rs.getInt("employeeId");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return employeeId;
    }
    public boolean updateStatusFromAvailableToBusy(int employeeId) {
        String sql = "UPDATE employee "
                   + "SET statusEmployee = 1, "  // Assuming 2 is the ID for "Đang Bận"
                   + "    updateTime = GETDATE() "
                   + "WHERE statusEmployee = 2 AND employeeId = ?"; // Assuming 1 is the ID for "Đang Rảnh"

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, employeeId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
