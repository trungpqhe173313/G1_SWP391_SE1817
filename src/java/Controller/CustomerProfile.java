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

/**
 *
 * @author admin
 */
public class CustomerProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (request.getSession().getAttribute("account") == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }
        // Lấy số điện thoại của người dùng đã đăng nhập từ session
        String phone = ((Accounts)request.getSession().getAttribute("account")).getPhone();
        CustomerDAO dc = new CustomerDAO();
        Accounts a = dc.getProfileByPhone(phone);
        
        if (a != null) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("customer-profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error system!!!");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        }
    
    }


    

}
