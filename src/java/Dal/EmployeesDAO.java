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
        String sql = "UPDATE [account] "
                + "SET [account].isActive = ? "
                + "FROM [account] "
                + "JOIN [employee] ON [account].phone = [employee].phone "
                + "WHERE [employee].employeeId = ?";

        int bitValue = isActive ? 1 : 0;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, bitValue);
            pstmt.setInt(2, employeeId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public Employee getAllEmployees(String phone) throws SQLException {
        Employee employee = null;
        try {
            String sql = "SELECT * FROM employee WHERE phone = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                employee = new Employee();
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
                + " e.fullName, "
                + " a.phone, "
                + " CASE WHEN a.gender = 1 THEN 'Nam' ELSE 'Nu' END AS gender, "
                + " a.email, "
                + " se.status, "
                + " c.fullName AS customerFullName, "
                + " o.orderId, "
                + " STUFF(( "
                + "     SELECT ', ' + s.name "
                + "     FROM [Order_services] os "
                + "     JOIN [Services] s ON os.servicesId = s.servicesId "
                + "     WHERE os.OrderId = o.orderId "
                + "     FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS serviceNames "
                + " FROM "
                + "     [employee] e "
                + " JOIN "
                + "     [account] a ON e.phone = a.phone "
                + " LEFT JOIN "
                + "     [statusEmployee] se ON e.statusEmployee = se.id "
                + " JOIN "
                + "     [order] o ON e.employeeId = o.employeeId "
                + " JOIN "
                + "     [customer] c ON o.customerId = c.customerId "
                + " WHERE "
                + "     se.id = 2 AND a.isActive = 1 "
                + " GROUP BY "
                + "     e.fullName, "
                + "     a.phone, "
                + "     a.gender, "
                + "     a.email, "
                + "     se.status, "
                + "     c.fullName, "
                + "     o.orderId";

        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("fullName", rs.getString("fullName"));
                row.put("phone", rs.getString("phone"));
                row.put("gender", rs.getString("gender")); // Đảm bảo rằng tên cột phù hợp ở đây
                row.put("email", rs.getString("email"));
                row.put("status", rs.getString("status"));
                row.put("customerFullName", rs.getString("customerFullName")); // Đảm bảo rằng tên cột phù hợp ở đây
                row.put("orderId", rs.getString("orderId"));
                row.put("serviceNames", rs.getString("serviceNames")); // Thêm serviceNames vào Map

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
}
