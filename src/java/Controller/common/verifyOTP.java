/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class verifyOTP extends HttpServlet {

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
            out.println("<title>Servlet verifyOTP</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet verifyOTP at " + request.getContextPath() + "</h1>");
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
        String otpEntered = request.getParameter("otp1")
                + request.getParameter("otp2")
                + request.getParameter("otp3")
                + request.getParameter("otp4")
                + request.getParameter("otp5")
                + request.getParameter("otp6");

        // Get OTP from cookie
        Cookie[] cookies = request.getCookies();
        String otpCookieValue = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("otp")) {
                    otpCookieValue = cookie.getValue();
                    break;
                }
            }
        }

        // Check if OTP cookie is present
        if (otpCookieValue == null) {
            // OTP has expired, redirect to reset password page
            request.setAttribute("mess", "OTP đã hết hạn, vui lòng thử lại.");
            request.getRequestDispatcher("resetPasswordC.jsp").forward(request, response);
        } else {
            // Compare entered OTP with OTP from cookie
            if (otpEntered != null && otpEntered.equals(otpCookieValue)) {
                response.sendRedirect("changePassReset.jsp");
            } else {
                request.setAttribute("mess", "OTP không chính xác!!");
                request.getRequestDispatcher("OTP.jsp").forward(request, response);
            }
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
