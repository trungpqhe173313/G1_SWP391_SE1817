/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Employee;

import Dal.AccountDAO;
import Dal.EmployeesDAO;
import Model.Account;
import Model.Employee;
import java.io.IOException;
import java.util.Map;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 *
 * @author ducth
 */
public class EmployeesProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet employeesProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet employeesProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    HttpSession session = request.getSession();
    String phone = (String) session.getAttribute("phone");
    
    try {
        EmployeesDAO employeesDAO = new EmployeesDAO();
        Employee employee = employeesDAO.getAllEmployees(phone);
        
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAllAccounts(phone);
        
        request.setAttribute("employee", employee);
        request.setAttribute("account", account);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employeesProfile.jsp");
        dispatcher.forward(request, response);
        
    } catch (SQLException ex) {
        ex.printStackTrace();
        response.sendRedirect("errorPage.jsp");
    }
}


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}