import Dal.AccountDAO;
import Dal.EmployeesDAO;
import Model.Employee;
<<<<<<< Updated upstream
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
=======
>>>>>>> Stashed changes
import java.sql.SQLException;
import java.util.Map;

public class NewClass {
<<<<<<< Updated upstream
    public static void main(String[] args) {
        EmployeesDAO dao = new EmployeesDAO();
        try {
            dao.updateEmployee("0912345677", "Phạm Đức Thiện");
        } catch (SQLException ex) {
=======
public static void main(String[] args) {
    EmployeesDAO dao = new EmployeesDAO();

    try {
        // Test getAllEmployees method
        String testPhone = "0912345677";
        Employee employee = dao.getAllEmployees(testPhone);

        if (employee != null) {
            System.out.println("Employee Details:");
            System.out.println("Full Name: " + employee.getFullName());
            System.out.println("Phone: " + employee.getPhone());
        } else {
            System.out.println("No employee found with phone number: " + testPhone);
>>>>>>> Stashed changes
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
<<<<<<< Updated upstream
}
=======
}
}
>>>>>>> Stashed changes
