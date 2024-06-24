import Dal.EmployeesDAO;
import java.sql.SQLException;
import java.util.Map;

public class NewClass {
    public static void main(String[] args) {
        EmployeesDAO employeesDAO = new EmployeesDAO();

        // Chuyển đổi phone từ int sang String
        String phone = "0912345677";

        try {
            // Gọi phương thức employeeProfile với phone là tham số
            Map<String, Object> employeeProfile = employeesDAO.employeeProfile(phone);

            if (employeeProfile.isEmpty()) {
                System.out.println("User not found.");
            } else {
                System.out.println("Employee Profile:");
                System.out.println("Avatar: " + employeeProfile.get("avatar"));
                System.out.println("Phone: " + employeeProfile.get("phone"));
                System.out.println("Employee ID: " + employeeProfile.get("employeeId"));
                System.out.println("Full Name: " + employeeProfile.get("fullName"));
                System.out.println("Email: " + employeeProfile.get("email"));

                boolean gender = (boolean) employeeProfile.get("gender");
                String genderStr = gender ? "Male" : "Female";
                System.out.println("Gender: " + genderStr);

                System.out.println("Role: " + employeeProfile.get("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
