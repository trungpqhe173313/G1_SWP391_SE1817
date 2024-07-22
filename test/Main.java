/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ducth
 */
import Dal.BlogDAO;
import Dal.EmployeesDAO;
import Model.Blog;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        // Initialize EmployeesDAO
        EmployeesDAO employeesDAO = new EmployeesDAO();
        
        // Example data
        String phone = "0912345681";
        String fullName = "Nguyễn Hà Thành Trung";
        String pass = "password2";
        String email = "trungnht@example.com";
        boolean gender = true; // true for male, false for female
        int statusEmployee = 1; // Example status
        String avatar = "avatar.png";

        // Add employee
        boolean success = employeesDAO.addEmployee(phone, fullName, pass, email, gender, statusEmployee, avatar);

        // Check if the operation was successful
        if (success) {
            System.out.println("Employee added successfully.");
        } else {
            System.out.println("Failed to add employee.");
        }
    }
}



