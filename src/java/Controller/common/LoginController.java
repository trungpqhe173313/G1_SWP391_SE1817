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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LINHNTHE170290
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");

        AccountDAO da = new AccountDAO();
        Account a = da.checkAuthentic(phone, password);
        // Mã hóa mật khẩu người dùng nhập vào
        //String hashedPassword = AccountDAO.hashPassword(password);
        //Account a = da.login(phone, hashedPassword);

        String r = request.getParameter("remember");
        // tao 3 cookie  cookieU  , cookieP  , cookieR
        Cookie cookieU = new Cookie("cUser", phone);
        Cookie cookieP = new Cookie("cPass", password);
        Cookie cookieR = new Cookie("cRem", r);
        if (r != null) {
            cookieU.setMaxAge(60 * 60 * 24);  // 1 day  
            cookieP.setMaxAge(60 * 60 * 24);
            cookieR.setMaxAge(60 * 60 * 24);

        } else {
            cookieU.setMaxAge(0);
            cookieP.setMaxAge(0);
            cookieR.setMaxAge(0);

        }
        response.addCookie(cookieU);
        response.addCookie(cookieP);
        response.addCookie(cookieR);
        // save browser

        if (a == null) {
            request.setAttribute("error", "Phone or password incorrect!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Tạo session
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.removeAttribute("time");
            session.removeAttribute("services");
            if (a.getRoleId() == 1) {
                response.sendRedirect("viewrevenue");
            } else if (a.getRoleId() == 2) {
                response.sendRedirect("employeesprofile");
            } else {
                response.sendRedirect("home");
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
