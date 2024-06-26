import Dal.EmployeesDAO;
import java.sql.SQLException;
import java.util.Map;

public class NewClass {
    public static void main(String[] args) {
        EmployeesDAO employeesDAO = new EmployeesDAO();

        // Chuyển đổi phone từ int sang String
        String phone = "0912345677";

        try {
            // Gọi phương thức printEmployeeProfile với phone là tham số
            employeesDAO.printEmployeeProfile(phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
