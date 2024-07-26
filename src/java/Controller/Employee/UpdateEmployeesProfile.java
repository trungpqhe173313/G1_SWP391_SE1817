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
                String currentImage = request.getParameter("avatar"); // Hình ảnh hiện tại
        
        // Lớp helper để xử lý tệp tải lên
        addimg imgHelper = new addimg();
        Part part = request.getPart("avatar");
        String fileName = imgHelper.extractFileName(part);
        fileName = new File(fileName).getName();
        
        // Kiểm tra nếu có tệp tải lên mới
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/") + "img/service" + File.separator + fileName;
            part.write(uploadPath);
        }

        // Sử dụng hình ảnh mới nếu có, nếu không sử dụng hình ảnh hiện tại
        String avatar = (fileName != null && !fileName.isEmpty()) ? fileName : currentImage;

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
