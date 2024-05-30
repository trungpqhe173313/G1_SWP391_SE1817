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
import java.sql.Timestamp;
/**
 *
 * @author admin
 */
public class CustomerUpdatePage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet CustomerUpdatePage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerUpdatePage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String phone = request.getParameter("phone");
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr); // Gán giá trị mặc định hoặc giá trị phù hợp khác
        
        CustomerDAO daoCustomer = new CustomerDAO();
        //Accounts a = daoCustomer.getProfileByPhone(phone);
        Accounts a = daoCustomer.getProfileById(id);
        if (a != null) {
            request.setAttribute("account", a);
            request.getRequestDispatcher("update-customerfile.jsp").forward(request, response);
        } else {
            System.out.println("Error!");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
            
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        Boolean isMale = request.getParameter("isMale")!= null ? Boolean.valueOf(request.getParameter("isMale")) : null;
        
        
        int roleId = 2; // Giá trị mặc định là Username
        boolean isActive = true; //Giá trị là active (hoặc 1)
        // Tạo một đối tượng Account với các thông tin mới cập nhật
        CustomerDAO daoC = new CustomerDAO();
        try {
            Accounts newA = new Accounts(id, phone, password, fullName, email, avatar, isMale, roleId, isActive);
            daoC.updateProfile(newA);
            
            response.sendRedirect("cusprofile");
            //response.sendRedirect("cusprofile?phone=" + phone);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
