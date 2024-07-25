/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import static Controller.customer.AppointmentServlet.isValidVietnamesePhoneNumber;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author xdrag
 */
public class AppointmentWithoutLoginServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        //xoa cac services va lich da ton tai
        session.removeAttribute("time");
        session.removeAttribute("services");
        String phone = request.getParameter("phone");
        //kiem tra xem sdt co dung theo formart viet nam hoac bi null ko
        if (!isValidVietnamesePhoneNumber(phone)) {
            request.setAttribute("inValidPhone", phone);
            request.setAttribute("mss", "số điện thoại không hợp lệ");
            request.getRequestDispatcher("service").forward(request, response);
            return;
        }
        //neu account null thi tao session phone
        if (session.getAttribute("account") == null) {
            session.setAttribute("phone", phone);
        }
        request.getRequestDispatcher("appointment").forward(request, response);
    }

    /**
     * ham de kiem tra xem co phai sdt formart viet nam khong
     *
     * @param phoneNumber - string phone to check
     * @return boolean
     */
    public static boolean isValidVietnamesePhoneNumber(String phoneNumber) {
        // Kiểm tra nếu chuỗi là null hoặc rỗng
        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            return false;
        }

        // Xóa tất cả dấu cách trong chuỗi
        phoneNumber = phoneNumber.replaceAll("\\s", "");

        // Định nghĩa pattern cho số điện thoại Việt Nam
        String phonePattern = "^(03|05|07|08|09)\\d{8}$";

        // Kiểm tra xem chuỗi có khớp với pattern không
        return phoneNumber.matches(phonePattern);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
