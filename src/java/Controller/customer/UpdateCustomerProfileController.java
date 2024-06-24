/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LINHNTHE170290
 */
public class UpdateCustomerProfileController extends HttpServlet {

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
            out.println("<title>Servlet UpdateCustomerProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCustomerProfileController at " + request.getContextPath() + "</h1>");
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
      request.getRequestDispatcher("updateCustomerProfile.jsp").forward(request, response);
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
        int customerId = Integer.parseInt(idStr);

        // Kiểm tra xem các tham số đã được cung cấp chưa
        if (phone == null || fullName == null || email == null || avatar == null) {
            response.getWriter().println("Missing required parameters.");
            return;
        }

        // Tạo đối tượng Customer mới
        Customer updatedCustomer = new Customer();
        updatedCustomer.setCustomerId(customerId);
        updatedCustomer.setFullName(fullName);
        updatedCustomer.setPhone(phone);
        updatedCustomer.getAccount().setEmail(email);
        updatedCustomer.getAccount().setGender(gender);
        updatedCustomer.getAccount().setAvatar(avatar);

        // Cập nhật thông tin khách hàng
        CustomerDAO customerDAO = new CustomerDAO();
        boolean updateSuccessful = customerDAO.updateCustomer(updatedCustomer);

        if (updateSuccessful) {
            // Chuyển hướng đến trang CustomerProfile.jsp sau khi cập nhật thành công
            response.sendRedirect("CustomerProfile.jsp");
        } else {
            // Xử lý trường hợp cập nhật thất bại
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
