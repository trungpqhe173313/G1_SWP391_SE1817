/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.AccountDAO;
import Dal.CustomerDAO;
import Model.Account;
import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author admin
 */
public class CustomerProfileController extends HttpServlet {

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
            out.println("<title>Servlet CustomerProfileController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false); // do not create new session
//        if (session != null) {
//            // Lấy số điện thoại của người dùng đã đăng nhập từ session
//            Account account = (Account) session.getAttribute("account");
//            if (account != null) {
//                CustomerDAO customerDAO = new CustomerDAO();
//                Customer customer = customerDAO.getCustomerProfile(account.getPhone());
//                if (customer != null) {
//                    request.setAttribute("customer", customer);
//                    
//                    request.getRequestDispatcher("CustomerProfile.jsp").forward(request, response);
//                    return;
//                } else {
//                    request.setAttribute("error", "Lỗi hệ thống!");
//                    request.getRequestDispatcher("homepage.jsp").forward(request, response);
//                }
//            }
//        }
//        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
//        response.sendRedirect("login.jsp");

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
        
        AccountDAO accountDAO = new AccountDAO();
        CustomerDAO customerDAO = new CustomerDAO();

        try {
            Account ac = accountDAO.getAccountByPhone(phone);
            Customer cus = customerDAO.getCustomerByPhone(phone);

            request.setAttribute("account", ac);
            request.setAttribute("customer", cus);

            request.getRequestDispatcher("CustomerProfile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
