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
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class SignupController extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("text/html;charset=UTF-8");
        String accountname = request.getParameter("username");
        String password = request.getParameter("password");
        String pass = request.getParameter("pass");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        Boolean isMale = Boolean.valueOf(request.getParameter("isMale"));

        int roleId = 0; // Giá trị mặc định nếu không có giá trị truyền vào
        String roleIdParam = request.getParameter("roleId");
        if (roleIdParam != null && !roleIdParam.isEmpty()) {
            roleId = Integer.parseInt(roleIdParam);
        } else {
            request.setAttribute("error", "Role ID is required!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        Boolean isActive = Boolean.valueOf(request.getParameter("isActive"));
        
        
        if (pass == null || !pass.equals(password)) {
            request.setAttribute("error", "Username or password incorrect!!!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            DAOAccount d = new DAOAccount();
            Accounts a = d.checkAccountExist(accountname);
            if (a == null) {
                Accounts newAccount = new Accounts();
                newAccount.setUsername(accountname);
                newAccount.setPassword(password);
                newAccount.setFullName(fullName);
                newAccount.setEmail(email);
                newAccount.setAvatar(avatar);
                newAccount.setIsMale(isMale);
                newAccount.setRoleId(roleId);
                newAccount.setIsActive(isActive);
                // Thiết lập thời gian tạo và cập nhật là thời gian hiện tại
                Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
                newAccount.setCreateAt(currentTimestamp);
                newAccount.setUpdatedAt(currentTimestamp);
                d.insertAccount(newAccount);
                response.sendRedirect("login");

            } else {
                response.sendRedirect("login");
            }
        }
    }

    

}
