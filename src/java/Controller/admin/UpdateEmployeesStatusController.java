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
    String employeesIdStr = request.getParameter("employeesId");
    String isActiveStr = request.getParameter("isActive");

    try {
        if (employeesIdStr != null && isActiveStr != null) {
            int employeesId = Integer.parseInt(employeesIdStr);
            boolean isActive = Boolean.parseBoolean(isActiveStr);

            EmployeesDAO employeesDAO = new EmployeesDAO();
            boolean success = employeesDAO.updateEmployeeActiveStatus(employeesId, !isActive);

            if (success) {
                request.setAttribute("updateStatus", "success");
            } else {
                request.setAttribute("updateStatus", "error");
            }

            // Truyền dữ liệu đến JSP
            // request.getRequestDispatcher("/employeesdetail.jsp").forward(request, response);

            // Chuyển hướng đến trang employeesDetail.jsp sau khi cập nhật thành công
            response.sendRedirect(request.getContextPath() + "/employeesdetail");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/error.jsp");
        }
    } catch (NumberFormatException ex) {
        ex.printStackTrace();
        response.sendRedirect(request.getContextPath() + "/admin/error.jsp");
    } catch (SQLException ex) {
        Logger.getLogger(UpdateEmployeesStatusController.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect(request.getContextPath() + "/admin/error.jsp");
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
