/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.PreparedStatement;
/**
 *
 * @author ducth
 */
public class EmployeesDAO extends DBContext {
    public EmployeesDAO() {
        super();
    }

    public List<Map<String, Object>> getEmployeeServicesInfo() throws SQLException {
        List<Map<String, Object>> resultList = new ArrayList<>();

        String sql = "SELECT " +
                     "a.phone, " +
                     "r.role, " +
                     "a.email, " +
                     "a.gender, " +
                     "a.isActive, " +
                     "e.employeesId, " + // Include employeesId here
                     "e.fullName, " +
                     "STRING_AGG(s.name, ', ') AS services " +
                     "FROM accounts a " +
                     "JOIN roles r ON a.rolesId = r.id " +
                     "JOIN employees e ON a.phone = e.phone " +
                     "LEFT JOIN services_employees se ON e.employeesId = se.employeesId " +
                     "LEFT JOIN Services s ON se.servicesId = s.servicesId " +
                     "GROUP BY a.phone, r.role, a.email, a.gender, a.isActive, e.employeesId, e.fullName";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("phone", rs.getString("phone"));
                row.put("role", rs.getString("role"));
                row.put("email", rs.getString("email"));
                row.put("gender", rs.getBoolean("gender"));
                row.put("isActive", rs.getBoolean("isActive"));
                row.put("employeesId", rs.getInt("employeesId"));
                row.put("fullName", rs.getString("fullName"));
                row.put("services", rs.getString("services"));

                resultList.add(row);
            }
        }

        return resultList;
    }
    public boolean updateEmployeeActiveStatus(int employeesId, boolean isActive) throws SQLException {
        String sql = "UPDATE accounts SET isActive = ? " +
                     "WHERE phone = (SELECT phone FROM employees WHERE employeesId = ?)";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setBoolean(1, isActive);
            pstmt.setInt(2, employeesId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
            }
        }
    }

