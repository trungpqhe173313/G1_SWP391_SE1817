/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.DAOAccount;
import Model.Accounts;
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
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountname = request.getParameter("username");
        String password = request.getParameter("password");
        DAOAccount da = new DAOAccount();
        Accounts a = da.checkAuthentic(accountname, password);
        if(a == null){
            request.setAttribute("error", "Username or password incorrect!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            int sessionTimeoutSeconds = 2400;
            //tao session
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(sessionTimeoutSeconds);
            session.setAttribute("account", a);
            response.sendRedirect("home");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

}
