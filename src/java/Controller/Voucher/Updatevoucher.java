/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Voucher;

import Dal.VoucherDAO;
import Model.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class Updatevoucher extends HttpServlet {

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
            out.println("<title>Servlet Updatevoucher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Updatevoucher at " + request.getContextPath() + "</h1>");
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
        int vid = Integer.parseInt(request.getParameter("vid"));
        VoucherDAO dao = new VoucherDAO();
        Voucher voucher = dao.getVoucherById(vid);

        request.setAttribute("voucher", voucher);
        request.setAttribute("vid", vid);
        request.getRequestDispatcher("updatevoucher.jsp").forward(request, response);
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
        String voucherIdStr = request.getParameter("VoucherId");
        String name = request.getParameter("name");
        String discountStr = request.getParameter("voucher");
        String startTimeStr = request.getParameter("starttime");
        String endTimeStr = request.getParameter("endtime");

        // Validate parameters
        if (voucherIdStr == null || voucherIdStr.isEmpty()
                || name == null || name.isEmpty()
                || discountStr == null || discountStr.isEmpty()
                || startTimeStr == null || startTimeStr.isEmpty()
                || endTimeStr == null || endTimeStr.isEmpty()) {
            request.setAttribute("mess", "Các trường không được để trống.");
            request.getRequestDispatcher("updatevoucher.jsp").forward(request, response);
            return;
        }

        try {
            int voucherId = Integer.parseInt(voucherIdStr);
            float discount = Float.parseFloat(discountStr);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startTime = dateFormat.parse(startTimeStr);
            Date endTime = dateFormat.parse(endTimeStr);

            // Update voucher
            VoucherDAO voucherDAO = new VoucherDAO();
            voucherDAO.updateVoucher(voucherId, name, discount, startTime, endTime);
            request.setAttribute("mess", "Cập nhật voucher thành công.");
        } catch (NumberFormatException | ParseException e) {
            request.setAttribute("mess", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.");
            e.printStackTrace(); // Log exception for debugging
        }

        request.getRequestDispatcher("updatevoucher.jsp").forward(request, response);
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
