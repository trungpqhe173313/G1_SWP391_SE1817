/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.CustomerDAO;
import Model.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
/**
 *
 * @author admin
 */
public class CustomerUpdatePage extends HttpServlet {

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
            out.println("<title>Servlet CustomerUpdatePage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerUpdatePage at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        CustomerDAO daoCustomer = new CustomerDAO();
        Accounts a = daoCustomer.getProfileByUsername(username);
        
        if (a != null) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("update-customerfile.jsp").forward(request, response);
        } else {
            System.out.println("Error!");
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
        // Lấy thông tin từ form
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        boolean isMale = Boolean.parseBoolean(request.getParameter("isMale"));
        
        // Tạo một đối tượng Account với các thông tin mới cập nhật
        CustomerDAO daoCustomer = new CustomerDAO();
        Accounts existingAccount = daoCustomer.getProfileByUsername(username);
        if (existingAccount != null) {
            Accounts updatedAccount = new Accounts(existingAccount.getId(), 
                    existingAccount.getUsername(), existingAccount.getPassword(), 
                    fullName, email, avatar, isMale, existingAccount.getRoleId(), 
                    existingAccount.getIsActive(), existingAccount.getCreatedAt(), 
                    new Timestamp(System.currentTimeMillis()));
            
            // Cập nhật thông tin vào CSDL
            daoCustomer.updateProfile(updatedAccount);
            
            // Điều hướng sau khi cập nhật
            response.sendRedirect("customer-profile?username=" + updatedAccount.getUsername());
        } else {
            System.out.println("Error!");
        }
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
