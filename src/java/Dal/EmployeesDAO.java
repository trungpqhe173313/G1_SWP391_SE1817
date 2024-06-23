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
        String sql = "UPDATE account SET isActive = ? "
                + "WHERE phone = (SELECT phone FROM employee WHERE employeeId = ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setBoolean(1, isActive);
            pstmt.setInt(2, employeeId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        }
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
