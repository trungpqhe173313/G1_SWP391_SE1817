/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.CustomerDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerByP(account.getPhone());
            if (customer != null) {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("updateCustomerProfile.jsp").forward(request, response);
            } else {
                response.getWriter().println("Customer not found.");
            }
        } else {
            response.getWriter().println("No account found in session.");
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
        //String idStr = request.getParameter("customerid");
        String avatar = request.getParameter("avatar");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Boolean gender = request.getParameter("gender") != null ? Boolean.valueOf(request.getParameter("gender")) : null;
        //int customerId = Integer.parseInt(idStr);

        // Kiểm tra xem các tham số đã được cung cấp chưa
        if (fullName == null || email == null ) {
            response.getWriter().println("Missing required parameters.");
            return;
        }
        // Lấy thông tin tài khoản từ phiên làm việc
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerByP(account.getPhone());
            if (customer != null) {
                // Cập nhật thông tin khách hàng
                customer.setFullName(fullName);
                //customer.setPhone(phone);

                // Cập nhật thông tin tài khoản liên kết
                account.setEmail(email);
                account.setGender(gender);
                account.setAvatar(avatar);
                
                // Cập nhật thông tin khách hàng trong cơ sở dữ liệu
                boolean updateSuccessful = customerDAO.updateCustomer(customer);
                if (updateSuccessful) {
                    // Chuyển hướng đến trang CustomerProfile.jsp sau khi cập nhật thành công
                    response.sendRedirect("CustomerProfile.jsp");
                } else {
                    // Xử lý trường hợp cập nhật thất bại
                    response.getWriter().println("Failed to update customer information.");
                }
            } else {
                // Xử lý trường hợp không tìm thấy khách hàng
                response.getWriter().println("Customer not found.");
            }
        } else {
            // Xử lý trường hợp không có tài khoản trong phiên làm việc
            response.getWriter().println("No account found in session.");
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
