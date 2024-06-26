import Dal.AccountDAO;
import Dal.EmployeesDAO;
import Model.Employee;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.SQLException;
import java.util.Map;

public class NewClass {
    public static void main(String[] args) {
        EmployeesDAO dao = new EmployeesDAO();
        try {
            dao.updateEmployee("0912345677", "Phạm Đức Thiện");
        } catch (SQLException ex) {
        }
    }
}