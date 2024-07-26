/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Employee;

import Controller.common.addimg;
import Dal.AccountDAO;
import Dal.EmployeesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.InputStream;
import java.nio.file.StandardCopyOption;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)
/**
 *
 * @author ducth
 */
@WebServlet(name="UpdateEmployeesProfile", urlPatterns={"/updateemployeesprofile"})
public class UpdateEmployeesProfile extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateEmployeesProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployeesProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String phone = request.getParameter("phone");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String currentAvatar = request.getParameter("currentAvatar"); // Hình ảnh hiện tại
        
        // Xử lý tệp tải lên
        Part avatarPart = request.getPart("avatar");
        String avatarFileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
        
        String avatarFilePath = currentAvatar; // Sử dụng hình ảnh hiện tại theo mặc định

        if (avatarPart != null && avatarPart.getSize() > 0) {
            avatarFilePath = getServletContext().getRealPath("/img/service/") + avatarFileName;
            try (InputStream avatarContent = avatarPart.getInputStream()) {
                Files.copy(avatarContent, Paths.get(avatarFilePath), StandardCopyOption.REPLACE_EXISTING);
            }
        }

        // Sử dụng tên tệp hình ảnh mới nếu có, nếu không sử dụng hình ảnh hiện tại
        String avatar = (avatarFileName != null && !avatarFileName.isEmpty()) ? avatarFileName : currentAvatar;

        AccountDAO accountDAO = new AccountDAO();
        EmployeesDAO employeesDAO = new EmployeesDAO();

        try {
            // Update account information
            accountDAO.updateAccount(phone, email, avatar);

            // Update employee information
            employeesDAO.updateEmployee(phone, fullName);

            // Set attributes to be displayed on the JSP
            request.setAttribute("phone", phone);
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);
            request.setAttribute("avatar", avatar);

            response.sendRedirect("employeesprofile");
        } catch (SQLException ex) {
            // Handle SQL exception
            ex.printStackTrace(); // Log the exception for debugging
            // You may redirect to an error page or provide a user-friendly error message
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
