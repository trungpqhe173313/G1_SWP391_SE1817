/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
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

                resultList.add(row);
            }
        }
        return resultList;
    }
    
        public boolean updateEmployeeActiveStatus(int employeeId, boolean isActive) throws SQLException {
            String sql = "UPDATE [account] " +
                         "SET [account].isActive = ? " +
                         "FROM [account] " +
                         "JOIN [employee] ON [account].phone = [employee].phone " +
                         "WHERE [employee].employeeId = ?";

            int bitValue = isActive ? 1 : 0;

            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, bitValue);
                pstmt.setInt(2, employeeId);
                int rowsUpdated = pstmt.executeUpdate();
                return rowsUpdated > 0;
            }
        }



    public Map<String, Object> employeeProfile(String phone) throws SQLException {
        Map<String, Object> employeeInfo = new HashMap<>();

        String sql = "SELECT "
                + "   a.avatar, "
                + "   a.phone, "
                + "   e.employeeId, "
                + "   e.fullName, "
                + "   a.email, "
                + "   a.gender, "
                + "   r.role "
                + "FROM "
                + "   [account] a "
                + "JOIN "
                + "   [employee] e ON a.phone = e.phone "
                + "JOIN "
                + "   [role] r ON a.roleId = r.id "
                + "WHERE "
                + "   a.phone = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    employeeInfo.put("avatar", rs.getString("avatar"));
                    employeeInfo.put("phone", rs.getString("phone"));
                    employeeInfo.put("employeeId", rs.getInt("employeeId"));
                    employeeInfo.put("fullName", rs.getString("fullName"));
                    employeeInfo.put("email", rs.getString("email"));
                    employeeInfo.put("gender", rs.getBoolean("gender"));
                    employeeInfo.put("role", rs.getString("role"));
                } else {
                    System.out.println("User not found.");
                }
            }
        }
        return employeeInfo;
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

    public static void main(String[] args) {
        List<Employee> e = new EmployeesDAO().getBarberFree();
        System.out.println(e.size());
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

    public List<Employee> getBarberFree() {
        List<Employee> employee = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "FROM [Barber].[dbo].[employee]\n"
                    + "WHERE [statusEmployee] = 1\n"
                    + "ORDER BY [updateTime] DESC;";
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

}
