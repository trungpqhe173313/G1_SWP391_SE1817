/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.customer;

import Dal.ServicesDAO;
import Model.Services;
import Model.ServicesBooking;
import Model.Shift;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class ServicesBookingAjaxServlet extends HttpServlet {

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
        ServicesDAO d = new ServicesDAO();
        // Nhận dữ liệu từ yêu cầu
        String soDichVuStr = request.getParameter("soDichVu");
        String tongGiaStr = request.getParameter("tongGia");
        String[] dichVu = request.getParameterValues("dichVu[]");

        // Check if dichVu is null or empty
        if (dichVu == null || dichVu.length < 1) {
            // Clear the session attribute and redirect to appointment
            session.removeAttribute("services");
            request.getRequestDispatcher("appointment").forward(request, response);
        } else {
            // Clear any existing services attribute in the session
            if (session.getAttribute("services") != null) {
                session.removeAttribute("services");
            }

            try {
                // Chuyển đổi dữ liệu từ chuỗi sang số nguyên
                int soDichVu = Integer.parseInt(soDichVuStr);
                int tongGia = Integer.parseInt(tongGiaStr);
                List<Services> listServices = new ArrayList<>();

                for (String s : dichVu) {
                    listServices.add(d.getServiceById(Integer.parseInt(s)));
                }

                ServicesBooking sb = new ServicesBooking(tongGia, soDichVu, listServices);
                session.setAttribute("services", sb);
                // Chuyển tiếp đến trang đặt lịch
                request.getRequestDispatcher("appointment").forward(request, response);
            } catch (NumberFormatException e) {
                // Xử lý lỗi nếu có
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ");
            }
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
