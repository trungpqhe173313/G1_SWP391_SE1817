/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import Dal.AccountDAO;
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
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author LINHNTHE170290
 */
public class SignupController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("text/html;charset=UTF-8");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        int roleId = 3; // Giá trị mặc định là Username
        String email = request.getParameter("email");
        Boolean gender = request.getParameter("gender") != null ? Boolean.valueOf(request.getParameter("gender")) : null;
        boolean isActive = true; //Giá trị là active (hoặc 1)
        String avatar = request.getParameter("avatar");

        if (password == null || re_pass == null || !password.equals(re_pass)) {
            request.setAttribute("error1", "Password incorrect!Confirm password must be equal password!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        // Handle avatar upload
//        String avatarPath = null;
//        if (avatarPart != null && avatarPart.getSize() > 0) {
//            String fileName = extractFileName(avatarPart);
//            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
//            File uploadDir = new File(uploadPath);
//            if (!uploadDir.exists()) {
//                uploadDir.mkdir();
//            }
//            avatarPath = uploadPath + File.separator + fileName;
//            avatarPart.write(avatarPath);
//        }

        AccountDAO d = new AccountDAO();
        //CustomerDAO cd = new CustomerDAO();
        Account a = d.checkAccountExist(phone);
        if (a == null) {
            // Tạo mới đối tượng Account và đặt các giá trị
            Account newAccount = new Account();
            newAccount.setPhone(phone);
            newAccount.setPass(password);
            newAccount.setRoleId(roleId);
            newAccount.setEmail(email);
            newAccount.setGender(gender);
            newAccount.setIsActive(isActive);

            // Tạo mới đối tượng Customer và đặt các giá trị
            Customer customer = new Customer();
            customer.setPhone(phone);
            customer.setFullName(fullName);
            customer.setAccount(newAccount); // Liên kết Customer với Account
            
            //cd.insertCustomer(customer);
            d.insertAccount(newAccount);
            response.sendRedirect("login");
            //request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } else {
            // Nếu tên người dùng đã tồn tại, thông báo lỗi và yêu cầu nhập lại
            request.setAttribute("error2", "Phone already exists! Please choose another one.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

    }

    // Method to extract file name from Content-Disposition header of file part
//    private String extractFileName(Part part) {
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String item : items) {
//            if (item.trim().startsWith("filename")) {
//                return item.substring(item.indexOf("=") + 2, item.length() - 1);
//            }
//        }
//        return null;
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
}
