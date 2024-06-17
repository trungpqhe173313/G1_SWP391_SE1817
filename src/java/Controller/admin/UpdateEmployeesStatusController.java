package Controller.admin;

import Dal.EmployeesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ducth
 */
public class UpdateEmployeesStatusController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateEmployeesStatusController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployeesStatusController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeesIdStr = request.getParameter("employeeId");
        String isActiveStr = request.getParameter("isActive");

        try {
            if (employeesIdStr != null && isActiveStr != null) {
                int employeeId = Integer.parseInt(employeesIdStr);
                boolean isActive = Boolean.parseBoolean(isActiveStr);

                EmployeesDAO employeesDAO = new EmployeesDAO();
                boolean success = employeesDAO.updateEmployeeActiveStatus(employeeId, !isActive);

                if (success) {
                    // Truyền dữ liệu đến JSP nếu cần thiết
                    request.setAttribute("updateemployeesstatus.jsp", "success");
                    // Chuyển hướng đến trang employeesDetail.jsp sau khi cập nhật thành công
                    response.sendRedirect(request.getContextPath() + "/employeesdetail.jsp");
                } else {
                    // Trường hợp không cập nhật thành công
                    request.setAttribute("updateemployeesstatus.jsp", "error");
                    response.sendRedirect(request.getContextPath() + "/error.jsp");
                }
            } else {
                // Trường hợp thiếu tham số
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (NumberFormatException | SQLException ex) {
            // Xử lý ngoại lệ
            ex.printStackTrace(); // Hoặc sử dụng logging để ghi lại lỗi
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
