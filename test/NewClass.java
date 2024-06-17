/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ducth
 */
import Dal.EmployeesDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class NewClass {
    public static void main(String[] args) {
        EmployeesDAO employeesDAO = new EmployeesDAO();

        try {
            List<Map<String, Object>> employeeServicesInfo = employeesDAO.getEmployeeServicesInfo();
            for (Map<String, Object> employee : employeeServicesInfo) {
                System.out.println("Avatar: " + employee.get("avatar"));
                System.out.println("Phone: " + employee.get("phone"));
                System.out.println("Full Name: " + employee.get("fullName"));
                boolean gender = (boolean) employee.get("gender");
                System.out.println("Gender: " + (gender ? "Male" : "Female"));
                System.out.println("Email: " + employee.get("email"));
                System.out.println("Status: " + employee.get("status"));
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}