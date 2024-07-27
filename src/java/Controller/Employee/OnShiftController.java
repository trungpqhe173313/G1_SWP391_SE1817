package Controller.Employee;

import Dal.EmployeesDAO;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

@WebServlet(name="OnShiftController", urlPatterns={"/onshift"})
public class OnShiftController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private EmployeesDAO employeesDAO = new EmployeesDAO();

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String phone = account.getPhone();
        int employeeId = employeesDAO.getEmployeeId(phone);
        request.setAttribute("employeeId", employeeId);
        request.getRequestDispatcher("OrderInfoEmployee.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String phone = account.getPhone();
        String action = request.getParameter("action");
        
        int employeeId = employeesDAO.getEmployeeId(phone);
//        if ("start".equals(action)) {
//            employeesDAO.updateStatusFromAvailableToBusy(employeeId);
//        } else 
            if ("end".equals(action)) {
            employeesDAO.updateStatusFromAvailableToBusy(employeeId);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            return;
        }
        response.sendRedirect("orderinfoemployee");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
