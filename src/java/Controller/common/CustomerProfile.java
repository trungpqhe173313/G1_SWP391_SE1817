/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.CustomerDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LINHNTHE170290
 */
public class CustomerProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // do not create new session
        if (session != null) {
            // Lấy số điện thoại của người dùng đã đăng nhập từ session
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                CustomerDAO customerDAO = new CustomerDAO();
                Customer customer = customerDAO.getCustomerProfile(account.getPhone());
                if (customer != null) {
                    request.setAttribute("customer", customer);
                    request.getRequestDispatcher("CustomerProfile.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("error", "Error system!!!");
                    request.getRequestDispatcher("homepage.jsp").forward(request, response);
                }
            }
        }
        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        response.sendRedirect("login.jsp");




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
