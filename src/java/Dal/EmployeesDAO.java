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

        String sql =    "SELECT " +
                        "   a.avatar, " +
                        "   a.phone, " +
                        "   e.fullName, " +
                        "   a.email, " +
                        "   a.gender, " +
                        "   se.status AS status " +
                        "FROM " +
                        "   [account] a " +
                        "JOIN " +
                        "   [employee] e ON a.phone = e.phone " +
                        "LEFT JOIN " +
                        "   [statusEmployee] se ON e.statusEmployee = se.id";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

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
    public boolean updateEmployeeActiveStatus(int employeesId, boolean isActive) throws SQLException {
        String sql = "UPDATE account SET isActive = ? " +
                     "WHERE phone = (SELECT phone FROM employee WHERE employeeId = ?)";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setBoolean(1, isActive);
            pstmt.setInt(2, employeesId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
            }
        }
    }

