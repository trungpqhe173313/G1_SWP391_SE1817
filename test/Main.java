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

public class Main {

    public static void main(String[] args) {
        EmployeesDAO employeesDAO = new EmployeesDAO();

        try {
            List<Map<String, Object>> employeesList = employeesDAO.getWorkingEmployees();

            System.out.println("List of Working Employees:");
            System.out.println("-------------------------------------");
            for (Map<String, Object> employee : employeesList) {
                System.out.println("Full Name: " + employee.get("employeeFullName"));
                System.out.println("Phone: " + employee.get("phone"));
                System.out.println("Gender: " + employee.get("gender"));
                System.out.println("Email: " + employee.get("email"));
                System.out.println("Status: " + employee.get("status"));
                System.out.println("Customer Full Name: " + employee.get("fullName"));
                System.out.println("Order ID: " + employee.get("orderId"));
                System.out.println("Service Names: " + employee.get("serviceNames"));
                System.out.println("-------------------------------------");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


