/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Voucher;

import Dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class Advoucher extends HttpServlet {

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
            out.println("<title>Servlet Advoucher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Advoucher at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("advoucher.jsp").forward(request, response);
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

        try {
            String name = request.getParameter("name");
            String voucherStr = request.getParameter("voucher");
            String startTimeStr = request.getParameter("starttime");
            String endTimeStr = request.getParameter("endtime");

            // Debugging: Print the parameters to check if they are received correctly
            System.out.println("name: " + name);
            System.out.println("voucherStr: " + voucherStr);
            System.out.println("startTimeStr: " + startTimeStr);
            System.out.println("endTimeStr: " + endTimeStr);

            if (name == null || voucherStr == null || startTimeStr == null || endTimeStr == null) {
                // If any parameter is null, redirect back to the form page
                response.sendRedirect("advoucher.jsp");
                return;
            }

            float voucher = 0;
            try {
                voucher = Float.parseFloat(voucherStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("advoucher.jsp");
                return;
            }

            Date startTime = Date.valueOf(startTimeStr);
            Date endTime = Date.valueOf(endTimeStr);

            VoucherDAO voucherDAO = new VoucherDAO();
            voucherDAO.addVoucher(name, voucher, startTime, endTime);
            request.setAttribute("mess", "Thêm Thành Công");

            request.getRequestDispatcher("advoucher.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("advoucher.jsp");
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
