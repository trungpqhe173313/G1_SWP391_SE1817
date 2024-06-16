/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.CustomerDAO;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author LINHNTHE170290
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
        String phone = ((Account)request.getSession().getAttribute("account")).getPhone();
        CustomerDAO dc = new CustomerDAO();
        Account a = dc.getProfileByPhone(phone);
        
        if (a != null) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("customer-profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error system!!!");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        }
    
    }


    

}
