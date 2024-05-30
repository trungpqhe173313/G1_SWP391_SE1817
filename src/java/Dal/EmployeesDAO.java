/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Accounts;
import Model.DetailEmployees;
import Model.Employees;
import Model.Roles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.Statement;

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
    public void addAccountAndEmployee(Accounts accountEmployees, Employees employee) {
        String sqlAccount ="INSERT INTO accounts (phone, password, fullName, email, avatar, isMale, roleId, createdAt)\n" +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        String sqlEmployee ="INSERT INTO employees (isActive, dateOfBirth, address, createdAt, accountId)\n" +
                            "VALUES (?, ?, ?, ?, ?);";
        
        try {
            // Bắt đầu một giao dịch
            connection.setAutoCommit(false);

            // Thêm dữ liệu vào bảng accounts
            PreparedStatement psAccount = connection.prepareStatement(sqlAccount, Statement.RETURN_GENERATED_KEYS);
            psAccount.setString(1, accountEmployees.getPhone());
            psAccount.setString(2, accountEmployees.getPassword());
            psAccount.setString(3, accountEmployees.getFullName());
            psAccount.setString(4, accountEmployees.getEmail());
            psAccount.setString(5, accountEmployees.getAvatar());
            psAccount.setBoolean(6, accountEmployees.getIsMale());
            psAccount.setInt(7, accountEmployees.getRoleId());
            psAccount.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));
            psAccount.executeUpdate();

            // Lấy accountId vừa được tạo
            ResultSet rs = psAccount.getGeneratedKeys();
            int accountId = 0;
            if (rs.next()) {
                accountId = rs.getInt(1);
            }

            // Thêm dữ liệu vào bảng employees
            PreparedStatement psEmployee = connection.prepareStatement(sqlEmployee);
            psEmployee.setBoolean(1, employee.isIsActive());
            psEmployee.setDate(2, Date.valueOf(LocalDate.now()));
            psEmployee.setString(3, employee.getAddress());
            psEmployee.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
            psEmployee.setInt(5, accountId);
            psEmployee.executeUpdate();

            // Commit giao dịch
            connection.commit();
        } catch (SQLException ex) {
            // Nếu có lỗi, rollback giao dịch
            ex.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            // Đặt lại tự động commit
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean deleteEmployeeById(int accountId) {
        String sql = "DELETE FROM employees WHERE accountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
