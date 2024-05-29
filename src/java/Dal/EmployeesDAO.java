/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Accounts;
import Model.DetailEmployees;
import Model.Roles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author ducth
 */
public class EmployeesDAO extends DBContext {
    
public List<DetailEmployees> getDetailEmployees() {
    List<DetailEmployees> detailList = new ArrayList<>();
    String sql = "SELECT " +
                 "    a.id AS accountId, " +
                 "    a.phone, " +
                 "    a.fullName, " +
                 "    a.email, " +
                 "    a.avatar, " +
                 "    a.isMale, " +
                 "    r.name AS roleName, " +
                 "    e.isActive, " +
                 "    e.dateOfBirth, " +
                 "    e.address " +
                 "FROM " +
                 "    accounts a " +
                 "JOIN " +
                 "    roles r ON a.roleId = r.id " +
                 "JOIN " +
                 "    employees e ON a.id = e.accountId;";
    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            DetailEmployees detailEmployee = new DetailEmployees();
            detailEmployee.setAccountId(rs.getInt("accountId"));
            detailEmployee.setPhone(rs.getString("phone"));
            detailEmployee.setFullName(rs.getString("fullName"));
            detailEmployee.setEmail(rs.getString("email"));
            detailEmployee.setAvatar(rs.getString("avatar"));
            detailEmployee.setIsMale(rs.getBoolean("isMale"));
            detailEmployee.setRoleName(rs.getString("roleName"));
            detailEmployee.setIsActive(rs.getBoolean("isActive"));
            detailEmployee.setDateOfBirth(rs.getDate("dateOfBirth"));
            detailEmployee.setAddress(rs.getString("address"));
            detailList.add(detailEmployee);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return detailList;
}

public class Main {
    public static void main(String[] args) {
        EmployeesDAO dao = new EmployeesDAO();
        List<DetailEmployees> employee = dao.getDetailEmployees();

        for (DetailEmployees Employee : employee) {
            System.out.println("Full Name: " + Employee.getFullName());
            System.out.println("Date of Birth: " + Employee.getDateOfBirth());
            System.out.println("Role Name: " + Employee.getRoleName());
            System.out.println("Is Active: " + Employee.getIsActive());
        }
    }
}


}
