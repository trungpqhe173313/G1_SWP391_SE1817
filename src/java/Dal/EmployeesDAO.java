/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Employees;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Accounts;
import Model.Roles;
import java.util.Date;

/**
 *
 * @author ducth
 */
public class EmployeesDAO {

    public List<Object[]> getAllEmployees() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT a.fullName, e.dateOfBirth, r.name AS roleName, e.isActive AS employeeIsActive " +
                     "FROM accounts a " +
                     "JOIN employees e ON a.id = e.accountId " +
                     "JOIN roles r ON a.roleId = r.id;";

        DBContext dbContext = new DBContext();
        Connection connection = dbContext.connection;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String fullName = rs.getString("fullName");
                Date dateOfBirth = rs.getDate("dateOfBirth");
                String roleName = rs.getString("roleName");
                boolean isActive = rs.getBoolean("employeeIsActive");

                Object[] employeeData = {fullName, dateOfBirth, roleName, isActive};
                list.add(employeeData);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static void main(String[] args) {
        EmployeesDAO dao = new EmployeesDAO();
        List<Object[]> employees = dao.getAllEmployees();
        for (Object[] employee : employees) {
            System.out.println("Full Name: " + employee[0] +
                               ", Date of Birth: " + employee[1] +
                               ", Role Name: " + employee[2] +
                               ", Is Active: " + employee[3]);
        }
    }
}

