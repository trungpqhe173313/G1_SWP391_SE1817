/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.StoreDAO;
import Model.Store;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author xdrag
 */
public class StoreHolidayScheduleServlet extends HttpServlet {

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
            out.println("<title>Servlet StoreHolidayScheduleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StoreHolidayScheduleServlet at " + request.getContextPath() + "</h1>");
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
        StoreDAO sd = new StoreDAO();
        LocalDate today = LocalDate.now();
        Store store = sd.getStore();
        if (today.isBefore(store.getStartDate())
                || (today.isAfter(store.getStartDate().minusDays(1)) && today.isBefore(store.getEndDate().plusDays(1)))) {
            request.setAttribute("check", true);
        }
        request.setAttribute("store", store);
        request.getRequestDispatcher("viewStoreStatus.jsp").forward(request, response);

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
        String startDate_str = request.getParameter("startdate");
        String endDate_str = request.getParameter("enddate");
        String mss;
        StoreDAO sd = new StoreDAO();
        if (startDate_str.isEmpty() || endDate_str.isEmpty()) {
            mss = " Vui lòng chọn ngày hợp lệ";
            request.setAttribute("mss", mss);
        } else {
            LocalDate startDate = LocalDate.parse(startDate_str);
            LocalDate endDate = LocalDate.parse(endDate_str);
            if (startDate.isBefore(endDate.plusDays(1))) {
                Store s = sd.getStore();
                s.setStartDate(startDate);
                s.setEndDate(endDate);
                sd.UpdateStore(s);
                mss = "Đặt lịch nghỉ cho cửa hàng thành công";
            } else {
                mss = " Vui lòng chọn ngày hợp lệ";
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
            }
            request.setAttribute("mss", mss);
        }
        doGet(request, response);
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
