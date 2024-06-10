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

/**
 *
 * @author ducth
 */
public class EmployeesDAO extends DBContext {
    public EmployeesDAO() {
        super();
    }

    public List<Map<String, Object>> getEmployeeServicesInfoUsingMap() throws SQLException {
        List<Map<String, Object>> resultList = new ArrayList<>();

        String sql = "SELECT " +
                     "a.phone, " +
                     "r.role, " +
                     "a.email, " +
                     "a.gender, " +
                     "e.fullName, " +
                     "STRING_AGG(s.name, ', ') AS services " +
                     "FROM account a " +
                     "JOIN role r ON a.roleId = r.id " +
                     "JOIN employee e ON a.phone = e.phone " +
                     "LEFT JOIN services_employee se ON e.employeeId = se.employeeId " +
                     "LEFT JOIN Services s ON se.servicesId = s.servicesId " +
                     "GROUP BY a.phone, r.role, a.email, a.gender, e.fullName";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("phone", rs.getString("phone"));
                row.put("role", rs.getString("role"));
                row.put("email", rs.getString("email"));
                row.put("gender", rs.getBoolean("gender"));
                row.put("fullName", rs.getString("fullName"));
                row.put("services", rs.getString("services"));

                resultList.add(row);
            }
        }

        return resultList;
    }
}
