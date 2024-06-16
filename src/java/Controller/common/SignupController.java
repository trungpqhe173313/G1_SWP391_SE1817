/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;
import Dal.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LINHNTHE170290
 */
public class SignupController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("text/html;charset=UTF-8");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        int roleId = 3; // Giá trị mặc định là Username
        String email = request.getParameter("email");
        Boolean gender = request.getParameter("gender")!= null ? Boolean.valueOf(request.getParameter("gender")) : null;
        boolean isActive = true; //Giá trị là active (hoặc 1)

        
        if (password == null || re_pass == null || !password.equals(re_pass)) {
            request.setAttribute("error1", "Password incorrect!Confirm password must be equal password!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

            AccountDAO d = new AccountDAO();
            Account a = d.checkAccountExist(phone);
            if (a == null) {
                Account newAccount = new Account();
                newAccount.setPhone(phone);
                newAccount.setPass(password);
                newAccount.setRoleId(roleId);
                newAccount.setEmail(email);
                newAccount.setGender(gender);
                newAccount.setIsActive(isActive);  
                d.insertAccount(newAccount);
                response.sendRedirect("login");
                //request.getRequestDispatcher("homepage.jsp").forward(request, response);
            } else {
                // Nếu tên người dùng đã tồn tại, thông báo lỗi và yêu cầu nhập lại
                request.setAttribute("error2", "Phone already exists! Please choose another one.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
}

    


