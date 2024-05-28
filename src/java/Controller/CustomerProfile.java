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
        
        String phone = request.getParameter("phone");
        CustomerDAO dc = new CustomerDAO();
        Accounts a = dc.getCusProfile(phone);
        
        if (a != null) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("customer-profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error system!!!");
            request.getRequestDispatcher("customer-profile.jsp").forward(request, response);
        }
    
    }

    

}
