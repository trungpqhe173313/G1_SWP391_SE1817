/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.CustomerDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;

/**
 *
 * @author LINHNTHE170290
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
        //String phone = request.getParameter("phone");
        String idStr = request.getParameter("customerid");
        int customerid;

        CustomerDAO daoCustomer = new CustomerDAO();

        try {
            customerid = Integer.parseInt(idStr);
            Customer c = daoCustomer.getCustomerProfileByID(customerid);
            request.setAttribute("customer", c);
            request.getRequestDispatcher("updateCustomerProfile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
        String idStr = request.getParameter("customerid");
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        Boolean gender = request.getParameter("gender") != null ? Boolean.valueOf(request.getParameter("gender")) : null;
        int roleId = 3; // Giá trị mặc định là Username
        boolean isActive = true; //Giá trị là active (hoặc 1)
        int customerId = Integer.parseInt(idStr);

        // Tạo một đối tượng Account với các thông tin mới cập nhật
        Customer updatedCustomer = new Customer();
        updatedCustomer.setCustomerId(customerId);
        updatedCustomer.setFullName(fullName);
        updatedCustomer.setPhone(phone);
        updatedCustomer.getAccount().setEmail(email);
        updatedCustomer.getAccount().setGender(gender);
        updatedCustomer.getAccount().setAvatar(avatar);
        
        // lưu vào data
        CustomerDAO customerDAO = new CustomerDAO();
        boolean updateSuccessful = customerDAO.updateCustomer(updatedCustomer);

        if (updateSuccessful) {
            // Redirect to customer profile page or success page
            response.sendRedirect("CustomerProfile.jsp");
        } else {
            // Handle update failure scenario
            response.getWriter().println("Failed to update customer information.");
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
