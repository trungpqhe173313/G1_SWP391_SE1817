import Dal.EmployeesDAO;
import Model.Accounts;
import Model.Employees;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        EmployeesDAO dao = new EmployeesDAO();

        Accounts account = new Accounts();
        account.setPhone("1234563");
        account.setPassword("pass");
        account.setFullName("Nguyen Van Pp");
        account.setEmail("nguyen23@example.com");
        account.setAvatar("avatarqưer.jpg");
        account.setIsMale(true);
        account.setRoleId(4);

        Employees employee = new Employees();
        employee.setIsActive(true);
        employee.setAddress("123 Strt, Cty");

        try {
            
            dao.addAccountAndEmployee(account, employee);
            System.out.println("Dữ liệu đã được chèn vào cả hai bảng thành công.");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Có lỗi xảy ra khi chèn dữ liệu.");
        }
    }
}
