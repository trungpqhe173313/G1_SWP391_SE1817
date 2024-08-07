/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;
import util.PasswordEncryption;
import Dal.AccountDAO;
import Dal.CustomerDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)

/**
 *
 * @author LINHNTHE170290
 */
public class SignupController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        int roleId = 3; // Default value for roleId
        String email = request.getParameter("email");
        Boolean gender = request.getParameter("gender") != null ? Boolean.valueOf(request.getParameter("gender")) : null;
        boolean isActive = true; // Set default value to true
//        String avatar = request.getParameter("avatar");

        addimg img = new addimg();
        Part part = request.getPart("avatar");
        String fileName = img.extractFileName(part);
        fileName = new File(fileName).getName();
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/") + "img/service" + File.separator + fileName;
            part.write(uploadPath);
        }
        String avatar = (fileName != null && !fileName.isEmpty()) ? fileName : request.getParameter("avatar");

        if (password == null || re_pass == null || !password.equals(re_pass)) {
            request.setAttribute("error1", "Mật khẩu không đúng! Xác nhận mật khẩu phải giống với mật khẩu!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
           
        }else{
            // Mã hóa mật khẩu người dùng nhập vào
//            password = PasswordEncryption.toSHA1(password);
        }

        AccountDAO accountDAO = new AccountDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        Account existingAccount = accountDAO.checkAccountExist(phone);

        if (existingAccount == null) {
            // Create new Account
            Account newAccount = new Account();
            newAccount.setPhone(phone);
            newAccount.setPass(password);
            newAccount.setRoleId(roleId);
            newAccount.setEmail(email);
            newAccount.setGender(gender);
            newAccount.setIsActive(isActive);
            newAccount.setAvatar(avatar);

            // Create new Customer
//            Customer newCustomer = new Customer(1,fullName, phone);

            // Insert Customer and Account
            customerDAO.insertCustomer(fullName, phone);
            accountDAO.insertAccount(newAccount);

            response.sendRedirect("login.jsp");
        } else {
            // If phone number already exists, show error
            request.setAttribute("error2", "Số điện thoại đã tồn tại! Vui lòng chọn số khác.");
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
