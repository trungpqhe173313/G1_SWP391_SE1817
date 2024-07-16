package Controller.admin;

import Dal.EmployeesDAO;

import Model.Account;



import Model.Employee;

import Model.Account;
import Model.Employee;

import Model.Employee;

import Model.Employee;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author ducth
 */
public class AddEmployeesController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddEmployeesController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddEmployeesController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        request.getRequestDispatcher("addemployees.jsp").forward(request, response);
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
         // Lấy thông tin tài khoản từ request
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        Boolean isMale = Boolean.parseBoolean(request.getParameter("isMale"));
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        // Lấy thông tin nhân viên từ request
        Boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String address = request.getParameter("address");

        // Tạo đối tượng Account và Employees
        Account account = new Account();
        account.setPhone(phone);
        account.setPassword(password);
        account.setFullName(fullName);
        account.setEmail(email);
        account.setAvatar(avatar);
        account.setIsMale(isMale);
        account.setRoleId(roleId);

        Employee employee = new Employee();
        employee.setIsActive(isActive);
        employee.setDateOfBirth(java.sql.Date.valueOf(java.time.LocalDate.now()));
        employee.setAddress(address);

        // Thêm vào cơ sở dữ liệu
        EmployeesDAO dao = new EmployeesDAO();
        try {
    dao.addAccountAndEmployee(account, employee);
    response.sendRedirect("employeesdetail");
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().write("Có lỗi xảy ra khi chèn dữ liệu.");
}

    }
        
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
